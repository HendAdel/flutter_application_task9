import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add User'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              textFields(
                  label: 'E-mail',
                  // icon: Icons.email,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress),
              textFields(
                  label: 'Username',
                  // icon: Icons.person,
                  obscureText: false,
                  keyboardType: TextInputType.text),
              textFields(
                  label: 'Password',
                  //  icon: Icons.password,
                  obscureText: true),
              textFields(
                  label: 'Confirm Password',
                  // icon: Icons.password,
                  obscureText: true,
                  textInputAction: TextInputAction.done),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFields({
    required String label,
    // required IconData icon,
    bool obscureText = true,
    int? maxLength,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextFormField(
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              //prefixIcon: Icon(icon),
              label: Text(label)),
          maxLength: maxLength,
          obscureText: obscureText,
          maxLines: obscureText ? 1 : null,
        ))
      ],
    );
  }
}
