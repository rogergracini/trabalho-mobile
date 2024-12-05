import 'package:flutter/material.dart';
import 'package:user_management_app/models/role.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/users_screen.dart';
import 'screens/roles_screen.dart'; // Importa a tela de listagem de roles
import 'screens/register_role_screen.dart'; // Importa a tela de cadastro de role

// Lista global para armazenar os usuários registrados
List<Map<String, String>> registeredUsers = [];

// Lista global para armazenar as roles
List<Role> roles = [
  Role(id: '1', name: 'Admin'),
  Role(id: '2', name: 'User'),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Conectar',
      theme: ThemeData(primarySwatch: Colors.blue), // Use uma cor MaterialColor aqui
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/users': (context) => const UsersScreen(),
        '/roles': (context) => const RolesScreen(), // Rota para a tela de roles
        '/register_role': (context) => RegisterRoleScreen(), // Rota para cadastro de role
      },
    );
  }
}
