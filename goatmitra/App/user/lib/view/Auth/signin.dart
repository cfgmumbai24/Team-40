import 'package:flutter/material.dart';
import 'package:user/Methods/Auth_methods.dart';
import 'package:user/view/Auth/signup.dart';
import 'package:user/view/pages/HomePage.dart';
import 'package:user/view/widgets/text_form.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isloading = false;

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  void NavigateToSignup() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Signupscreen()));
  }

  void loginUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailcontroller.text, password: _passwordcontroller.text);

    if (res == "seccess") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res),
      ));
    }
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            const Text(
              "Log In",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 64,
            ),
            Textfieldinput(
                textEditingController: _emailcontroller,
                hinttext: 'Enter Your Email',
                textInputType: TextInputType.emailAddress),
            const SizedBox(height: 24),
            Textfieldinput(
              textEditingController: _passwordcontroller,
              hinttext: 'Enter Your Password',
              textInputType: TextInputType.visiblePassword,
              ispassword: true,
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: loginUser,
              child: Container(
                child: _isloading
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.white))
                    : Text("Log in"),
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
              height: 12,
            ),
            Flexible(child: Container(), flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text("Don't have any account?"),
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                InkWell(
                  onTap: NavigateToSignup,
                  child: Container(
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
