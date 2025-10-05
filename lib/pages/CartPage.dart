import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String image; // asset path or network url
  final int price; // price in whole TND units for simplicity

  CartItem({
    required this.id,
    required this.image,
    required this.price,
  });
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Demo data (remplace les chemins d'image par tes assets)
  List<CartItem> _items = [
    CartItem(id: 'a', image: 'assets/images/dmc5.jpg', price: 200),
    CartItem(id: 'b', image: 'assets/images/re8.jpg', price: 200),
    CartItem(id: 'c', image: 'assets/images/nfs.jpg', price: 100),
  ];

  // Item temporaire pour "undo"
  CartItem? _recentlyRemovedItem;
  int? _recentlyRemovedIndex;

  int get total => _items.fold(0, (sum, it) => sum + it.price);

  void _removeItem(int index) {
    setState(() {
      _recentlyRemovedItem = _items[index];
      _recentlyRemovedIndex = index;
      _items.removeAt(index);
    });

    // Show snackbar with undo
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Article supprimé (${_recentlyRemovedItem!.price} TND). Total = $total TND',
        ),
        action: SnackBarAction(
          label: 'Annuler',
          onPressed: () {
            // restore
            setState(() {
              if (_recentlyRemovedItem != null && _recentlyRemovedIndex != null) {
                final insertIndex = _recentlyRemovedIndex!.clamp(0, _items.length);
                _items.insert(insertIndex, _recentlyRemovedItem!);
                _recentlyRemovedItem = null;
                _recentlyRemovedIndex = null;
              }
            });
          },
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final item = _items[index];

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: ListTile(
        leading: Container(
          width: 120,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey[200],
            image: DecorationImage(
              image: AssetImage(item.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${item.price} TND', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _confirmDelete(context, index),
              tooltip: 'Supprimer',
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext ctx, int index) {
    showDialog<void>(
      context: ctx,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer l\'article'),
        content: Text('Voulez-vous vraiment supprimer  (${_items[index].price} TND) ?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Annuler')),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _removeItem(index);
            },
            child: const Text('Supprimer', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panier'),
      ),
      body: Column(
        children: [
          // Total bar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Total : $total TND', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const Divider(height: 1),
          // List
          Expanded(
            child: _items.isEmpty
                ? const Center(child: Text('Panier vide'))
                : ListView.builder(
              itemCount: _items.length,
              itemBuilder: _buildListItem,
            ),
          ),
        ],
      ),
    );
  }
}
