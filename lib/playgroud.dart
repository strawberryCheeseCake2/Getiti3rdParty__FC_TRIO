import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sticky Header',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    ScreenOne(),
    ScreenTwo(),
    ScreenThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sticky Header'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: PageController(initialPage: _currentIndex),
              children: _tabs,
            ),
          ),
          Container(
            height: 50,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  color: _currentIndex == 0 ? Colors.white : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.business),
                  color: _currentIndex == 1 ? Colors.white : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.school),
                  color: _currentIndex == 2 ? Colors.white : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}
