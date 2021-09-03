import 'package:auntie_rafiki/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  final form = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
              Image.asset('assets/icons/udsm_logo.png'),
              // Email field
              TextFormField(
                controller: emailcontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email is required';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  // fillColor: Colors.purpleAccent,
                  hintText: 'emailaddress',
                  labelText: 'emailaddress',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Password field
              TextFormField(
                controller: passwordcontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password is required';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                obscureText: isVisible,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                      onTap: changeVisibility,
                      child: isVisible
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.remove_red_eye_outlined)),
                  filled: true,
                  // fillColor: Colors.purpleAccent,
                  hintText: 'password',
                  labelText: 'password',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (form.currentState!.validate()) {
                              print(emailcontroller.text);
                              print(passwordcontroller.text);

                              final result = authProvider.login(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text);

                              if (result) {
                                Navigator.of(context).pushNamed('home_page');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Invalid Credentials')));
                              }
                            }
                          },
                          child: Text('login'))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
