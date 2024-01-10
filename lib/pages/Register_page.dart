import 'package:flutter/material.dart';
import 'package:minimalchatapp/Components/my_button.dart';
import 'package:minimalchatapp/Components/my_textfield.dart';
import 'package:minimalchatapp/auth/auth_service.dart';

class registerpage extends StatelessWidget {
  final void Function()? onTap;
  registerpage({super.key, required this.onTap});
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController cpasswordcontroller = TextEditingController();

  void register(BuildContext context) {
    final _auth = AuthService();
    if (passwordcontroller.text == cpasswordcontroller.text) {
      try {
        _auth.signupwithemailpassword(
            emailcontroller.text, passwordcontroller.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            //text
            SizedBox(
              height: 50,
            ),
            Text(
              "Lets create an Account for you",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),
            MyTextField(
              hinttext: "Email",
              controller: emailcontroller,
              obscureText: false,
            ),
            SizedBox(
              height: 15,
            ),
            MyTextField(
              controller: passwordcontroller,
              hinttext: "Password",
              obscureText: true,
            ),
            SizedBox(
              height: 15,
            ),
            MyTextField(
              controller: cpasswordcontroller,
              hinttext: "Confirm Password",
              obscureText: true,
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              text: "register",
              onTap: () => register(context),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account ? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
