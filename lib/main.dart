import 'dart:ui';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xfff01257);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Chatingo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: PrimaryColor,
        scaffoldBackgroundColor: const Color(0xFFffffff),
      ),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }
  

  Widget _buildImage(String assetName) {


    return Align(



      child:
      Image.asset('assets/images/$assetName.jpg', width: 360.0,height: 360),
      alignment: Alignment.bottomCenter,

    );
  }

  @override
  Widget build(BuildContext context) {

    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(


      titleTextStyle: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w800,color: Colors.red,fontFamily: 'SnellRoundhand'),
      bodyTextStyle: TextStyle(fontSize: 24.0,fontFamily: 'SnellRoundhand',color: Colors.black, fontWeight: FontWeight.w400),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,

      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [

        PageViewModel(
          title: "Socialize",
          body:
          "Know more people , make new friends and explore new things",
          image: _buildImage('chat4'),
          decoration: pageDecoration,
        ),

        PageViewModel(

          title: "Chat",
          body:
          "Never Stop your heart from expressing emotions ",
          image: _buildImage('chat2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Video Calls",
          body:
          "Missing your friends or family? surprize them with a video call",
          image: _buildImage('chat5'),

          decoration: pageDecoration,
        ),

        PageViewModel(
          title: "Step into the world of Chatingo",

          bodyWidget:
              Container(

                child: Text(
                  'Get Started',
                  textAlign: TextAlign.center,

                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 32),
                ),
             
                margin: EdgeInsets.fromLTRB(14, 28, 14, 14),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xfff01257),
                  border: Border.all(width: 1.00, color: Color(0xffffffff),), borderRadius: BorderRadius.circular(20.00),
                  gradient: new LinearGradient(colors: [const Color(0xFFDD1151),const Color(0xffED6A93)],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      stops: [0.0,1.4],
                      tileMode: TileMode.clamp)

                ),

    ),
          image: _buildImage('chat2'),


          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        spacing: const EdgeInsets.all(4.0),
        size: Size(15.0, 15.0),
        color: Color(0xFFBDBDBD),
        activeColor: Color(0xFFf01257),
        activeSize: Size(15.0, 15.0),

      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chatingo')),
      body:
    new Container(
    height: double.infinity,
    width: double.infinity,
    decoration: new BoxDecoration(
    gradient: new LinearGradient(colors: [const Color(0xFFDD1151),const Color(0xFFB092D)],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    stops: [0.0,1.0],
    tileMode: TileMode.clamp)
    ),

      child: Column(



        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.center,




        children: <Widget>[
          SizedBox(height: 65),



          new Container(



            child: Column(
              children: <Widget>[

                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: TextField(
                      decoration: InputDecoration(prefixIcon: Icon(Icons.account_box,color: Colors.red,),enabledBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.red,width: 2.0)),hintText: 'Username'),

                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: TextField(

                      decoration: InputDecoration(prefixIcon : Icon(Icons.lock,color: Colors.red), enabledBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.red,width: 2.0)),hintText: 'Password'),

                    ),

                  ),
                ),
                Container(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 6, 28, 14),
                    
                    child: Text(
                        'Forgot Password?',
                      style: TextStyle(color: Color(0xfff01257),fontSize: 17,fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,

                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28, 0, 28, 8),
                    child: Text(
                      "New User? Sign Up",
                      style: TextStyle(color: Color(0xfff01257),fontSize: 17,fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,

                    ),
                  ),
                )
              ],
            ),


            height: 302.00,
            width: 283.00,
            decoration: BoxDecoration(

              color: Color(0xffffffff),
              border: Border.all(width: 1.00, color: Color(0xffffffff),), borderRadius: BorderRadius.circular(55.00),
            ),
          ),
          SizedBox(height: 15),
          new Container(
            child: Center(
              child: InkWell(
                onTap: (){
                  _navigateToNextScreen(context);
                },
                child: Text(
                  'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,fontSize: 20),

                ),

              ),
            ),

            height: 55.00,
            width: 301.00,
            decoration: BoxDecoration(
              color: Color(0xfff01257),
              border: Border.all(width: 1.00, color: Color(0xfff01257),), borderRadius: BorderRadius.circular(20.00),
            ),

          ),
          SizedBox(height: 51),

          new Container(
            child: Image.asset('assets/images/Social.png') ,


            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(

                color: Color(0xfff01257),
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.elliptical(60, 30),
                  topRight: const Radius.elliptical(60,30),
                )
            ),
          ),






        ],
      ),
    ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chatingo')),
      body:
      new Container(
        height: double.infinity,
        width: double.infinity,
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [const Color(0xFFDD1151),const Color(0xFFB092D)],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: [0.0,1.0],
                tileMode: TileMode.clamp)
        ),

        child: Column(



          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,




          children: <Widget>[
            SizedBox(height: 65),



            new Container(



              child: Column(
                children: <Widget>[

                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        decoration: InputDecoration(prefixIcon: Icon(Icons.account_box,color: Colors.red,),enabledBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.red,width: 2.0)),hintText: 'Username'),

                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        decoration: InputDecoration(prefixIcon: Icon(Icons.mail_outline,color: Colors.red,),enabledBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.red,width: 2.0)),hintText: 'Email'),

                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(

                        decoration: InputDecoration(prefixIcon : Icon(Icons.lock,color: Colors.red), enabledBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.red,width: 2.0)),hintText: 'Password'),

                      ),

                    ),
                  ),


                ],
              ),


              height: 302.00,
              width: 283.00,
              decoration: BoxDecoration(

                color: Color(0xffffffff),
                border: Border.all(width: 1.00, color: Color(0xffffffff),), borderRadius: BorderRadius.circular(55.00),
              ),
            ),
            SizedBox(height: 15),
            new Container(
              child: Center(

                  child: Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,fontSize: 20),

                  ),


              ),

              height: 55.00,
              width: 301.00,
              decoration: BoxDecoration(
                color: Color(0xfff01257),
                border: Border.all(width: 1.00, color: Color(0xfff01257),), borderRadius: BorderRadius.circular(20.00),
              ),

            ),
            SizedBox(height: 51),

            new Container(
              child: Image.asset('assets/images/Social.png') ,


              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(

                  color: Color(0xfff01257),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.elliptical(60, 30),
                    topRight: const Radius.elliptical(60,30),
                  )
              ),
            ),






          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


