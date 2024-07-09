import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:kkt_kendine_yardim/main.dart';

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
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
        ],
      ),
      home: HomePage(),
      routes: {
        '/Login': (context) => LoginPage(), // main yönlendirmesi burada tanımlanıyor
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.withOpacity(0.4), // AppBar'ın rengi burada belirleniyor
        title: Text('Kendine Yardım'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Login'); // Giriş yap butonuna tıklandığında Login sayfasına yönlendirme
            },
            child: Text('Giriş Yap', style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Profil sayfasına git fonksiyonu
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
      endDrawer: Drawer( // Drawer'ı sağ tarafa taşımak için endDrawer kullanılıyor
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Profil',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Mesajlar'),
              onTap: () {
                // Mesajlar sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profil'),
              onTap: () {
                // Profil sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ayarlar'),
              onTap: () {
                // Ayarlar sayfasına git fonksiyonu
              },
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'android/assets/arkaplan.png',
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment(-0.6,0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15.0),
              ),
              constraints: BoxConstraints(
                maxWidth: 600, // Konteynerin genişliğini sınırlayabilirsiniz
                maxHeight: 600, // Konteynerin yüksekliğini sınırlayabilirsiniz
              ),
              child: SingleChildScrollView(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'KKT Yöntemli Kendi Kendine Tedavi ve Uzaktan Psikolojik Destek',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Kognitif Davranışçı Terapi (KKT) Nedir?',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Kognitif Davranışçı Terapi (KKT), bireylerin düşünce ve davranışlarını inceleyerek duygusal zorluklarla başa çıkmalarına yardımcı olan bir psikoterapi yöntemidir. Bu yaklaşım, olumsuz düşünce kalıplarının ve zararlı davranışların tespit edilip değiştirilmesi üzerine odaklanır. KKT, depresyon, anksiyete, stres ve diğer psikolojik sorunların tedavisinde etkili olduğu bilimsel araştırmalarla kanıtlanmıştır.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Kendi Kendine Tedavi Nedir?',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Kendi kendine tedavi, bireylerin profesyonel destek almadan, KKT tekniklerini kullanarak duygusal ve psikolojik sorunlarıyla başa çıkmalarını sağlayan bir yöntemdir. Bu süreç, çeşitli kaynaklar ve araçlar kullanılarak gerçekleştirilebilir.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Uzaktan Psikolojik Destek Nedir?',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Uzaktan psikolojik destek, internet üzerinden profesyonel bir terapist ile görüşmeler yaparak psikolojik yardım almayı sağlar. Bu yöntem, özellikle yoğun yaşam tarzı olan veya terapistlere fiziksel olarak erişim imkanı olmayan bireyler için büyük bir avantaj sunar.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Kendi Kendine Tedavi ve Uzaktan Destek Birlikte Nasıl Kullanılır?',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Kendi kendine tedavi ve uzaktan psikolojik destek yöntemleri bir arada kullanıldığında, bireylerin psikolojik iyilik hallerini geliştirmelerine daha fazla katkı sağlayabilir. Bu kombinasyon, bireyin bağımsızlığını koruyarak, aynı zamanda ihtiyaç duyduğunda profesyonel yardıma erişimini sağlar.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.6,0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15.0),
              ),
              constraints: BoxConstraints(
                maxWidth: 600, // Konteynerin genişliğini sınırlayabilirsiniz
                maxHeight: 600, // Konteynerin yüksekliğini sınırlayabilirsiniz
              ),
              child: SingleChildScrollView(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kendi Kendine Yardım Nedir?',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'İnsanoğlu hayatı boyunca karşılaştığı farklı yaşam zorluklarıyla mücadele etmektedir. Çeşitli yaşam zorluklarıyla başa çıkabilmenin farklı yolları vardır, bunlardan en yaygını/önemlisi profesyonel bir yardım almaktır. Bu yardım içerisinde ilaçla tedavi ve psikoterapiler yer almaktadır. Bunların dışında yardım almanın önemli bir yolu da kendi kendine yardımdır.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Kendi Kendine Yardım',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Kendi kendine yardım, kitaplar, kılavuzlar, ses dosyaları, videolar ve ya bu formatların bazı kombinasyonlarını kullanarak kişinin kendisi tarafından yürütülen yardım türüdür (Gould ve Clum, 1993). Kişinin bu süreci tamamlaması için uzmanla temas şart değildir: fakat bu çalışmak kapsamında bir uzman destekleyici ve kolaylaştırıcı olmak amacıyla sizinle haftalık olarak mail ya da telefonla iletişim sağlayacaktır.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Bu Kılavuzdan Nasıl Yararlanacağım?',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Bu kılavuz Kabul ve Kararlılık Terapisi (KKT) ilke, yöntem ve tekniklerine dayalı olarak hazırlanmıştır. Kılavuz içerisinde depresif duygu durum, kaygı ve stres sorunlarında etkili olduğu daha önce kanıtlanmış yöntem ve teknikleri barındırmaktadır.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Kılavuz İçeriği',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Bu kılavuz, içerisindeki bilgileri sadece okuyup geçebileceğiniz bir kılavuz değildir: aksine içerisinde yer alan alıştırmaları ve egzersizleri o an ve sonrasında günlük hayatınızda gerçekleştireceğiniz bir yol arkadaşıdır. Bu süreç aslında bir enstrüman çalmayı öğrenmek gibidir. Nasıl bir gitarın çalınacağını okuyarak ya da birinin bize anlatması ile öğrenemiyor ve egzersiz yapmaya ihtiyaç duyuyorsak, burada da notaları birlikte öğrenerek ve egzersiz sayesinde gitar çalmaya başlayabilirsiniz.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Alıştırmalar',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Buradaki alıştırmaları gerçekleştirebilmeniz için şartları olabildiğince sizin açınızdan daha rahat uygulanabilir hale getirmeye çalışıyoruz. Bazı alıştırmaların içerisinde karekodlar göreceksiniz ve bu karekodlar sizi alıştırmanın sesli dosyasına ulaştırmak içindir. O karekod sayesinde alıştırmayı sesli dinleyerek gerçekleştirebilirsiniz.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Zorluklar ve Kolaylaştırıcılar',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Başlangıçta bu alıştırmaları gerçekleştirmek bazılarımız için zorlayıcı olabilir fakat bu alıştırmaları yapmaya devam ettikçe uygulamanın kolaylaştığını fark edebilirsiniz.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Hatırlatma',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Bu kitaptaki kavramlar ve stratejiler kişisel gelişiminize yardımcı olabilse de bu kitabın tıbbi tavsiye içermediğini ve psikoterapi ve ya tıbbi tedavinin yerini alma amacı taşımadığını hatırlatmak istiyoruz. Eğer yaşadığınız durumun daha ciddi düzeyde olduğunu düşünüyorsanız bir ruh sağlığı uzmanına başvurunuz.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
