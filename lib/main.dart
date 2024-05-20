import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//ToDo: fix the refrance error
// import 'package:flutter_application_task9/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

@override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add User'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                textFields(
                    label: 'E-mail',
                    controller: emailController,
                    validation: 'E-mail address',
                    // icon: Icons.email,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress),
                textFields(
                    label: 'Username',
                    controller: userNameController,
                    validation: 'User name',
                    // icon: Icons.person,
                    obscureText: false,
                    keyboardType: TextInputType.text),
                textFields(
                    label: 'Password',
                    controller: passwordController,
                    validation: 'password',
                    //  icon: Icons.password,
                    obscureText: true),
                textFields(
                    label: 'Confirm Password',
                    controller: confirmPasswordController,
                    validation: 'confirmed password',
                    // icon: Icons.password,
                    obscureText: true,
                    textInputAction: TextInputAction.done),
                    ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  //ToDo: add the user to it's list

                                  // users.add(user(
                                  //     userNameController.text,
                                  //     emailController.text,
                                  //     passwordController.text,
                                  //     confirmPasswordController.text));

                                  // // to reset all text controllers
                                  // userNameController.clear();
                                  // emailController.clear();
                                  // passwordController.clear();
                                  // confirmPasswordController.clear();
                                }
                              },
                              child: Text('Sigen UP')),
                          
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFields({
    required String label,
    required TextEditingController controller,
    required String validation,
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
               autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == '') {
                return "Please enter a valied $validation";
              } else {
                return null;
              }
            },
              controller: controller,
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
