import 'package:flutter/material.dart';
import 'package:youtube/telas/camera.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricoes.dart';
import 'package:youtube/telas/perfil.dart';
import 'package:youtube/telas/shorts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int _indiceAtual = 0;

  void _incrementCounter() {
    setState(() {
     
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(),
      Shorts(),
      Camera(),
      Inscricoes(),
      Perfil(),
    ];
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'lib/images/youtube.png',
          width: 100,
          height: 50,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.cast),
            onPressed: () {
              // Ação ao pressionar o botão
            },
          ),
          IconButton(
            onPressed: () {
              // Ação ao pressionar o botão
            }, 
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              // Ação ao pressionar o botão
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(label: 'Início', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Shorts', icon: SizedBox(width: 30, height: 30, child: Image.asset('lib/images/shorts.jpg'))),
          BottomNavigationBarItem(label: '', icon: PlusCircleIcon()),
          BottomNavigationBarItem(label: 'Inscrições', icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(label: 'Perfil', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}

class PlusCircleIcon extends StatelessWidget {
  final double size; // Tamanho do ícone
  final double strokeWidth; // Largura do círculo
  final Color circleColor; // Cor do círculo
  final Color plusColor; // Cor do sinal de +

  PlusCircleIcon({
    Key? key,
    this.size = 40.0,
    this.strokeWidth = 1.5,
    this.circleColor = Colors.black,
    this.plusColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size), // Define o tamanho do canvas
      painter: PlusCirclePainter(
        strokeWidth: strokeWidth,
        circleColor: circleColor,
        plusColor: plusColor,
      ),
    );
  }
}

class PlusCirclePainter extends CustomPainter {
  final double strokeWidth;
  final Color circleColor;
  final Color plusColor;

  PlusCirclePainter({
    required this.strokeWidth,
    required this.circleColor,
    required this.plusColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Pintar o círculo
    Paint circlePaint = Paint()
      ..color = circleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Define o retângulo do círculo
    Rect rect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2);

    // Desenha o círculo
    canvas.drawArc(rect, 0, 2 * 3.14, false, circlePaint); // Círculo completo

    // Pintar o sinal de "+"
    Paint plusPaint = Paint()
      ..color = plusColor
      ..style = PaintingStyle.fill;

    // Desenhar as linhas do "+"
    double plusSize = size.width * 0.5; // Tamanho do sinal de "+"
    double lineWidth = strokeWidth*1.5; // Largura da linha

    // Linha horizontal do "+"
    canvas.drawRect(Rect.fromCenter(center: Offset(size.width / 2, size.height / 2), width: plusSize, height: lineWidth), plusPaint);
    // Linha vertical do "+"
    canvas.drawRect(Rect.fromCenter(center: Offset(size.width / 2, size.height / 2), width: lineWidth, height: plusSize), plusPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}