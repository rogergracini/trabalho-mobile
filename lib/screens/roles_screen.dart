import 'package:flutter/material.dart';
import '../models/role.dart'; // Certifique-se de que este arquivo existe
import '../main.dart'; // Importa a lista global de roles

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  _RolesScreenState createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  void _editRole(int index, String newName) {
    setState(() {
      roles[index] = Role(id: roles[index].id, name: newName);
    });
  }

  void _deleteRole(int index) {
    setState(() {
      roles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/register_role');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: roles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(roles[index].name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Exibe um diálogo para editar a role
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        final TextEditingController _editController = TextEditingController();
                        _editController.text = roles[index].name;
                        return AlertDialog(
                          title: const Text('Edit Role'),
                          content: TextField(
                            controller: _editController,
                            decoration: const InputDecoration(labelText: 'Role Name'),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _editRole(index, _editController.text.trim());
                                Navigator.of(context).pop();
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _deleteRole(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
