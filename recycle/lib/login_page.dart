import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recycle/home_page.dart';
import 'package:recycle/sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle title = TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
          child:Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Dianoga Recycling Tracker',style: title),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton(){
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: (){
        signInWithGoogle().whenComplete((){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context){
                return HomePage();
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"),height:35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignOutScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
          //   children: <Widget>[
          //     CircleAvatar(
          //       backgroundImage: NetworkImage(
          //         imageUrl,
          //       ),
          //       radius: 60,
          //       backgroundColor: Colors.transparent,
          //     ),
          //     SizedBox(height: 40),
          //     Text(
          //       'NAME',
          //       style: TextStyle(
          //         fontSize: 15,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black54,
          //       ),
          //     ),
          //     Text(
          //       name,
          //       style: TextStyle(
          //         fontSize: 25,
          //         color: Theme.of(context).primaryColorDark,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     SizedBox(height: 20),
          //     Text(
          //       'EMAIL',
          //       style: TextStyle(
          //         fontSize: 15,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black54,
          //       ),
          //     ),
          //     Text(
          //       email,
          //       style: TextStyle(
          //         fontSize: 25,
          //         color: Theme.of(context).primaryColorDark,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     SizedBox(height: 40),
          //     RaisedButton(
          //       onPressed: (){
          //         signOutGoogle();
          //         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){return LoginPage();}), ModalRoute.withName('/'));
          //       },
          //       color: Theme.of(context).primaryColorDark,
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text(
          //           'Sign Out',
          //           style: TextStyle(fontSize:25,color:Colors.white),
          //         ),
          //       ),
          //       elevation: 5,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(40),
          //       ),
          //     ),
          //   ],
          ),
        ),
      ),
    );
  }
}