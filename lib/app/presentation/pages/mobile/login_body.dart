import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/domain/use_cases/user_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/user.dart';
import '../homepage.dart';

class SignIn_mobile extends ConsumerStatefulWidget {

  const SignIn_mobile({Key? key}) : super(key: key);

  @override
  ConsumerState<SignIn_mobile> createState() =>_SignIn_mobileState();
}

class _SignIn_mobileState extends ConsumerState<SignIn_mobile> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 4. use ref.watch() to get the value of the provider
    final UserFuture = ref.watch(UserUseCaseProvider);
    return Scaffold(
      backgroundColor: Color(0xffe8ebed),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -20, //For moving according to the screen when the keyboard popsup.
          alignment: Alignment.bottomCenter,
          child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 180,
                        width: 600,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset("assets/images/friendship.png"),
                        ),
                      ),
                    ],
                  ),


                  const SizedBox(height: 60),


                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffe1e2e3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w800),
                                )),
                            const SizedBox(height: 5),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 5),
                              decoration: const BoxDecoration(
                                  color: Color(0xfff5f8fd),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              child: TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  hintText: "Email",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                ),
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return 'Please entre email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 5),
                              decoration: const BoxDecoration(
                                  color: Color(0xfff5f8fd),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: "Password",
                                  border: InputBorder.none,
                                  prefixIcon:
                                  Icon(Icons.vpn_key, color: Colors.grey),
                                ),
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return 'Please entre le password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ]),
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.w500),
                        )),
                  ),

                  const SizedBox(height: 25),

                  //From here the signin buttons will occur.

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                          elevation: 3,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 50),
                          onPressed: ()  async {
                            if(formKey.currentState!.validate()){
                              User user = await UserFuture.Login(emailController.value.text,
                                  passwordController.value.text);
                              Navigator.push(context,
                                  PageRouteBuilder(pageBuilder: (context,
                                      animation, secondaryAnimation) =>
                                      HomePage(user: user),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child){
                                        var begin = const Offset(0.0, 1.0);
                                        var end = Offset.zero;
                                        var curve = Curves.easeInCirc;

                                        var tween = Tween(begin: begin,
                                            end: end).
                                        chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );  }));
                            }
                          },
                          color: Colors
                              .deepPurpleAccent,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ), //Not bad=>Color(0xff1d56b8),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )),
                      const SizedBox(width: 10),
                      GestureDetector(
                        //Signin with google button.
                        onTap: () {
                          //I changed it from raised button to container and then added gesture control to add an image of google.
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: const BoxDecoration(
                                color: Color(0xfff5f8fd),
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    //Created this shadow for looking elevated.
                                    //For creating like a card.
                                      color: Colors.black12,
                                      offset: Offset(0.0,
                                          18.0), // This offset is for making the the lenght of the shadow and also the brightness of the black color try seeing it by changing its values.
                                      blurRadius: 15.0),
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0.0, -04.0),
                                      blurRadius: 10.0),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center, // I had added main axis allignment to be center to make to be at the center.
                              children: [
                                const Text(
                                  "Sign In With",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.deepPurpleAccent,
                                      fontWeight: FontWeight.w700),
                                ),
                                Image.asset(
                                  "assets/images/google.png",
                                  height: 40,
                                )
                              ],
                            )),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text("Don't have an account?"),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: const Text("Register now",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.deepPurpleAccent)),
                      ),
                    )
                  ]),
                ],
              )
          ),
        ),
      ),
    );
  }
}