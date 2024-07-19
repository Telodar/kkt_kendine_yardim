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
      home: const M4Page(),
      routes: {
        '/Home': (context) => HomePage(),
        '/Login': (context) => LoginPage(),
        // LoginPage olmadığı için HomePage yapıldı
        '/M1': (context) => const M1Page(),
        '/M2': (context) => M2Page(),
        '/M3': (context) => M3Page(),
        '/M4': (context) => const M4Page(),
      },
    );
  }
}

class M4Page extends StatefulWidget {
  const M4Page({Key? key}) : super(key: key);

  @override
  _M4PageState createState() => _M4PageState();
}

class _M4PageState extends State<M4Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  void _submitForm() {
    print('Kaçınma: ${_controller1.text}');
    print('Tartışma: ${_controller2.text}');
    print('Bastırma: ${_controller3.text}');
    print('Hissizleştirme: ${_controller4.text}');
    print('Dikkat Değiştirme: ${_controller5.text}');
    print('Olumlu Telkin: ${_controller6.text}');

    _controller1.clear();
    _controller2.clear();
    _controller3.clear();
    _controller4.clear();
    _controller5.clear();
    _controller6.clear();
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
                Navigator.pushNamed(context, '/M3'); // Modül 3'e git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_4),
              title: Text('Modül 4'),
              onTap: () {
                Navigator.pushNamed(context, '/M3T');
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
                      "Az önceki yazdığınız tabloya baktığınızda içsel deneyimlerinizle başa çıkmak veya onları kontrol "
                      "etmeye çalışmak için neler yaptığınıza bir bakın (B Sütunu). İnsanlar yaşadığı olumsuz duygu ve "
                      "düşüncelerden kurtulmak için bazı kontrol yöntemlerini uygulamaktadır. Aşağıda bu kontrol "
                      "yöntemlerine yönelik örnekler verilmiştir (Harris, 2019). Siz de eğer bunlara benzer uyguladığınız "
                      "kontrol yöntemleri varsa konuyla ilgili boş kutulara bunları yazınız."),
                  SizedBox(height: 10),
                  Table(
                    border: TableBorder.all(color: Colors.transparent),
                    columnWidths: {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                    },
                    children: [
                      _buildTableRow(
                          'Kaçınma: Sizi rahatsız edebilecek durumlardan uzak durma',
                          'Kaygı yaşamamak için arkadaşlarının davetini geri çevirmek.',
                          _controller1),
                      _buildTableRow(
                          'Tartışma: Aklınıza gelen düşünceyi çürütmek için ona mantıklı bir karşılık vermek.',
                          '+Hiçbir şeyi beceremiyorum -Hayır daha önce şunları şunları yapmıştın.',
                          _controller2),
                      _buildTableRow(
                          'Bastırma: Sizi rahatsız eden duygu ve düşünceleri bastırmaktır.',
                          'Duygu ve düşünceler yokmuş gibi yapmak',
                          _controller3),
                      _buildTableRow(
                          'Hissizleştirme: Kendini hissizleştirmeye çalışarak duygu ve düşüncelerden kurtulmaya çalışmak.',
                          'Alkol, sigara kullanma, kendine zarar verme',
                          _controller4),
                      _buildTableRow(
                          'Dikkat Değiştirme: İstemediğin duygu ve düşünceler geldiğinde dikkati başka yöne vererek onlardan kurtulma',
                          'İstenmeyen duygu düşünce geldiğinde, tv izleme, Kitap okuma sosyal medyada gezinme',
                          _controller5),
                      _buildTableRow(
                          'Olumlu Telkin: Kendi düşünce ve duygularını yönetmek için olumlu telkinde bulunma',
                          'Kendine gel, sen iyisin, yaparsın',
                          _controller6),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Gönder'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Aslında bu girişimleriniz oldukça makul ve çoğu insanın yaptığı şeyi yapıyorsunuz. Bu girişimler aşırıya"
              "kaçmadan, işe yarayacakları zaman ve sizin değerleriniz doğrultusunda yaşamanıza engel olmadığında"
              "sorun yok fakat tam tersi durumlarda bu yöntemler sorunlara yol açabilmektedir",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(
      String text1, String text2, TextEditingController controller) {
    return TableRow(
      children: [
        _buildTableCell(text1),
        _buildTableCell(text2),
        _buildTableCellWithTextField(controller),
      ],
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildTableCellWithTextField(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}