import 'package:flutter/material.dart';
import 'package:user/Methods/Auth_methods.dart';
import 'package:user/view/pages/HomePage.dart';
import 'package:user/view/widgets/text_form.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _Signupscreen();
}

class _Signupscreen extends State<Signupscreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
  }

  void SignUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
        username: _usernamecontroller.text);
    if (res != 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res),
      ));
      setState(() {
        _isLoading = false;
      });
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 64,
                child: Text("Sign Up", style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 24),
              SizedBox(
                height: 24,
              ),
              Textfieldinput(
                  textEditingController: _usernamecontroller,
                  hinttext: 'Enter Your Username',
                  textInputType: TextInputType.text),
              const SizedBox(height: 24),
              Textfieldinput(
                  textEditingController: _emailcontroller,
                  hinttext: 'Enter Your Email',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 24),
              Textfieldinput(
                  textEditingController: _passwordcontroller,
                  hinttext: 'Enter Your Password',
                  textInputType: TextInputType.visiblePassword,
                  ispassword: true),
              const SizedBox(height: 24),
              InkWell(
                onTap: SignUpUser,

                // onTap: () async {
                //   String res = await Authmethod().signup(
                //       email: _emailcontroller.text,
                //       password: _passwordcontroller.text,
                //       username: _usernamecontroller.text,
                //       bio: _biocontroller.text,
                //       file: _image!);
                // },
                child: Container(
                  child: _isLoading
                      ? Center(
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text("Sign Up"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
              // Flexible(
              //   child: Container(),
              //   flex: 2,
              //)
            ],
          ),
        ),
      )),
    );
  }
}
