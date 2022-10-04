import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPw extends StatefulWidget {
  const ResetPw({Key? key}) : super(key: key);

  @override
  State<ResetPw> createState() => _ResetPwState();
}

class _ResetPwState extends State<ResetPw> {
  final _emailcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();

    super.dispose();
  }

  // ignore: non_constant_identifier_names
  Future Reset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailcontroller.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password Has Been sent to your mail"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter the email address for reset password",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: ' Enter the email Id',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Reset();
              },
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: const Center(
                    child: Text(
                  'Reset Password',
                  style: TextStyle(color: Color.fromARGB(255, 0, 166, 255)),
                )),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: const Center(
                    child: Text(
                  'Back',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                )),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
