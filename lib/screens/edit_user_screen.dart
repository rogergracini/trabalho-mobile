import 'package:flutter/material.dart';
import '../main.dart'; // Importa a lista global de roles e usuários

class EditUserScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final List<String> selectedRoles = [];

  EditUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            DropdownButtonFormField(
              items: roles.map((role) {
                return DropdownMenuItem(
                  value: role.id,
                  child: Text(role.name),
                );
              }).toList(),
              onChanged: (value) {
                selectedRoles.add(value as String);
              },
              decoration: const InputDecoration(labelText: 'Roles'),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para salvar as alterações do usuário
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
