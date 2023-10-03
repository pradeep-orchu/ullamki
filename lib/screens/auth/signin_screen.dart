import 'package:flutter/material.dart';
import 'package:ullamki/components/my_button.dart';
import 'package:ullamki/components/my_textfield.dart';
import 'package:ullamki/service/auth_service.dart';

class SignInScreen extends StatefulWidget {
  final Function()? onTap;
  const SignInScreen({super.key, required this.onTap});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show loading circle
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );

    // try sign in
    authService.signInWithEmailAndPassword(
        emailController.text.trim(), passwordController.text.trim());
    // pop the loading circle
    // Navigator.pop(context);
  }

  void SignInAnonymously() {
    authService.SignInWithAnonymously();
  }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          TextButton(
              onPressed: SignInAnonymously,
              child: Text(
                'Skip',
                style: Theme.of(context).textTheme.bodySmall,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // logo
              Text(
                'Sign In',
                style: Theme.of(context).textTheme.displayMedium,
              ),

              const SizedBox(height: 20),

              // welcome back, you've been missed!
              Text('Welcome back you\'ve been missed!',
                  style: Theme.of(context).textTheme.bodyLarge),

              const SizedBox(height: 20),

              // email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    OutlinedButton(
                        onPressed: signUserIn,
                        child: Text(
                          'Sign In',
                        ))
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // google + apple sign in buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  //SquareTile(imagePath: 'lib/images/google.png'),
                  MyButton(
                      onTap: () {},
                      name: 'Google',
                      logo: AssetImage('assets/images/google-logo.png')),
                  SizedBox(height: 10),
                  MyButton(
                      onTap: () {},
                      name: 'Apple',
                      logo: AssetImage('assets/images/apple-logo.png')),
                  SizedBox(
                    height: 10,
                  ),
                  MyButton(
                      onTap: () {},
                      name: 'Facebook',
                      logo: AssetImage('assets/images/facebook-logo.png')),

                  // apple button
                  //SquareTile(imagePath: 'lib/images/apple.png')
                ],
              ),

              const SizedBox(height: 40),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
