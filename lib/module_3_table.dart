import 'package:flutter/material.dart';
import 'package:kkt_kendine_yardim/home_page.dart';
import 'package:kkt_kendine_yardim/main.dart';
import 'package:kkt_kendine_yardim/module_1.dart';
import 'package:kkt_kendine_yardim/module_2.dart';
import 'package:kkt_kendine_yardim/module_3.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: const M3tablePage(),
      routes: {
        '/Home': (context) => HomePage(),
        '/Login': (context) => LoginPage(),
        '/M1': (context) => const M1Page(),
        '/M2': (context) => M2Page(),
        '/M3': (context) => M3Page(),
      },
    );
  }
}

class M3tablePage extends StatefulWidget {
  const M3tablePage({Key? key}) : super(key: key);

  @override
  _M3tablePageState createState() => _M3tablePageState();
}

class _M3tablePageState extends State<M3tablePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();

  void _submitForm() {
    print('Ne Oldu?: ${_controller1.text}');
    print('Ne Düşünün?: ${_controller2.text}');
    print('Ne Hissettin?: ${_controller3.text}');
    print('Bedeninde neler oldu?: ${_controller4.text}');
    print('Ne yaptın?: ${_controller5.text}');
    print('Kısa Vadede Sonuçlar: ${_controller5.text}');
    print('Uzun Vadede Sonuçlar: ${_controller5.text}');

    _controller1.clear();
    _controller2.clear();
    _controller3.clear();
    _controller4.clear();
    _controller5.clear();
    _controller6.clear();
    _controller7.clear();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 1000;
    final double sidePadding = isDesktop ? 200 : 30;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.indigo.withOpacity(0.4),
        title: Text('Kendine Yardım'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Login');
            },
            child: Text('Giriş Yap', style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/Home');
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.5),
              ),
              child: Text(
                'Modüller',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('Modül 1'),
              onTap: () {
                Navigator.pushNamed(context, '/M1');
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_two),
              title: Text('Modül 2'),
              onTap: () {
                Navigator.pushNamed(context, '/M2');
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_3),
              title: Text('Modül 3'),
              onTap: () {
                Navigator.pushNamed(context, '/M2'); // Modül 3'e git fonksiyonu
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: sidePadding, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Öncüller',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _controller1,
                    decoration: InputDecoration(labelText: 'NE oldu?'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _controller2,
                    decoration: InputDecoration(labelText: 'NE düşündün?'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _controller3,
                    decoration: InputDecoration(labelText: 'NE hissettin?'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _controller4,
                    decoration: InputDecoration(labelText: 'Bedeninde neler oldu?'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Davranış',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _controller5,
                    decoration: InputDecoration(labelText: 'NE Yaptın?'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sonuç',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _controller6,
                    decoration: InputDecoration(labelText: 'Kısa Vadede'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _controller7,
                    decoration: InputDecoration(labelText: 'Uzun Vadede'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Gönder'),
            ),
          ],
        ),
      ),
    );
  }
}
