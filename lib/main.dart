import 'package:flutter/material.dart';

import 'custom_alert/custom_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomAlert Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomAlert Demo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(Icons.check_circle, color: Colors.green),
            title: const Text('Show Success Alert'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => CustomAlert.show(
              context,
              AlertType.success,
              'Success',
              'Operation completed successfully.',
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.error, color: Colors.red),
            title: const Text('Show Error Alert'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => CustomAlert.show(
              context,
              AlertType.error,
              'Error',
              'An error occurred while processing your request.',
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.warning, color: Colors.orange),
            title: const Text('Show Warning Alert'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => CustomAlert.show(
              context,
              AlertType.error,
              'Warning',
              'This action may have unintended consequences.',
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.blue),
            title: const Text('Show Info Alert'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => CustomAlert.show(
              context,
              AlertType.info,
              'Information',
              'Please read the terms and conditions carefully',
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.grey),
            title: const Text('Show Confirmation Alert'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => CustomAlert.show(
              context,
              AlertType.confirm,
              'Confirmation',
              'Are you sure you want to proceed?',
              onConfirm: () {
                print('Confirmed');
              },
              onCancel: () {
                print('Cancelled');
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.circle_outlined, color: Colors.blue),
            title: const Text('Show Loading Alert'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              CustomAlert.show(
                context,
                AlertType.loading,
                'Loading',
                'Processing data...',
              );

              // Simulate a delay for loading purposes
              Future.delayed(const Duration(seconds: 3), () {
                Navigator.of(context).pop(); // Close the loading dialog
              });
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
