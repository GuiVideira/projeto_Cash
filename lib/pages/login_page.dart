import 'package:cash/components/my_textfiled.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            MyTextField(),

            const SizedBox(height: 10),

            //password textfield
            MyTextField()
        ],
      ),
          )),
    );
  }
}
