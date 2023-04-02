import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/user.dart';

class MyMobileBody extends StatefulWidget {
  const MyMobileBody({Key? key, required this.user}) : super(key: key);
  final User ? user;

  @override
  State<MyMobileBody> createState() => _MyMobileBodyState(user:user!);
}

class _MyMobileBodyState extends State<MyMobileBody> {

  _MyMobileBodyState({required this.user});
  final User ? user;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(context, child) => Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: const Text('On Mobile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:Column(
            children: [
              //Youtube video
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: Container(
                    height: 250.h,
                    color: Colors.deepOrange[400],
                    child: Text(user!.email, style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24,
                        color: Colors.white),),
                  ),
                ),
              ),

              //comment section & recommanded videos
              Expanded(
                  child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120.h,
                              color: Colors.deepOrange[200],
                            ),
                          );
                      }
                  )
              )
            ],
          ),
        ),
      ),
      minTextAdapt: true,
    );
  }
}