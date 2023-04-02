import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/presentation/pages/desktop/home_body.dart';
import 'package:flutter_firebase/app/presentation/pages/mobile/home_body.dart';
import 'package:flutter_firebase/app/presentation/widgets/utils/responsive_layout.dart';

import '../../domain/entities/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final User? user;
  @override
  State<HomePage> createState() => _HomePageState(user: this.user!);
}

class _HomePageState extends State<HomePage> {
  _HomePageState({required this.user});
  final User ? user;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        desktopBody: MyDesktopBody(),
        mobileBody: MyMobileBody(user: user,)
    );
  }
}
