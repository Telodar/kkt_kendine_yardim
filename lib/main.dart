import 'package:flutter/material.dart';
import 'package:kkt_kendine_yardim/home_page.dart';

import 'module_1.dart';
import 'module_2.dart';
import 'module_3.dart';
import 'module_4.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      home: const LoginPage(),
      routes: {
        '/Home':(context)=> HomePage(),
        '/M1': (context) => M1Page(),
        '/M2': (context) => const M2Page(),
        '/M3': (context) => const M3Page(),
        '/M4': (context) => const M4Page(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String username;
  late String password;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Kullanıcı adı ve parola kaydedildi
      print("Kullanıcı Adı: $username, Parola: $password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.indigo.withOpacity(0.4),
        title: Text('Kendine Yardım'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Login'); // Giriş yap butonuna tıklandığında Login sayfasına yönlendirme
            },
            child: Text('Giriş Yap', style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/Home'); // Ana sayfaya yönlendirme
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer(); // Drawer'ı sağ taraftan aç
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
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('Modül 1'),
              onTap: () {
                Navigator.pushNamed(context, '/M1'); // Mesajlar sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_two),
              title: Text('Modül 2'),
              onTap: () {
                Navigator.pushNamed(context, '/M2');// Profil sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_3),
              title: Text('Modül 3'),
              onTap: () {
                Navigator.pushNamed(context, '/M3');// Ayarlar sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_4),
              title: Text('Modül 4'),
              onTap: () {
                Navigator.pushNamed(context, '/M4');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Arka plan resmi
          Positioned.fill(
            child: Image.asset(
              'android/assets/arkaplan.png',
              fit: BoxFit.cover,
            ),
          ),
          // Form container
          Align(
            alignment: Alignment(0.8,0), // Sağa hizalama
            child: LayoutBuilder(
              builder: (context, constraints) {
                double width = constraints.maxWidth * 0.8;
                double minWidth = 500;
                double maxWidth = 450;

                return Container(
                  width: width < minWidth ? minWidth : (width > maxWidth ? maxWidth : width),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple .withOpacity(0.25),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width < minWidth
                                ? minWidth
                                : (width > maxWidth ? maxWidth : width),
                            minHeight: 60,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Kullanıcı Adı",
                              labelStyle: TextStyle(color: Colors.teal),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.indigo, width: 1.0),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Kullanıcı Adını Giriniz";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              username = value!;
                            },
                            onFieldSubmitted: (value) {
                              _submitForm();
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width < minWidth
                                ? minWidth
                                : (width > maxWidth ? maxWidth : width),
                            minHeight: 60,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Parola",
                              labelStyle: TextStyle(color: Colors.teal),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.indigo, width: 1.0),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            style: TextStyle(color: Colors.black),
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Parolayı Giriniz";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              password = value!;
                            },
                            onFieldSubmitted: (value) {
                              _submitForm();
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width < minWidth
                                ? minWidth
                                : (width > maxWidth ? maxWidth : width),
                            minHeight: 50,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            onPressed: _submitForm,
                            child: const Text("Giriş Yap"),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // orta hiza
                          children: [
                            TextButton(
                              onPressed: () {
                                // Üye ol butonu tıklama işlemleri
                              },
                              child: Text("Üye Ol"),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                // Şifremi unuttum butonu tıklama işlemleri
                              },
                              child: Text("Şifremi Unuttum"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
