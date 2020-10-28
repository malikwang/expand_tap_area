import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  debugPaintExpandAreaEnabled = true;
  debugPaintExpandAreaColor = Color(0xFF00FFFF).withOpacity(0.2);
  runApp(MyApp());
}

_showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpandTapArea',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ExpandTapArea'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildLarge() {
    return GestureDetector(
      onTap: () => _showToast('44 is Tapped'),
      child: Container(
        width: 44,
        height: 44,
        color: Colors.greenAccent,
        alignment: Alignment.center,
        child: Text(
          '44',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildMedium() {
    return GestureDetector(
      onTap: () => _showToast('30 is Tapped'),
      child: Container(
        width: 30,
        height: 30,
        color: Colors.orangeAccent,
        alignment: Alignment.center,
        child: Text(
          '30',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSmall() {
    return Container(
      width: 22,
      height: 22,
      color: Colors.redAccent,
      alignment: Alignment.center,
      child: Text(
        '22',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCell1() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'In the Human Interface Guidelines, Apple recommends a minimum target size of 44 x 44 px. '),
          Text(
              'In the Android Material Design Guidelines, it’s suggested that touch targets should be at least 48 x 48 dp.'),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLarge(),
                  _buildMedium(),
                  GestureDetector(
                    onTap: () => _showToast('22 is Tapped'),
                    child: _buildSmall(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text('The black border is parent box size.'),
          ),
        ],
      ),
    );
  }

  Widget _buildCell2() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'A workaround is wrap this small Widget into Container with padding, and set background color to transparent and set the behavior of GestureDetector to HitTestBehavior.translucent.'),
          Text(
              'For example, the following wraps a 22*22 Widget into a bigger Invisible Container 44*44. But this way would change the Layout/Size.'),
          Text(
              'In the following example, we replace transparent with a light color for better demonstration.'),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLarge(),
                  _buildMedium(),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => _showToast('22 is Tapped'),
                    child: Container(
                      color: Colors.redAccent.withOpacity(0.5),
                      padding: EdgeInsets.all(11),
                      child: _buildSmall(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCell3() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Another workaround is put a large transparent Container on the small Widget using Stack.'),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildLarge(),
                      _buildMedium(),
                      _buildSmall(),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    width: 44,
                    height: 44,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => _showToast('22 is Tapped'),
                      child: Container(
                        color: Colors.redAccent.withOpacity(0.5),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCell4() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Using ExpandTapWidget can expand the tap area without change its size or layout.'),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLarge(),
                  _buildMedium(),
                  ExpandTapWidget(
                    onTap: () => _showToast('22 is Tapped'),
                    tapPadding: EdgeInsets.fromLTRB(78, 11, 0, 11),
                    child: _buildSmall(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'The tap area of above small red widget is illustrated as Cyan colored area.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.cyan,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    _buildCell1(),
                    Divider(
                      color: Colors.grey,
                    ),
                    _buildCell2(),
                    Divider(
                      color: Colors.grey,
                    ),
                    _buildCell3(),
                    Divider(
                      color: Colors.grey,
                    ),
                    _buildCell4(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DemoPage()));
                        },
                        child: Text(
                          'Demo',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "The Cyan colored area is used to illustrate the expand area. The size of all the following bigger Container is 100 * 100.",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                          'The size of blue Container is 50 * 50, tapPadding is EdgeInsets.all(25).'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 100,
                      child: ExpandTapWidget(
                        onTap: () => _showToast('Tap Blue'),
                        tapPadding: EdgeInsets.all(25),
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Notice: \nThe expand tap area won't exceed the size of parent box. In this case, tapPadding is EdgeInsets.all(100).",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 100,
                      child: ExpandTapWidget(
                        onTap: () => _showToast('Tap Blue'),
                        tapPadding: EdgeInsets.all(100),
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                          "Parent: GestureDetector, Child: ExpandTapWidget"),
                    ),
                    GestureDetector(
                      onTap: () => _showToast('Tap Yellow'),
                      child: Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        color: Colors.yellow,
                        child: Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 70,
                          child: ExpandTapWidget(
                            onTap: () => _showToast('Tap Blue'),
                            tapPadding: EdgeInsets.all(10),
                            child: Container(
                              width: 50,
                              height: 50,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                          "Parent: ExpandTapWidget, Child: GestureDetector"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 100,
                      child: ExpandTapWidget(
                        onTap: () => _showToast('Tap Blue'),
                        tapPadding: EdgeInsets.all(100),
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () => _showToast('Tap Yellow'),
                            child: Container(
                              color: Colors.yellow,
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
