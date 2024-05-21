import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_task9/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  List<User> users = [];

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
      theme: ThemeData(scaffoldBackgroundColor: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          // title: const Text('Add User'),
        ),
        body:Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Container(color: Colors.blueGrey[50], height: 300,
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
                       
                      Row(
                       
                        children: [
                          const Padding(padding: EdgeInsets.fromLTRB(40.0, 60.0, 0.0, 0.0)), 
                          Container(width: 200,),
                          ElevatedButton( style: ButtonStyle (
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.grey)
                              )
                            )
                          ),
                            
                                                          onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                                                 
                                        users.add(User(
                                            userNameController.text,
                                            emailController.text,
                                            passwordController.text,
                                            //confirmPasswordController.text
                                            ));
                          
                                        // to reset all text controllers
                                        userNameController.clear();
                                        emailController.clear();
                                        passwordController.clear();
                                        confirmPasswordController.clear();
                                      }
                                    },
                                    child: Text('Sigen UP')),
                        ],
                      ),
                            
                ],
              ),
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
                return " $validation is required!";
              }
              else if(keyboardType == TextInputType.emailAddress && !isEmailValid(value.toString())){
                return "Please enter a valied $validation";
              }
              else if(validation == 'confirmed password' && !isPasswordConfirmed(passwordController.text, value.toString())){
                return "Please enter a $validation";
              }
               else {
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

  bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

   bool isPasswordConfirmed(String password, String cPassword) {
     if(password == cPassword){
      return true;
    }
    else{
      return false;
    }
  }
}
