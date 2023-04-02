import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/presentation/widgets/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key, required this.desktopBody, required this.mobileBody}) : super(key: key);

  final Widget mobileBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
          if(constraints.maxWidth < mobileWidth){
            return mobileBody;
          } else {
            return desktopBody;
          }
      },
    );
  }
}
