import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ullamki/components/my_button.dart';
import 'package:ullamki/components/my_textfield.dart';
import 'package:ullamki/service/auth_api.dart';

class SignUpScreen extends StatefulWidget {
  final Function()? onTap;
  const SignUpScreen({super.key, required this.onTap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircularProgressIndicator(),
                ]),
          );
        });
    try {
      final AuthAPI appwrite = context.read<AuthAPI>();
      await appwrite.createUser(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      );
      Navigator.pop(context);
      const snackbar = SnackBar(content: Text('Account created!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } on AppwriteException catch (e) {
      Navigator.pop(context);
      showAlert(title: 'Account creation failed', text: e.message.toString());
    }
  }

  showAlert({required String title, required String text}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'skip',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // logo
              Text(
                'Sign Up',
                style: Theme.of(context).textTheme.displayMedium,
              ),

              const SizedBox(height: 20),

              // welcome back, you've been missed!
              Text('Welcome back you\'ve been missed!',
                  style: Theme.of(context).textTheme.bodyLarge),

              const SizedBox(height: 20),
              // name textfield
              MyTextField(
                controller: emailController,
                hintText: 'Name',
                obscureText: false,
              ),

              const SizedBox(height: 10),
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

              // conformPassword textfield
              // MyTextField(
              //   controller: confirmPasswordController,
              //   hintText: 'Confirm Password',
              //   obscureText: true,
              // ),

              // const SizedBox(height: 10),

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
                        onPressed: signUp,
                        child: Text(
                          'Sign Up',
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

              const SizedBox(height: 20),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member?',
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Sign In now',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
