import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sayaç ve font büyüme ödev',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  double fontSize = 50;
//sayacın rengini hangi ren olacağını seçeriz 0 dan küçükse kırmızı olsun gibi
  Color _TextColor(int count) {
    if (count > 0) {
      return Colors.green;
    } else if (count == 0) {
      return Colors.black;
    } else {
      return Colors.red;
    }
  }

//sayacı 2 font büyültür
  void incrementFontsize() {
    setState(() {
      fontSize += 2;
    });
  }

//sayacı 2 font küçültür
  void decrementFontsize() {
    setState(() {
      fontSize -= 2;
    });
  }

//sayacın değerini 1 arttırır
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

//sayacın değerini 1 eksiltir
  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  //appbar kısmı
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sayaç ve font büyüme ödev'),
        //font arttırma butonları
        actions: [
          IconButton(
            onPressed: incrementFontsize,
            icon: Icon(Icons.arrow_circle_up),
          ),
          IconButton(
            onPressed: decrementFontsize,
            icon: Icon(Icons.arrow_circle_down),
          ),
        ],
      ),
      //body kısmı
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sayaç',
              style: TextStyle(fontSize: 40),
            ),
            Text(
              '$counter',
              style: TextStyle(
                fontSize: fontSize,
                // yazı rengini belirlenen yer.
                color: _TextColor(counter),
              ),
            ),
            //Sayacı arttırma butonları
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: incrementCounter,
                  child: Icon(Icons.add),
                  backgroundColor: Colors.blue,
                ),
                SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: decrementCounter,
                  child: Icon(Icons.remove),
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}