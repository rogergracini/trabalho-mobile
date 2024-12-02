import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../main.dart'; // Importa a lista global de usuários e roles

class RegisterScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final List<String> selectedRoles = [];

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Usuário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              items: roles.map((role) {
                return DropdownMenuItem(
                  value: role.id,
                  child: Text(role.name),
                );
              }).toList(),
              onChanged: (value) {
                if (!selectedRoles.contains(value)) {
                  selectedRoles.add(value as String);
                }
              },
              decoration: const InputDecoration(labelText: 'Roles'),
            ),
            ElevatedButton(
              child: const Text('Se Registrar'),
              onPressed: () {
                final name = _nameController.text.trim();
                final email = _emailController.text.trim();
                final password = _passwordController.text;

                if (kDebugMode) {
                  print(registeredUsers);
                }
                bool usuarioJaCadastrado = false;
                for (var element in registeredUsers) {
                  if (element['email'] == _emailController.text) {
                    usuarioJaCadastrado = true;
                  }
                }
                if (kDebugMode) {
                  print('usuarioNaoCadastrado==> $usuarioJaCadastrado');
                }
                if (usuarioJaCadastrado) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      elevation: 10.0,
                      backgroundColor: Colors.red,
                      content: Text(
                        'EMAIL JA CADASTRADO !!!',
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }

                if (!usuarioJaCadastrado) {
                  if (name.isNotEmpty &&
                      email.isNotEmpty &&
                      password.isNotEmpty && selectedRoles.isNotEmpty) {
                    // Adiciona o usuário à lista global
                    registeredUsers.add({
                      'name': name,
                      'email': email,
                      'password': password,
                      'roles': selectedRoles.join(', '), // Salva roles associadas ao usuário
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'User $name registered successfully!',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );

                    Navigator.pop(context); // Volta para a tela anterior
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please fill all fields and select at least one role',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                }
                _limpaControllers();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _limpaControllers() {
    _emailController.clear();
    _nameController.clear();
    _passwordController.clear();
    selectedRoles.clear();
  }
}
