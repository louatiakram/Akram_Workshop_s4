class Game {
  final String image;
  final String title;
  final String description;
  final int price;
  final int quantity;

  Game(this.image, this.title, this.description, this.price, this.quantity);

  @override
  String toString() {
    return 'Game{image: $image, title: $title, description: $description, price: $price, quantity: $quantity}';
  }
}