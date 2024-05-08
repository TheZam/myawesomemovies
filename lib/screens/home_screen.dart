import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFFFFFF),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('My movies'),
            ),
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Cc',
                  ),
                ],
              ),
            ),),
      ),
    );
  }
}
