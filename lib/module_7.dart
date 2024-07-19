import 'package:flutter/material.dart';
import 'package:kkt_kendine_yardim/home_page.dart';
import 'package:kkt_kendine_yardim/main.dart';
import 'package:kkt_kendine_yardim/module_2.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'module_3.dart';
import 'module_4.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
      home: M7Page(),
      routes: {
        '/Home': (context) => HomePage(),
        '/Login': (context) => LoginPage(),
        '/M2': (context) => const M2Page(),
        '/M3': (context) => const M3Page(),
        '/M4': (context) => const M4Page(),
      },
    );
  }
}

class M7Page extends StatefulWidget {
  const M7Page({super.key});

  @override
  State<M7Page> createState() => _M7PageState();
}

class _M7PageState extends State<M7Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textController = TextEditingController();

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'Z7NURMFq99o', // Buraya YouTube video ID'sini yazın
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  void initState() {
    super.initState();
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
              backgroundDecoration: const BoxDecoration(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    String text = _textController.text;
    print(text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 1000;
    final double sidePadding = isDesktop ? 200 : 30;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.indigo.withOpacity(0.4),
        title: const Text('Modül 6'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Login');
            },
            child:
                const Text('Giriş Yap', style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/Home');
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
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
              child: const Text(
                'Modüller',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.looks_one),
              title: const Text('Modül 1'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.looks_two),
              title: const Text('Modül 2'),
              onTap: () {
                Navigator.pushNamed(context, '/M2');
              },
            ),
            ListTile(
              leading: const Icon(Icons.looks_3),
              title: const Text('Modül 3'),
              onTap: () {
                Navigator.pushNamed(context, '/M3');
              },
            ),
            ListTile(
              leading: const Icon(Icons.looks_4),
              title: const Text('Modül 4'),
              onTap: () {
                Navigator.pushNamed(context, '/M4');
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
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.indigo.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Text(
                    "Şimdi bu bölümü bir kendindelik egzersizi ile bitirmek istiyoruz. İsterseniz aşağıdaki "
                    "metni bir kere okuduktan sonra egzersizi kendiniz gerçekleştirebilir ya da yan tarafta "
                    "bulunana karekod yardımıyla ses dosyasına gidebilir ve o ses yardımıyla egzersizi "
                    "gerçekleştirebilirsiniz.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                YoutubePlayer(
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                  onReady: () {
                    // Add logic here
                  },
                  controller: _controller,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
