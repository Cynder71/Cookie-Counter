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

  //method
  void _oneMoreCookie(){
    setState(() {
      if(_counter<30){
      _counter++;
      }
    });
  }

  void _oneLessCookie(){
    setState(() {
      if(_counter>0){
      _counter--;     
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
              style: TextStyle(color: Colors.white), 
            ),
          ],
        ),
      ),
      body: Container (
          decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage('images/cup-tea-cookies.jpg'), 
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
                color: Colors.white,
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
                  onPressed: _oneMoreCookie,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown, // Set background color here
                  ),
                  child: const Text(
                    "Put a Cookie in \nthe Jar!",
                    style: TextStyle(
                     fontSize: 20,
                     color: Colors.white,
                     ),
                  ),
                ),
                  ElevatedButton(
                    onPressed: _oneLessCookie, 
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    ),
                    child: const Text(
                    "Take a Cookie \nfrom the Jar",
                    style: TextStyle(
                     fontSize: 20,
                     color: Colors.white,
                     ),
                    )),]
              ),
          ],
        ),
      ),
    );
  }
}
