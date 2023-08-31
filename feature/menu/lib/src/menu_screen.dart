import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final VoidCallback onTodoMenu;
  final VoidCallback onHelloMenu;

  const MenuScreen({
    super.key,
    required this.onTodoMenu,
    required this.onHelloMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MENUS'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: onHelloMenu,
                child: const Text('HELLO WORLD'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onTodoMenu,
                child: const Text('TODO APP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
