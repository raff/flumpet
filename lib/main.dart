import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'It\'s a trumpet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(title: 'It\'s a trumpet'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _current = 0;

  void _valve1(bool pressed) {
    if (pressed) {
      _addValue(-2);
    } else {
      _addValue(2);
    }
  }

  void _valve2(bool pressed) {
    if (pressed) {
      _addValue(-1);
    } else {
      _addValue(1);
    }
  }

  void _valve3(bool pressed) {
    if (pressed) {
      _addValue(-3);
    } else {
      _addValue(3);
    }
  }

  void _addValue(int n) {
    setState(() {
      _current += n;
    });
  }

  void _setValue(int n) {
    setState(() {
      _current = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    var keyb = RawKeyboard.instance;

    // 2nd row, last 3 keys on QWERTY keyboard
    const valve3 = PhysicalKeyboardKey.arrowRight;
    const valve2 = PhysicalKeyboardKey.arrowDown;
    const valve1 = PhysicalKeyboardKey.arrowLeft;

    // top row on QWERTY keyboard
    const h14 = PhysicalKeyboardKey.backspace;
    const h13 = PhysicalKeyboardKey.equal;
    const h12 = PhysicalKeyboardKey.minus;
    const h11 = PhysicalKeyboardKey.digit0;
    const h10 = PhysicalKeyboardKey.digit9;
    const h9 = PhysicalKeyboardKey.digit8;
    const h8 = PhysicalKeyboardKey.digit7;
    const h7 = PhysicalKeyboardKey.digit6;
    const h6 = PhysicalKeyboardKey.digit5;
    const h5 = PhysicalKeyboardKey.digit4;
    const h4 = PhysicalKeyboardKey.digit3;
    const h3 = PhysicalKeyboardKey.digit2;
    const h2 = PhysicalKeyboardKey.digit1;
    const h1 = PhysicalKeyboardKey.backquote;

    keyb.keyEventHandler = (RawKeyEvent key) {
      if (keyb.physicalKeysPressed.isEmpty) {
        print("nothing pressed");
        _setValue(0);
        return true;
      }

      var pressed = keyb.physicalKeysPressed;
      var vv = 0;

      print("pressed $pressed");

      // 1 7 12 16 19 22 24 26 28 30 31 33 34 35 36
      // C G  C  E  G Bb  C  D  E F#  G  A Bb  B  C

      if (pressed.contains(h14)) {
        vv = 36;
      } else if (pressed.contains(h13)) {
        vv = 35;
      } else if (pressed.contains(h12)) {
        vv = 34;
      } else if (pressed.contains(h11)) {
        vv = 33;
      } else if (pressed.contains(h10)) {
        vv = 31;
      } else if (pressed.contains(h9)) {
        vv = 30;
      } else if (pressed.contains(h8)) {
        vv = 28;
      } else if (pressed.contains(h7)) {
        vv = 26;
      } else if (pressed.contains(h6)) {
        vv = 24;
      } else if (pressed.contains(h5)) {
        vv = 22;
      } else if (pressed.contains(h4)) {
        vv = 19;
      } else if (pressed.contains(h3)) {
        vv = 16;
      } else if (pressed.contains(h2)) {
        vv = 12;
      } else if (pressed.contains(h1)) {
        vv = 7;
      } else {
        vv = 1;
      }

      if (pressed.contains(valve3)) {
        vv -= 3;
      }
      if (pressed.contains(valve2)) {
        vv -= 1;
      }
      if (pressed.contains(valve1)) {
        vv -= 2;
      }

      _setValue(vv + 5);
      return true;
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Current note:',
                ),
                Text(
                  '$_current',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DefaultTextStyle(
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: FloatingActionButton(
                          onPressed: () {
                            _addValue(5);
                          },
                          tooltip: 'Increment',
                          child: Icon(Icons.add),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: FloatingActionButton(
                          onPressed: () {
                            _addValue(-5);
                          },
                          tooltip: 'Decrement',
                          child: Icon(Icons.remove),
                        ),
                      ),
                    ],
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTapDown: (down) {
                            _valve1(true);
                          },
                          onTapUp: (up) {
                            _valve1(false);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            decoration: ShapeDecoration(
                              shape: new CircleBorder(),
                              color: Colors.blue,
                            ),
                            child: const Text('1'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTapDown: (down) {
                            _valve2(true);
                          },
                          onTapUp: (up) {
                            _valve2(false);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            decoration: ShapeDecoration(
                              shape: new CircleBorder(),
                              color: Colors.blue,
                            ),
                            child: const Text('2'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTapDown: (down) {
                            _valve3(true);
                          },
                          onTapUp: (up) {
                            _valve3(false);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            decoration: ShapeDecoration(
                              shape: new CircleBorder(),
                              color: Colors.blue,
                            ),
                            child: const Text('3'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
