import 'package:flutter/material.dart';

class MyDesktopBody extends StatefulWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  State<MyDesktopBody> createState() => _MyDesktopBodyState();
}

class _MyDesktopBodyState extends State<MyDesktopBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text('On DeskTop'),
      ),
      body: Row(
        children: [
          //First Column
          Expanded(
            child: Column(
              children: [

                //Youtube video
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 16/9,
                    child: Container(
                      height: 250,
                      color: Colors.deepOrange[400],
                    ),
                  ),
                ),

                //comment section & recommanded videos

                Expanded(
                    child: ListView.builder(itemBuilder: (context, index){
                      return Container(
                        height: 120,
                        color: Colors.deepOrange[200],
                      );
                    })
                )
              ],
            ),
          ),

          //Second Column
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              color: Colors.deepPurple[300],
            ),
          )
        ],
      ),
    );
  }
}

