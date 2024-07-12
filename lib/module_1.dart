import 'package:flutter/material.dart';
import 'package:kkt_kendine_yardim/main.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:kkt_kendine_yardim/home_page.dart';
import 'package:kkt_kendine_yardim/module_2.dart';

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
      home: TestPage(),
      routes: {
        '/Home': (context) => HomePage(), // HomePage yönlendirmesi Tanımı
        '/Login': (context) => LoginPage(), // Login yönlendirmesi burada tanımlanıyor
        '/Test': (context) => const TestPage(),
        '/M2': (context) => const M2Page(),
      },
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textController = TextEditingController();

  void _submitForm() {
    String text = _textController.text;
    print(text); // Terminale yazdırma
    _textController.clear(); // Textbox'ı temizleme
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 1000;
    final double sidePadding = isDesktop ? 200 : 30;
    final double horizontalPadding = isDesktop ? 200 : 0;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.indigo.withOpacity(0.4),
        title: Text('Modül 1'),
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
                Navigator.pushNamed(context, '/Test'); // Mesajlar sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.onetwothree),
              title: Text('Modül 2'),
              onTap: () {
                Navigator.pushNamed(context, '/M2');// Profil sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.onetwothree),
              title: Text('Modül 3'),
              onTap: () {
                // Ayarlar sayfasına git fonksiyonu
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            child: Column(
              children: [
                SizedBox(height: 100), // Sayfanın kaydırılabilir kısmı için boşluk
                // Diğer içerikler buraya eklenebilir
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: Colors.indigo.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    "Ayşe Üniversite 2. Sınıf öğrencisi olan Ayşe ailesinden uzakta bir şehirde öğrenimine devam etmekteydi. Ailesiyle ilişkileri normal olan Ayşe daha önceleri günde en az bir kez "
                        "konuştuğu ailesiyle artık daha az telefonda görüşmeye başlamıştı. Son dönemde kendini"
                        "çökkün hissetmekte olan Ayşe daha önce severek gittiği derslere artık katılmak "
                        "istememekteydi. Daha çok yurtta tek başına kalmayı tercih etmekte ve arkadaşları "
                        "dışarda planlar yaptığında farklı bahanelerle onlara katılmamaktaydı. Aslında"
                        "arkadaşlarını seven onlarla yaptığı aktivitelerden keyif alan Ayşe'yi son zamanlarda arkadaşlarının enerjisinin yüksek olması bile rahatsız etmekteydi. Yalnız kalmayı tercih "
                        "etmekte ve böyle zamanlarda da daha önceki yaşadığı olayları zihninden geçirmekte o "
                        "olayları tekrar tekrar düşünmekteydi. Geceleri istediği gibi uyuyamamakta ve ertesi gün"
                        "içerisinde de yoğun olarak öfkeli olduğunu fark etmekteydi."
                        "Böyle günlerden birinde Ayşe ve oda arkadaşı Elif odanın düzeni ile ilgili bir konuda"
                        "tartışmışlardı. Ayşe bu tartışmada arkadaşına bağırarak -"
                        "yeter artık! her şeyi çok abartıyorsun.- Demiş, yatağına oturmuş ve göğsünde bir baskı hissetmişti ve aynı"
                        "zamanda elleri titremişti. Sonrasında arkadaşını hiç dinlemeden odadan ayrılarak kendini rahatlatmak için kulaklıklarını takıp yürüyüşe çıkmıştı. Yürüyüş boyunca -kimsenin onu"
                        "anlamadığını, ben niye böyleyim- diye aklından geçirmiş ve geçmişte yaşadığı olayları"
                        "tekrar tekrar düşünen Ayşe kendisi için -kimse beni sevmiyor, hiçbir şeyi"
                        "başaramıyorum- diye düşünmekteydi. Yürüyüş sonrası tekrar odasına dönen Ayşe"
                        "odasındakilerle çok az iletişim kurarak yatağına uzanmış ve kafasını dağıtmak için"
                        "internetten videolar izlemiş ve sosyal medyada gezinmişti. O günkü gitmesine gereken"
                        "derse de -bu kafayla gitsem zaten bir Şey anlamayacağım canım istemiyor- diyerek"
                        "gitmemişti."
                        "Yakın  arkadaşı Hacer son dönemde Ayşe'nin davranışlarında farklılık olduğunu görmüş ve"
                        "nasıl hissettiğini sormuştu. Ayşe'de -kendimi çok yorgun hissediyorum, canım hiçbir şey"
                        "yapmak istemiyor. Sanırım bende bir bozukluk var. Kendimi diğer insanların içinde bile"
                        "yalnız hissediyorum, çok değersizim- demişti.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 100), // Sayfanın kaydırılabilir kısmı için boşluk
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mesajınızı buraya yazın',
                      ),
                      onSubmitted: (value) {
                        _submitForm();
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Gönder'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
