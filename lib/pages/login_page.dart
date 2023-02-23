import 'package:cash/components/my_button.dart';
import 'package:cash/components/my_textfiled.dart';
import 'package:cash/components/square_tile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 25),

              //logo
              const Icon(
                Icons.lock,
                size: 70,
              ),

              const SizedBox(height: 25),

              //mensagem
              Text('Bem vindo de volta!!!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  )),

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
                hintText: 'passwored',
                obscureText: true,
              ),
              //parei o video no 8:00 https://www.youtube.com/watch?v=Dh-cTQJgM-Q

              const SizedBox(height: 10),

              //forgot passowrd?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Esqueceu a senha ?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              //sign in
              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 20),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              // google + apple sigh in buttons

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                  //google images
                  SquareTile(imagePath: 'lib/images/google.png'),

                  SizedBox(width: 10),

                  //apple images
                  SquareTile(imagePath: 'lib/images/apple.png'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
