import 'package:flutter/material.dart';
import 'package:news_short/Authentication/components/my_text_field.dart';
import 'package:news_short/Authentication/components/my_button.dart';
import 'package:news_short/Authentication/components/square_tile.dart';
import 'package:news_short/Authentication/login_page.dart';
import 'package:news_short/Authentication/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),

                const SizedBox(height: 25),

                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                MyButton(onTap: (){},
                Mytext: 'Sign Up',),

                const SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          )
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('or continue with',
                          style: TextStyle(
                              color: Colors.grey[700]
                          ),),
                      ),

                      Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          )
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                        imagePath: 'images/icons/google.png'),
                    SquareTile(
                      onTap: (){},
                        imagePath: 'images/icons/facebook.png'),
                  ],
                ),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?',
                      style: TextStyle(
                          color: Colors.grey[700]
                      ),),
                    const SizedBox(width: 6,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: const Text('Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,

                        ),),
                    )
                  ],
                ),

                const SizedBox(height: 50),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
