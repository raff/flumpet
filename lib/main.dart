import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

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
  String _note = "";

  var _noteNames = [
    "C",
    "C#",
    "D",
    "D#",
    "E",
    "F",
    "F#",
    "G",
    "G#",
    "A",
    "A#",
    "B"
  ];

  late AudioPlayer _player;
  late AudioSource _notes;

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

  void _addValue(int v) {
    setState(() {
      _current += v;
    });
  }

  void _setValue(int? v) {
    setState(() {
      _current = v ?? 0;

      if (v == null) {
        _note = "";
      } else {
        var vv = v! - 1;
        var o = (vv ~/ 12) + 4;
        var n = _noteNames[vv % 12];
        _note = "$n$o";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    UriAudioSource all = AudioSource.uri(Uri.parse("asset:///audio/trumpet.wav"));

    _notes = ConcatenatingAudioSource(
      children: [
        ClippingAudioSource(start: Duration(seconds: 0), end: Duration(seconds: 2), child: all),
        ClippingAudioSource(start: Duration(seconds: 2), end: Duration(seconds: 4), child: all),
        ClippingAudioSource(start: Duration(seconds: 4), end: Duration(seconds: 6), child: all),
        ClippingAudioSource(start: Duration(seconds: 6), end: Duration(seconds: 8), child: all),
        ClippingAudioSource(start: Duration(seconds: 8), end: Duration(seconds: 10), child: all),
        ClippingAudioSource(start: Duration(seconds: 10), end: Duration(seconds: 12), child: all),
        ClippingAudioSource(start: Duration(seconds: 12), end: Duration(seconds: 14), child: all),
        ClippingAudioSource(start: Duration(seconds: 14), end: Duration(seconds: 16), child: all),
        ClippingAudioSource(start: Duration(seconds: 16), end: Duration(seconds: 18), child: all),
        ClippingAudioSource(start: Duration(seconds: 18), end: Duration(seconds: 20), child: all),
        ClippingAudioSource(start: Duration(seconds: 20), end: Duration(seconds: 22), child: all),
        ClippingAudioSource(start: Duration(seconds: 22), end: Duration(seconds: 24), child: all),
        ClippingAudioSource(start: Duration(seconds: 24), end: Duration(seconds: 26), child: all),
        ClippingAudioSource(start: Duration(seconds: 26), end: Duration(seconds: 28), child: all),
        ClippingAudioSource(start: Duration(seconds: 28), end: Duration(seconds: 30), child: all),
        ClippingAudioSource(start: Duration(seconds: 30), end: Duration(seconds: 32), child: all),
        ClippingAudioSource(start: Duration(seconds: 32), end: Duration(seconds: 34), child: all),
        ClippingAudioSource(start: Duration(seconds: 34), end: Duration(seconds: 36), child: all),
        ClippingAudioSource(start: Duration(seconds: 36), end: Duration(seconds: 38), child: all),
        ClippingAudioSource(start: Duration(seconds: 38), end: Duration(seconds: 40), child: all),
        ClippingAudioSource(start: Duration(seconds: 40), end: Duration(seconds: 42), child: all),
        ClippingAudioSource(start: Duration(seconds: 42), end: Duration(seconds: 44), child: all),
        ClippingAudioSource(start: Duration(seconds: 44), end: Duration(seconds: 46), child: all),
        ClippingAudioSource(start: Duration(seconds: 46), end: Duration(seconds: 48), child: all),
        ClippingAudioSource(start: Duration(seconds: 48), end: Duration(seconds: 50), child: all),
        ClippingAudioSource(start: Duration(seconds: 50), end: Duration(seconds: 52), child: all),
        ClippingAudioSource(start: Duration(seconds: 52), end: Duration(seconds: 54), child: all),
        ClippingAudioSource(start: Duration(seconds: 54), end: Duration(seconds: 56), child: all),
        ClippingAudioSource(start: Duration(seconds: 56), end: Duration(seconds: 58), child: all),
        ClippingAudioSource(start: Duration(seconds: 58), end: Duration(seconds: 60), child: all),
        ClippingAudioSource(start: Duration(seconds: 60), end: Duration(seconds: 62), child: all),
        ClippingAudioSource(start: Duration(seconds: 62), end: Duration(seconds: 64), child: all),
        ClippingAudioSource(start: Duration(seconds: 64), end: Duration(seconds: 66), child: all),
        ClippingAudioSource(start: Duration(seconds: 66), end: Duration(seconds: 68), child: all),
        ClippingAudioSource(start: Duration(seconds: 68), end: Duration(seconds: 70), child: all),
        ClippingAudioSource(start: Duration(seconds: 70), end: Duration(seconds: 72), child: all),
        ClippingAudioSource(start: Duration(seconds: 72), end: Duration(seconds: 74), child: all),
        ClippingAudioSource(start: Duration(seconds: 74), end: Duration(seconds: 76), child: all),
        ClippingAudioSource(start: Duration(seconds: 76), end: Duration(seconds: 78), child: all),
        ClippingAudioSource(start: Duration(seconds: 78), end: Duration(seconds: 80), child: all),
        ClippingAudioSource(start: Duration(seconds: 80), end: Duration(seconds: 82), child: all),
        ClippingAudioSource(start: Duration(seconds: 82), end: Duration(seconds: 84), child: all),
        ClippingAudioSource(start: Duration(seconds: 84), end: Duration(seconds: 86), child: all),
        ClippingAudioSource(start: Duration(seconds: 86), end: Duration(seconds: 88), child: all),
        ClippingAudioSource(start: Duration(seconds: 88), end: Duration(seconds: 90), child: all),
        ClippingAudioSource(start: Duration(seconds: 90), end: Duration(seconds: 92), child: all),
        ClippingAudioSource(start: Duration(seconds: 92), end: Duration(seconds: 94), child: all),
        ClippingAudioSource(start: Duration(seconds: 94), end: Duration(seconds: 96), child: all),
        ClippingAudioSource(start: Duration(seconds: 96), end: Duration(seconds: 98), child: all),
        ClippingAudioSource(start: Duration(seconds: 98), end: Duration(seconds: 100), child: all),
        ClippingAudioSource(start: Duration(seconds: 100), end: Duration(seconds: 102), child: all),
        ClippingAudioSource(start: Duration(seconds: 102), end: Duration(seconds: 104), child: all),
        ClippingAudioSource(start: Duration(seconds: 104), end: Duration(seconds: 106), child: all),
        ClippingAudioSource(start: Duration(seconds: 106), end: Duration(seconds: 108), child: all),
        ClippingAudioSource(start: Duration(seconds: 108), end: Duration(seconds: 110), child: all),
        ClippingAudioSource(start: Duration(seconds: 110), end: Duration(seconds: 112), child: all),
        ClippingAudioSource(start: Duration(seconds: 112), end: Duration(seconds: 114), child: all),
        ClippingAudioSource(start: Duration(seconds: 114), end: Duration(seconds: 116), child: all),
        ClippingAudioSource(start: Duration(seconds: 116), end: Duration(seconds: 118), child: all),
        ClippingAudioSource(start: Duration(seconds: 118), end: Duration(seconds: 120), child: all),
        ClippingAudioSource(start: Duration(seconds: 120), end: Duration(seconds: 122), child: all),
        ClippingAudioSource(start: Duration(seconds: 122), end: Duration(seconds: 124), child: all),
        ClippingAudioSource(start: Duration(seconds: 124), end: Duration(seconds: 126), child: all),
        ClippingAudioSource(start: Duration(seconds: 126), end: Duration(seconds: 128), child: all),
        ClippingAudioSource(start: Duration(seconds: 128), end: Duration(seconds: 130), child: all),
        ClippingAudioSource(start: Duration(seconds: 130), end: Duration(seconds: 132), child: all),
        ClippingAudioSource(start: Duration(seconds: 132), end: Duration(seconds: 134), child: all),
        ClippingAudioSource(start: Duration(seconds: 134), end: Duration(seconds: 136), child: all),
        ClippingAudioSource(start: Duration(seconds: 136), end: Duration(seconds: 138), child: all),
        ClippingAudioSource(start: Duration(seconds: 138), end: Duration(seconds: 140), child: all),
      ],
    );

    try {
      await _player.setAudioSource(_notes);
      await _player.setLoopMode(LoopMode.one);
    } catch (e) {
      // catch load errors: 404, invalid url ...
      print("An error occured $e");
    }
  }

  Future<void> _stopPlay() async {
    await _player.pause();
  }

  Future<void> _play(int n) async {
    await _player.seek(Duration(milliseconds: 0), index: n);
    await _player.play();
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
        //print("nothing pressed");
        _setValue(null);
        _stopPlay();
        return true;
      }

      var pressed = keyb.physicalKeysPressed;
      var vv = 0;

      //print("pressed $pressed");

      // 1 8 13 17 20 23 25 26 29 31 32 34 35 36 37
      // C G  C  E  G Bb  C  D  E F#  G  A Bb  B  C

      if (pressed.contains(h14)) {
        vv = 37;
      } else if (pressed.contains(h13)) {
        vv = 36;
      } else if (pressed.contains(h12)) {
        vv = 35;
      } else if (pressed.contains(h11)) {
        vv = 34;
      } else if (pressed.contains(h10)) {
        vv = 32;
      } else if (pressed.contains(h9)) {
        vv = 31;
      } else if (pressed.contains(h8)) {
        vv = 29;
      } else if (pressed.contains(h7)) {
        vv = 27;
      } else if (pressed.contains(h6)) {
        vv = 25;
      } else if (pressed.contains(h5)) {
        vv = 23;
      } else if (pressed.contains(h4)) {
        vv = 20;
      } else if (pressed.contains(h3)) {
        vv = 17;
      } else if (pressed.contains(h2)) {
        vv = 13;
      } else if (pressed.contains(h1)) {
        vv = 8;
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

      print(vv);
      _setValue(vv);
      _play(vv + 5);
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
                  '$_note', // $_current
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
                            _addValue(-6);
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
