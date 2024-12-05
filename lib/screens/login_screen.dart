import 'package:flutter/material.dart';
import '../main.dart'; // Certifique-se de importar o arquivo correto onde está a lista registeredUsers

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _limpaControllers();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Login'),
        backgroundColor: Colors.orange, // Define a cor de fundo da AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 250), // Espaço entre o título e o primeiro campo
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(), // Adiciona borda ao campo
                contentPadding: EdgeInsets.all(12), // Espaçamento interno
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20), // Espaço entre os campos
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(), // Adiciona borda ao campo
                contentPadding: EdgeInsets.all(12), // Espaçamento interno
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30), // Espaço maior antes do botão
            ElevatedButton(
              onPressed: () {
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();

                // Verifica se o usuário existe
                final user = registeredUsers.firstWhere(
                  (element) => element['email'] == email,
                  orElse: () => {},
                );

                if (user.isNotEmpty) {
                  if (user['password'] == password) {
                    Navigator.pushNamed(context, '/users');
                  } else {
                    _exibirMensagem(context, 'SENHA INCORRETA');
                  }
                } else {
                  _exibirMensagem(context, 'USUÁRIO NÃO EXISTE');
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

  void _limpaControllers() {
    _emailController.clear();
    _passwordController.clear();
  }

  void _exibirMensagem(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          mensagem,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
