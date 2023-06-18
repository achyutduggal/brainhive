import 'package:brainhive/Components/Roundbutton.dart';
import 'package:brainhive/Resources/auth_methods.dart';
import 'package:brainhive/Screens/main_screen.dart';
import 'package:brainhive/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  static const id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isButtonDisabled = true;
  bool _isLoading = false;

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(email: _emailController.text, password: _passwordController.text);

    setState(() {
      _isLoading = false;
    });
  }


  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isButtonDisabled = false;
      });
    } else {
      setState(() {
        _isButtonDisabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onChanged: (value) => _validateInputs(),
              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(

                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onChanged: (value) => _validateInputs(),
              ),
              const SizedBox(height: 16.0),
              GradientButtonFb4(text: 'Login', onPressed: _isButtonDisabled
                  ? null
                  : () {
                loginUser();
                Navigator.pushNamed(context, MainScreen.id);
              },),

            ],
          ),
        ),
      ),
    );
  }
}