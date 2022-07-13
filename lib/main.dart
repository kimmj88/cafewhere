import 'package:flutter/material.dart';
import 'package:flutter_application_1/CircleButton.dart';
import 'package:flutter_application_1/samplePage.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('my app'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 206, 191, 162),
                  image: DecorationImage(
                    image: AssetImage('assets/images/main_logo.jpg'),
                  ),
                  //color: Colors.red,
                ),
              ),
              Container(
                //color: Color.fromARGB(255, 216, 176, 174),
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 65.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CircleButton(),
                    CircleButton(),
                    CircleButton(),
                    CircleButton(),
                    CircleButton(),
                    CircleButton(),
                    CircleButton(),
                  ],
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.green),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.green),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) => {print('click')},
          currentIndex: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            // ignore: unnecessary_new
            new BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.save),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
        ),
      ),
    );
  }
}


        // Center(
        //   child: Image(
        //     image: AssetImage('assets/images/main_logo.jpg'),
        //   ),
        // ),
