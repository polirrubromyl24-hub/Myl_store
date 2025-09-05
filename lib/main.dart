import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyL Store',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  final String _password = "1234myl";
  String? _error;

  void _login() {
    if (_controller.text == _password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      setState(() {
        _error = "Clave incorrecta";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Ingrese clave de acceso", style: TextStyle(fontSize: 20)),
              TextField(
                controller: _controller,
                obscureText: true,
                decoration: InputDecoration(errorText: _error),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _login, child: const Text("Entrar")),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MyL Store")),
      body: const Center(
        child: Text(
          "Bienvenido a MyL Store 🚀\nAquí podrás agregar tus APKs para instalar.",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
