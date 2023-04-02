import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/presentation/widgets/utils/responsive_layout.dart';
import 'desktop/signup_body.dart';
import 'mobile/singnup_body.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        desktopBody: SignUp_Desk(),
        mobileBody: SignUp_mobile()
    );
  }
}