import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class SignUpPage extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpPage({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final occupationController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  double height = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: height)),
            Image.asset(
              'assets/pics/3249205.png',
              height: 150,
              width: 150,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "WELCOME!",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 40),
              child: Column(
                children: [
                  //custome details
                  TextFormField(
                    controller: nameController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Name",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: ageController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Age",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: heightController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Height (in cm)",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: weightController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Weight (in kg)",
                    ),
                  ),
                  TextFormField(
                    controller: occupationController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Occupation",
                    ),
                  ),
                  TextFormField(
                    //emailfield
                    controller: emailController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email.trim())
                            ? 'Enter a valid Email'
                            : null,
                  ),
                  TextFormField(
                    //passwordfield
                    controller: passwordController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? 'Password should be atleast 6 characters long'
                        : null,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              onPressed: signUp,
              // ignore: sized_box_for_whitespace
              child: Container(
                width: 100,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.lock_open),
                    SizedBox(width: 5),
                    Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 20, color: Colors.black),
                text: 'Already have an account? ',
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      text: 'Login Here',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (FirebaseAuth.instance.currentUser != null) {
        var json = {
          'age': ageController.text,
          'email': emailController.text.trim(),
          'height': heightController.text,
          'name': nameController.text.trim(),
          'occupation': occupationController.text.trim(),
          'weight': weightController.text,
        };

        var json2 = {
          'calories': 0,
          'coins': 0,
          'currSteps': 0,
          'distance': 0,
          'level': 0,
          'lastDaySaved': 0,
          'savedStepCount': 0,
          'totcalorie': 0,
          'totcoins': 0,
          'totdist': 0,
          'totlevel': 0,
        };

        final User user = FirebaseAuth.instance.currentUser!;
        final uid = user.uid;
        final detref =
            FirebaseFirestore.instance.collection('user-details').doc(uid);
        await detref.set(json);
        final stepref = FirebaseFirestore.instance.collection('steps').doc(uid);
        await stepref.set(json2);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
