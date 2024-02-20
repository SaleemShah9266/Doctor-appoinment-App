import 'package:doctorapp/components/button.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primarycolor,
            decoration: InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primarycolor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primarycolor,
            obscureText: obsecurePass,
            decoration: InputDecoration(
              hintText: 'Password ',
              labelText: 'Password',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.lock_outlined),
              prefixIconColor: Config.primarycolor,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obsecurePass = !obsecurePass;
                    });
                  },
                  icon: obsecurePass
                      ? Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.black38,
                        )
                      : Icon(
                          Icons.visibility_outlined,
                          color: Config.primarycolor,
                        )),
            ),
          ),
          Config.spaceSmall,
          Button(
            width: double.infinity,
            title: "sign In",
            onpress: () {
              Navigator.of(context).pushNamed('main');
            },
            disable: false,
          ),
          
        ],
      ),
    );
  }
}
