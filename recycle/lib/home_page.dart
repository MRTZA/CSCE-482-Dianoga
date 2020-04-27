import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recycle/login_page.dart';
import 'package:recycle/sign_in.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomePage extends StatefulWidget{
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  /* this is the function that handles getting the image from the device*/
  File _image;
  Future _getImage() async {
    var image = await ImagePicker.pickImage(source:
    ImageSource.camera);

    setState(() {
      _image = image;}
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).primaryColor, 
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(name),
              decoration: BoxDecoration(
                color: Colors.green[500],
              ),
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>SignOutScreen()));
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: FloatingActionButton(
          onPressed: _getImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}
