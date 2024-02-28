import 'package:dependency_injection/device_service.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dependency Injection in Flutter ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("get_it"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(25),
          child: ElevatedButton(
            child: const Text(
              'Get Data',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () async {
              String fetchingData =
                  await locator<DeviceService>().initPlatformState();
              final snackBar = SnackBar(
                content: Text(fetchingData),
              );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          ),
        ),
      ),
    );
  }
}
