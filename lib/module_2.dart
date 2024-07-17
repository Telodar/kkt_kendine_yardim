import 'package:flutter/material.dart';
import 'package:kkt_kendine_yardim/home_page.dart';
import 'package:kkt_kendine_yardim/main.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'module_1.dart';
import 'module_3.dart';
import 'module_4.dart';

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
      home: M2Page(),
      routes: {
        '/Home': (context) => HomePage(), // HomePage yönlendirmesi Tanımı
        '/Login': (context) => LoginPage(), // Login yönlendirmesi burada tanımlanıyor
        '/M1': (context) => const M1Page(),
        '/M3': (context) => const M3Page(),
        '/M4': (context) => const M4Page(),
      },
    );
  }
}

class M2Page extends StatefulWidget {
  const M2Page({super.key});

  @override
  State<M2Page> createState() => _M2PageState();
}

class _M2PageState extends State<M2Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<TextEditingController> _textControllers = List.generate(5, (index) => TextEditingController());

  void _submitForm() {
    for (var controller in _textControllers) {
      print(controller.text); // Terminale yazdırma
      controller.clear(); // Textbox'ı temizleme
    }
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
              leading: Icon(Icons.looks_one),
              title: Text('Modül 1'),
              onTap: () {
                Navigator.pushNamed(context, '/Test'); // Mesajlar sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_two),
              title: Text('Modül 2'),
              onTap: () {
                // Profil sayfasına git fonksiyonu
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
                "Hepimiz zaman zaman Ayşe ya da Efe gibi zor dönemler geçirebiliriz. Fakat bu süre"
                    "uzadığında kendimizle ilgili duygu düşünceler ve bedenimizde hissettiklerimiz"
                    "yoğunlaştığında sanki bir çıkmaz sokağa girmiş ve orada sıkışmış gibi hissedebiliriz. Gelin"
                    "bu sokakta başlayan yolculuğa birlikte çıkalım."
                    "Bugün yolculuğun başındayız, peki siz yolculuğun başarılı bir şekilde gerçekleştiğini siz"
                    "nereden anlayacaksınız? Yolculuğun sonuna geldiğimizi siz nereden anlayacaksınız? Artık"
                    "bugünden farklı olarak neyi yapmaya başlıyor olacaksınız? Bu süreçteki hedefleriniz"
                    "neler?"
                    "Kaygınızı azaltmayı veya kontrol etmeyi istediğinizi ya da içinde buluduğunuz olumsuz"
                    "bu duygudurumdan kurtulmak istediğinizi, daha mutlu veya özgüvenli olmayı istediğinizi"
                    "tahmin edebiliyorum. Ama benim asıl sormak istediğim bütün bunlar olduğunda siz ne"
                    "yapıyor olacaksınız? Aşağıya neler yapıyor olacağınızı belirtiniz.",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 20), // Sabit metin ve form arasında boşluk
            for (int i = 0; i < 5; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _textControllers[i],
                  decoration: InputDecoration(
                    labelText: 'Mesaj ${i + 1}',
                    border: UnderlineInputBorder(),
                  ),
                  onSubmitted: (value) {
                    _submitForm();
                  },
                ),
              ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Gönder'),
            ),
            SizedBox(height: 20), // Butonun altında boşluk
          ],
        ),
      ),
    );
  }
}
