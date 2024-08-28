import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:test3/home_page.dart';

import 'login.dart';
import 'module_1_1.dart';
import 'module_1_2.dart';
import 'module_1_3.dart';
import 'module_1_4.dart';
import 'module_1_5.dart';
import 'module_1_6.dart';
import 'module_1_6v1.dart';
import 'module_1_6v2.dart';
import 'module_1_7.dart';
import 'module_2_1.dart';
import 'module_final.dart';
import 'module_table.dart';
import 'password_forget.dart';
import 'profile.dart';
import 'signupPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(color: const Color(0xFFF5F5F5)),
      ),
      home: const HomePage(),
      routes: {
        '/Login': (context) => const LoginPage(),
        '/M1': (context) => const M1Page(),
        '/M2': (context) => M2Page(),
        '/M3T': (context) => const Mtable(),
        '/M3': (context) => const M3Page(),
        '/M5': (context) => const M5Page(),
        '/M4': (context) => const M4Page(),
        '/M6': (context) => const M6Page(),
        '/M61': (context) => const M6v1Page(),
        '/M62': (context) => const M6v2Page(),
        '/M7': (context) => const M7Page(),
        '/M8': (context) => const M8Page(),
        '/M0': (context) => const Mtable(),
        '/P1': (context) => const passwordPage(),
        '/S1': (context) => const Signup(),
        '/P2': (context) => const ProfilePage(),
        '/SH': (context) => const SelfhelpPage(),
        '/M21': (context) => const M2_1Page(),
      },
    );
  }
}

class SelfhelpPage extends StatefulWidget {
  const SelfhelpPage({super.key});

  @override
  _SelfhelpPageState createState() => _SelfhelpPageState();
}

class _SelfhelpPageState extends State<SelfhelpPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isDesktop = ResponsiveWrapper.of(context).isLargerThan(TABLET);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: isMobile
            ? const Text('Kendine Yardım')
            : Row(
          children: [
            Image.asset(
              'android/assets/goplogo.png',
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text('Kendine Yardım'),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        actions: isMobile
            ? null
            : [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/Login');
            },
            child: const Text('Giriş Yap', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Text('Ana Sayfa', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/M0');
            },
            child: const Text('Kendi Kendine Yardım', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/M1');
            },
            child: const Text('Ekibimiz', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      endDrawer: isMobile
          ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Text('Menü', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Giriş Yap'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/Login');
              },
            ),
            ListTile(
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('Kendi Kendine Yardım'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/SH');
              },
            ),
            ListTile(
              title: const Text('Ekibimiz'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/M1');
              },
            ),
          ],
        ),
      )
          : null,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'android/assets/arkaplan.png',
            fit: BoxFit.cover,
          ),
          Scrollbar(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    if (isMobile)
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildBoxContent(
                              logoPath: "android/assets/number-1.png",
                              text: "Modül 1 :"
                        "Bu kılavuz içerisinde sizlere sunduğumuz "
                        "bilgilerindahabasitveanlaşılabilirolması amacıyla “Efe ve Ayşe” isimli iki hayali kişiden destek alacağız."
                            " Sizden öncelikle onların hikayelerini okumanızı sonrasında programa devam etmenizi istiyoruz.",
                              onPressed: () {
                                Navigator.pushReplacementNamed(context ,'/M1');
                              },
                            ),
                            const SizedBox(height: 20),
                            buildBoxContent(
                              logoPath: "android/assets/number-2.png",
                              text: "Modül 2",
                              onPressed: () {
                                Navigator.pushReplacementNamed(context ,'/M21');
                              },
                            ),
                            const SizedBox(height: 20),
                            buildBoxContent(
                              logoPath: "android/assets/number-3.png",
                              text: "Modül 3",
                              onPressed: () {
                                Navigator.pushReplacementNamed(context ,'/M1');
                              },
                            ),
                            const SizedBox(height: 20),
                            buildBoxContent(
                              logoPath: "android/assets/number-4.png",
                              text: "Modül 4",
                              onPressed: () {
                                Navigator.pushReplacementNamed(context ,'/M1');
                              },
                            ),
                            const SizedBox(height: 20),
                            buildBoxContent(
                              logoPath: "android/assets/number-5.png",
                              text: "Modül 5",
                              onPressed: () {
                                Navigator.pushReplacementNamed(context ,'/M1');
                              },
                            ),
                            const SizedBox(height: 20),
                            buildBoxContent(
                              logoPath: "android/assets/number-6.png",
                              text: "Modül 6",
                              onPressed: () {
                                Navigator.pushReplacementNamed(context ,'/M1');
                              },
                            ),
                            const SizedBox(height: 20),
                            buildBoxContent(
                              logoPath: "android/assets/number-7.png",
                              text: "Modül 7",
                              onPressed: () {
                                Navigator.pushReplacementNamed(context ,'/M1');
                              },
                            ),
                          ],
                        ),
                      )
                    else
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: const EdgeInsets.all(50),
                                  child: buildBoxContent(
                                    logoPath: "android/assets/number-1.png",
                                    text: "Modül 1 :"
                                        "Bu kılavuz içerisinde sizlere sunduğumuz "
                                        "bilgilerindahabasitveanlaşılabilirolması amacıyla “Efe ve Ayşe” isimli iki hayali kişiden destek alacağız."
                                        " Sizden öncelikle onların hikayelerini okumanızı sonrasında programa devam etmenizi istiyoruz.",
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context ,'/M1');
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: const EdgeInsets.all(50),
                                  child: buildBoxContent(
                                    logoPath: "android/assets/number-2.png",
                                    text: "Modül 2",
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context ,'/M21');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: const EdgeInsets.all(50),
                                  child: buildBoxContent(
                                    logoPath: "android/assets/number-3.png",
                                    text: "Modül 3",
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context ,'/M1');
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: const EdgeInsets.all(50),
                                  child: buildBoxContent(
                                    logoPath: "android/assets/number-4.png",
                                    text: "Modül 4",
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context ,'/M1');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: const EdgeInsets.all(50),
                                  child: buildBoxContent(
                                    logoPath: "android/assets/number-5.png",
                                    text: "Modül 5",
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context ,'/M1');
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: const EdgeInsets.all(50),
                                  child: buildBoxContent(
                                    logoPath: "android/assets/number-6.png",
                                    text: "Modül 6",
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context ,'/M1');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2, // Diğer kutuların genişliğiyle aynı yap
                                child: Padding(
                                  padding: const EdgeInsets.all(50),
                                  child: buildBoxContent(
                                    logoPath: "android/assets/number-7.png",
                                    text: "Modül 7",
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context ,'/M7');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
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

  Widget _buildBoxContent() {
    return Container(
      padding: const EdgeInsets.all(20.0),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Image.asset(
            'android/assets/goplogo.png',
            height: 150,
          ),
          const SizedBox(height: 10),
          const Text(
            'Bu bir kısa metin içeriğidir.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Button action
            },
            child: const Text('Butona Tıkla'),
          ),
        ],
      ),
    );
  }


  Widget buildBoxContent({
    required String logoPath, // Logo yolunu parametre olarak al
    required String text, // Kutunun içinde gösterilecek metni parametre olarak al
    required VoidCallback onPressed, // Butonun nereye yönlendireceğini parametre olarak al
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.height * 0.40,
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(logoPath, height: MediaQuery.of(context).size.height * 0.20,), // Dinamik logo
          const SizedBox(height: 20),
          Text(
            text, // Dinamik metin
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onPressed, // Butonun nereye yönlendirileceği
            child: Text('Başla'), // Dinamik buton metni
          ),
        ],
      ),
    );
  }

}
