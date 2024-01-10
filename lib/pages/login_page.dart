import 'package:flutter/material.dart';
import 'package:minimalchatapp/Components/my_button.dart';
import 'package:minimalchatapp/Components/my_textfield.dart';
import 'package:minimalchatapp/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final void Function()? onTap;
  LoginPage({super.key, this.onTap});
  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signinwithemailpassword(
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
              "Welcome back you've been missed",
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
              hinttext: "Passwords",
              obscureText: true,
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              text: "login",
              onTap: () => login(context),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member ? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register Now",
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
  }
}
