import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:photo_view/photo_view.dart';
import 'login.dart';
import 'home_page.dart';
import 'module_1.dart';
import 'module_2.dart';
import 'module_3.dart';
import 'module_4.dart';
import 'module_6.dart';
import 'module_7.dart';
import 'module_table.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PageControllerProvider(),
      child: MyApp(),
    ),
  );
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
      home: Consumer<PageControllerProvider>(
        builder: (context, pageControllerProvider, child) {
          return M8Page();
        },
      ),
      routes: {
        '/Home': (context) => HomePage(),
        '/Login': (context) => LoginPage(),
        '/M1': (context) => const M1Page(),
        '/M2': (context) => M2Page(),
        '/M3T': (context) => const Mtable(),
        '/M3': (context) => const M3Page(),
        '/M4': (context) => const M4Page(),
        '/M6': (context) => const M6Page(),
        '/M7': (context) => const M7Page(),
      },
    );
  }
}

class M8Page extends StatefulWidget {
  const M8Page({super.key});

  @override
  State<M8Page> createState() => _M8PageState();
}

class _M8PageState extends State<M8Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  String _selectedOption = '';

  void _submitForm() {
    print('Cevap 1: ${_controller1.text}');
    print('Cevap 2: ${_controller2.text}');
    print('Cevap 3: ${_controller3.text}');
    print('Cevap 4: ${_controller4.text}');
    print('Çalışma Süresi: $_selectedOption');

    _controller1.clear();
    _controller2.clear();
    _controller3.clear();
    _controller4.clear();
    setState(() {
      _selectedOption = '';
    });
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
        title: Text('Modül 5'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Provider.of<PageControllerProvider>(context, listen: false)
                  .changePage(HomePage()); // Ana sayfaya yönlendirme
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
                Provider.of<PageControllerProvider>(context, listen: false)
                    .changePage(M1Page());
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_two),
              title: Text('Modül 2'),
              onTap: () {
                Provider.of<PageControllerProvider>(context, listen: false)
                    .changePage(M2Page());
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_3),
              title: Text('Modül 3'),
              onTap: () {
                Provider.of<PageControllerProvider>(context, listen: false)
                    .changePage(M3Page());
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_4),
              title: Text('Modül 4'),
              onTap: () {
                Provider.of<PageControllerProvider>(context, listen: false)
                    .changePage(M4Page());
              },
            ),
            ListTile(
              leading: const Icon(Icons.looks_5),
              title: const Text('Modül 5'),
              onTap: () {
                Provider.of<PageControllerProvider>(context, listen: false)
                    .changePage(M8Page());
              },
            ),
            ListTile(
              leading: const Icon(Icons.looks_6),
              title: const Text('Modül 6'),
              onTap: () {
                Provider.of<PageControllerProvider>(context, listen: false)
                    .changePage(M6Page());
              },
            ),
            ListTile(
              leading: const Icon(Icons.numbers),
              title: const Text('Modül 7'),
              onTap: () {
                Provider.of<PageControllerProvider>(context, listen: false)
                    .changePage(M7Page());
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: sidePadding),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Text(
                "İlk bölümü bitirdiniz. Buraya kadar devam ettiğiniz ve etkinlikleri yaptığınız için kendinizi tebrik"
                    "edebilirsiniz."
                    "Bu sayfada bitirmiş olduğunuz bu bölümü değerlendirmenizi istiyorum. Aşağıdaki sorular"
                    "doğrultusunda değerlendirmenizi yapınız.",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 100), // Sayfanın kaydırılabilir kısmı için boşluk
            _buildQuestionContainer(
              "Bu bölümü okurken dikkatinizi en çok ne çekti? Sizin yaşadıklarınızla buradaki anlatılar benziyor mu? Benziyor ise neresi benziyor?",
              _controller1,
            ),
            SizedBox(height: 30),
            _buildQuestionContainer(
              "Bu bölümü okurken dikkatinizi en çok ne çekti? Sizin yaşadıklarınızla buradaki anlatılar benziyor mu? Benziyor ise neresi benziyor?",
              _controller2,
            ),
            SizedBox(height: 30),
            _buildQuestionContainer(
              "Bu bölümde öğrendiklerinizi kısaca belirtiniz. Bir kaç cümle ya da anahtar kelimelerle belirtebilirsiniz.",
              _controller3,
            ),
            SizedBox(height: 30),
            _buildQuestionContainer(
              "Sormak istediğiniz sorular varsa aşağıya yazınız. Aklınıza her ne takılırsa mutlaka sorun.",
              _controller4,
            ),
            SizedBox(height: 30),
            _buildOptionContainer(
              "Bu bölüm üzerinde ne kadar çalıştınız?",
              ['0-15 dk', '15-30 dk', '30-60 dk', '1-3 saat', '3-5 saat'],
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Gönder'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionContainer(String question, TextEditingController controller) {
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
          const SizedBox(height: 10),
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

  Widget _buildOptionContainer(String question, List<String> options) {
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
          const SizedBox(height: 10),
          Wrap(
            spacing: 10.0,
            children: options.map((option) {
              return ChoiceChip(
                label: Text(option),
                selected: _selectedOption == option,
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      _selectedOption = option;
                    } else {
                      _selectedOption = '';
                    }
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class PageControllerProvider with ChangeNotifier {
  Widget _currentPage = HomePage();

  Widget get currentPage => _currentPage;

  void changePage(Widget newPage) {
    _currentPage = newPage;
    notifyListeners();
  }
}
