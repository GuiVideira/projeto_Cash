import 'package:cash/components/my_textfiled.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
          child: Center(
            child: Column(
        children:  [
          const SizedBox(height: 50),

          //logo
           const Icon(
              Icons.lock,
              size: 100,
            ),

            const SizedBox(height: 50),


            //mensagem
            Text(
              'Bem vindo de volta!!!',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              )
              ),

              
            const SizedBox(height: 25),

            //usermane textfield
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            //password textfield
            MyTextField(
              controller: passwordController,
              hintText: 'Username',
              obscureText: true,
            ),
            //parei o video no 8:00 https://www.youtube.com/watch?v=Dh-cTQJgM-Q
        ],
      ),
          )),
    );
  }
}
