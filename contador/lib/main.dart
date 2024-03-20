// https://github.com/Cynder71/Cookie-Counter

import 'package:flutter/material.dart';


void main(){
  runApp( const MaterialApp(debugShowCheckedModeBanner: false, home: CookieCounter()));
}

class CookieCounter extends StatefulWidget{
  const CookieCounter({super.key});

  @override
  State<CookieCounter> createState() => _CookieCounterState();

}

class _CookieCounterState extends State<CookieCounter> {

  //variable
  int _counter = 15;
  String _message = "Someone has left 15 \ncookies in a Jar...";

  //method
 void _cookieAnalyzer(bool isIncrement) {
  setState(() {
    if (isIncrement) {
      if (_counter == 29) {
        _message = "The Jar is full!";
        _counter = 30;
      } else if (_counter<30){
        _message = "";
        _counter++;
      }
    } else if(_counter>0) {
      if (_counter == 1) {
        _message = "The Jar is Empty";
        _counter = 0;
      } else {
        _message = "";
        _counter--;
      }
    }
  });
}
  //UI
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Row(
          children: [
            Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            Text(
              '  The Cookie Counter App',
              style: TextStyle(
              color: Colors.white,
              fontSize: 25, ),
            ),
          ],
        ),
      ),
      body: Container (
          decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage('images/many-cookies.jpeg'), 
          fit: BoxFit.cover, 
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text(
              "Amount of Cookies\n        in the Jar",
               style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            Text(
              _counter.toString(),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _cookieAnalyzer(false), 
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    ),
                    child: const Text(
                    "Take a Cookie \nfrom the Jar...",
                    style: TextStyle(
                     fontSize: 20,
                     color: Colors.white,
                    fontStyle: FontStyle.italic,
                     ),)
                  ),
                  ElevatedButton(
                  onPressed: () => _cookieAnalyzer(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                  ),
                  child: const Text(
                    "Put a Cookie in \nthe Jar!",
                    style: TextStyle(
                     fontSize: 20,
                     color: Colors.white,
                     fontStyle: FontStyle.italic,
                     ),
                  ),
                ),
                ]
              ),
              const SizedBox(height: 20),
              if (_message.isNotEmpty)
                Text(
                  _message,
                  style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
