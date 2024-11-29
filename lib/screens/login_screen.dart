import 'package:flutter/material.dart';
import 'package:user_management_app/main.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _limpaControllers();
    return Scaffold(
      appBar: AppBar(title: const Text('Tela de Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
            ElevatedButton(
              onPressed: () {
                print(registeredUsers);
                // bool registroCompleto = true;

                bool emailExiste = false;
                bool senhaCorreta = false;

                for (var element in registeredUsers) {
                  if (element['email'] == _emailController.text) {
                    emailExiste = true;
                  }
                }
                for (var element in registeredUsers) {
                  if (element['password'] == _passwordController.text) {
                    senhaCorreta = true;
                  }
                }

                if (emailExiste == true && senhaCorreta == true) {
                  Navigator.pushNamed(context, '/users');
                }
                if (emailExiste == true && senhaCorreta == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'SENHA INCORRETA',
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
                if (emailExiste == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'USUARIO NÃO EXISTE',
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(seconds: 3),
                    ),
                  );
                  _limpaControllers();
                }
              },
              child: const Text('Logar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Se Registrar'),
            ),
          ],
        ),
      ),
    );
  }

  _limpaControllers() {
    _emailController.clear();
    _passwordController.clear();
  }
}
