import 'package:flutter/material.dart';
import '../main.dart'; // Importa a lista global de usuários

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  UsersScreenState createState() =>
      UsersScreenState(); // Classe de estado pública
}

class UsersScreenState extends State<UsersScreen> {
  void _deleteUser(int index) {
    setState(() {
      registeredUsers.removeAt(index); // Remove o usuário da lista
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuários')),
      body: registeredUsers.isEmpty
          ? const Center(
              child: Text('No users registered'),
            )
          : ListView.builder(
              itemCount: registeredUsers.length,
              itemBuilder: (context, index) {
                final user = registeredUsers[index];
                return ListTile(
                  title: Text(user['name']!),
                  subtitle: Text(user['email']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteUser(index), // Remove usuário
                  ),
                );
              },
            ),
    );
  }
}
