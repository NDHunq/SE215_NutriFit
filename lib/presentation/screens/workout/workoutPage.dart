import 'package:flutter/material.dart';

class WorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Workout Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
