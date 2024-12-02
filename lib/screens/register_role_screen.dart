import 'package:flutter/material.dart';
import '../models/role.dart';
import '../main.dart'; // Importa a lista global de roles

class RegisterRoleScreen extends StatelessWidget {
  final TextEditingController _roleNameController = TextEditingController();

  RegisterRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Role')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _roleNameController,
              decoration: const InputDecoration(labelText: 'Role Name'),
            ),
            ElevatedButton(
              onPressed: () {
                final roleName = _roleNameController.text.trim();
                if (roleName.isNotEmpty) {
                  roles.add(Role(id: DateTime.now().toString(), name: roleName));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$roleName registered successfully!'),
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
