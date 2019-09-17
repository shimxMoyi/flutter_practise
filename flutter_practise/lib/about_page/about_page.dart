import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print('AboutPage create');
    return _AboutPageState();
  }
}

class _AboutPageState extends State<AboutPage>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
      ),
    );
  }
 
}