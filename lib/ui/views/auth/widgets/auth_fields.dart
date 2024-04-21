import 'package:flutter/material.dart';

//
import 'package:quick_eats/ui/common/ui_helpers.dart';
import 'package:quick_eats/ui/views/auth/auth_viewmodel.dart';

class AuthFields extends StatelessWidget {
  final AuthViewModel model;
  const AuthFields(
    this.model, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          inputField(
              labelText: 'Email Id',
              hintText: 'Enter your email',
              controller: model.emailController,
              textInputAction: TextInputAction.next),
          verticalSpaceMedium,
          inputField(
              labelText: 'Password',
              hintText: 'Enter your password',
              controller: model.passwordController,
              textInputAction: TextInputAction.done),
          const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot your password?',
                style: TextStyle(color: Colors.blue),
              )),
          verticalSpaceMedium,
          Container(
              color: Colors.black,
              child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  onPressed: model.isFormValid,
                  child: const Text(
                    'Log in',
                    style: TextStyle(color: Colors.white),
                  ))),
          verticalSpaceMedium,
          verticalSpaceSmall,
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account yet? "),
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  TextField inputField({labelText, hintText, textInputAction, controller}) {
    return TextField(
      onChanged: (text) {},
      textInputAction: textInputAction,
      obscureText: labelText == 'Password' ? true : false,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
      ),
    );
  }
}
