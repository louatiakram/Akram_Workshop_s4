import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profil mis à jour avec succès")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paramètres du profil"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Image.asset("assets/images/minecraft.jpg", height: 200),
            const SizedBox(height: 20),
            TextFormField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Mot de passe actuel",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Le mot de passe ne doit pas etre vide";
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nouveau mot de passe",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Le mot de passe ne doit pas etre vide";
                }
                if (value.length < 6) {
                  return "Le mot de passe doit contenir au moins 6 caractères";
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Adresse de facturation",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "L'adresse email ne doit pas etre vide";
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return "Veuillez entrer une adresse email valide";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              child: const Text("Enregistrer"),
            ),
          ],
        ),
      ),
    );
  }
}