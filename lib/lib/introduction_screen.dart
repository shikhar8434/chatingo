import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';


class OnboardingScreen extends StatelessWidget{

  List<PageViewModel> getPages(){
    return[
      PageViewModel(
        image: Image.asset("assets/images/chat4.jpg"),
        title: "Socialize",

      ),

    ];
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
          pages: getPages(),
          onDone: () {},
          done: Text("Done",style: TextStyle(color: Colors.red),)
      ),
    );
  }
  
}

