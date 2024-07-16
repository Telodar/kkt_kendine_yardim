import 'package:flutter/material.dart';
import 'package:kkt_kendine_yardim/module_2.dart';
import 'package:photo_view/photo_view.dart';
import 'package:kkt_kendine_yardim/main.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:kkt_kendine_yardim/home_page.dart';
import 'module_1.dart';
import 'module_3_table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.resize(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
        ],
      ),
      home: M3Page(),
      routes: {
        '/Home': (context) => HomePage(), // HomePage yönlendirmesi Tanımı
        '/Login': (context) => LoginPage(), // Login yönlendirmesi burada tanımlanıyor
        '/M1': (context) => const M1Page(),
        '/M2': (context) => M2Page(),
        '/M3T': (context) => const M3tablePage(),
      },
    );
  }
}

class M3Page extends StatefulWidget {
  const M3Page({super.key});

  @override
  State<M3Page> createState() => _M3PageState();
}

class _M3PageState extends State<M3Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showPhoto(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: PhotoView(
              imageProvider: AssetImage(imagePath),
              backgroundDecoration: BoxDecoration(color: Colors.black),
            ),
          ),
        ),
      ),
    );
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
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.onetwothree),
              title: Text('Modül 1'),
              onTap: () {
                Navigator.pushNamed(context, '/M1'); // Mesajlar sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.onetwothree),
              title: Text('Modül 2'),
              onTap: () {
                Navigator.pushNamed(context, '/M2'); // Profil sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.onetwothree),
              title: Text('Modül 3'),
              onTap: () {
                // Ayarlar sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.onetwothree),
              title: Text('Modül 3T'),
              onTap: () {
                Navigator.pushNamed(context, '/M3T');              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: sidePadding),
        child: Column(
          children: [
            SizedBox(height: 100), // Sayfanın kaydırılabilir kısmı için boşluk
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(
                "Belki hayatınız ile Ayşe’nin hayatı arasında bazı benzerlikleri ve farklılıkları görmüşsünüz. Çalışmanın bu"
                    "kısmında Ayşe’nin yaşadığı durumlardaki davranışlarını birlikte analiz edelim. Sonra da siz yaşadığınız"
                    "durumlarda kendi davranışlarınızın analizini yapabileceksiniz."
                ,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 20), // Metin ile resim arasında 20 piksel boşluk
            GestureDetector(
              onTap: () => _showPhoto(context, 'android/assets/Module_3.png'),
              child: AspectRatio(
                aspectRatio: 16 / 9, // Resmin en-boy oranı
                child: Image.asset(
                  'android/assets/Module_3.png',
                  fit: BoxFit.contain, // Resmin oranını koruyarak görüntüle
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(
              "Şimdi odaklanmaya karar verdiğiniz sorun üzerinde duralım. Bu sorunu en son ne zaman ve nerede"
              "yaşadınız? Öncelikle olayla ilgili A sütununda yazılı olan soruları altına cevaplarını yazınız. Daha sonra"
              "bütün bu duygu düşünce ve bedensel hisler geldiğinde ne yaptığınızı B sütununa yazın. Daha sonra"
              "bu olayın kısa ve uzun vadede ne gibi sonuçlar ortaya çıkardığını da C sütununa yazınız.",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _showPhoto(context, 'android/assets/Module_3_1.png'),
              child: AspectRatio(
                aspectRatio: 16 / 9, // Resmin en-boy oranı
                child: Image.asset(
                  'android/assets/Module_3_1.png',
                  fit: BoxFit.contain, // Resmin oranını koruyarak görüntüle
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed :()
              {
                Navigator.pushNamed(context, '/M3T');
              },
              child: Text('Başla'),
            ),
            SizedBox(height: 50),

          ],
        ),
      ),
    );
  }
}
