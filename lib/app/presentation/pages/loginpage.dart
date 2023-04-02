import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/presentation/widgets/utils/responsive_layout.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'mobile/login_body.dart';
import 'desktop/login_body.dart';

class LoginPage extends ConsumerStatefulWidget  {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() =>_LoginPagedWidgetState();
}

class _LoginPagedWidgetState extends ConsumerState<LoginPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        desktopBody: SignIn_Desk(),
        mobileBody: SignIn_mobile()
    );
  }
}