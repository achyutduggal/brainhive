import 'package:brainhive/Components/Roundbutton.dart';
import 'package:brainhive/Resources/auth_methods.dart';
import 'package:brainhive/Screens/main_screen.dart';
import 'package:brainhive/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  static const id = 'signup_screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Uint8List? image;
  bool _isLoading = false;
  //
  // void _selectProfilePhoto() async {
  //   //File picker not configured for IOS devices
  //   final ImagePicker _picker = ImagePicker();
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //
  //   if (image != null) {
  //     setState(() {
  //       _imageFile = File(image.path);
  //     });
  //   }
  // }

  PickImage(ImageSource source) async {
    final ImagePicker _imagepicker = ImagePicker();
    final XFile? _file = await _imagepicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    }
  }

  void imageselector() async {
    Uint8List _image = await PickImage(ImageSource.gallery);
    setState(() {
      image = _image;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      file: image!,
    );

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 150.0,
                ),
                GestureDetector(
                  onTap: imageselector,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.grey[200],
                    child: image == null
                        ? const Icon(Icons.add, size: 40.0)
                        : null,
                    backgroundImage: image != null ? MemoryImage(image!) : null,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _repeatPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Repeat Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please repeat your password';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    } else if (value.contains('@')) {
                      return 'Please enter a valid username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                GradientButtonFb4(
                  text: 'Sign Up',
                  onPressed: () {
                    if (_isLoading) {
                      const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    }
                    if (_formKey.currentState!.validate()) {
                      signUpUser();
                      Navigator.pushNamed(context, MainScreen.id);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
