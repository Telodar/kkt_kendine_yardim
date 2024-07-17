import 'package:flutter/material.dart';
import 'package:kkt_kendine_yardim/home_page.dart';
import 'package:kkt_kendine_yardim/main.dart';
import 'package:kkt_kendine_yardim/module_2.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'module_1.dart';
import 'module_3_table.dart';
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
      home: M5Page(),
      routes: {
        '/Home': (context) => HomePage(), // HomePage yönlendirmesi Tanımı
        '/Login': (context) =>
            LoginPage(), // Login yönlendirmesi burada tanımlanıyor
        '/M1': (context) => const M1Page(),
        '/M2': (context) => M2Page(),
        '/M3T': (context) => const M3tablePage(),
        '/M4': (context) => const M4Page(),
      },
    );
  }
}

class M5Page extends StatefulWidget {
  const M5Page({super.key});

  @override
  State<M5Page> createState() => _M5PageState();
}

class _M5PageState extends State<M5Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();

  void _submitForm() {
    print('Cevap 1: ${_controller1.text}');
    print('Cevap 2: ${_controller2.text}');
    print('Cevap 3: ${_controller3.text}');
    print('Cevap 4: ${_controller4.text}');
    print('Cevap 5: ${_controller5.text}');

    _controller1.clear();
    _controller2.clear();
    _controller3.clear();
    _controller4.clear();
    _controller5.clear();
  }

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
              Navigator.pushNamed(context,
                  '/Login'); // Giriş yap butonuna tıklandığında Login sayfasına yönlendirme
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
              _scaffoldKey.currentState!
                  .openEndDrawer(); // Drawer'ı sağ taraftan aç
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
                Navigator.pushNamed(
                    context, '/M1'); // Mesajlar sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_two),
              title: Text('Modül 2'),
              onTap: () {
                Navigator.pushNamed(
                    context, '/M2'); // Profil sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_3),
              title: Text('Modül 3'),
              onTap: () {
                // Ayarlar sayfasına git fonksiyonu
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
            _buildQuestionContainer(
              "Şimdi bu kontrol yöntemleri ile ilgili aşağıdaki soruları kendinize sorun ve her birini cevapladıktan sonra diğer soruya geçiniz.",
              _controller1,
            ),
            _buildQuestionContainer(
              "Kontrol yöntemi uyguladığımda içsel deneyimle (duygu, düşünce ve bedensel hisler) başa çıkmak kısa vadede kolaylaşıyor gibi görünebilir. Peki ya uzun vadede kolaylaşıyor mu, zorlaşıyor mu?",
              _controller2,
            ),
            _buildQuestionContainer(
              "Kendinizi değerlendirdiğinizde bu stratejilerden hangilerini, ne sıklıkta kullanıyorsunuz?",
              _controller3,
            ),
            _buildQuestionContainer(
              "Bu stratejilerden herhangi birini uygulamak hayatınızı nasıl etkiliyor? (zaman ve para maliyeti açısından? Sağlık, boş zaman ve ilişkiler açısından?)",
              _controller4,
            ),
            _buildQuestionContainer(
              "İç deneyimlerinize (duygu, düşünce ve bedensel hisler) karşı bu mücadeleyi daha ne kadar sürdürebilirsiniz?",
              _controller5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Gönder'),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionContainer(
      String question, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.indigo.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Cevabınızı buraya yazınız',
            ),
          ),
        ],
      ),
    );
  }
}
