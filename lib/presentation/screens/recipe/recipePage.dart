import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Page'),
      ),
      body: Center(
        child: Text('Welcome to the Recipe Page!'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RecipePage(),
  ));
}
