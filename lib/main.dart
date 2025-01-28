import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: -20,
            bottom: -20,
            left: -20,
            right: -20,
            child: Image.asset(
              "assets/background.png",
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            )),
        Positioned(
            bottom: 20,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.sizeOf(context).width * 0.04),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipPath(
                        clipper: CutOut(
                            holeRadius: 120,
                            context: context,
                            width: MediaQuery.sizeOf(context).width),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Color.fromARGB(133, 6, 6, 6),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                              MediaQuery.sizeOf(context).width * 0.045,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Find your passion",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.035,
                                ),
                                const Text(
                                  "Bring your idea to life means tranforming your creative vision into reality. it's about turning concepts into actionable plans and tangible outcomes",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2),
                                ),
                                const SizedBox(
                                  height: 60,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: -40,
                          child: GestureDetector(
                            onTap: () {
                              // Do something
                              // TODO: Implement the action
                            },
                            child: Container(
                              width: 85,
                              height: 85,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.pink,
                                  width: 2,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(80)),
                              ),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60)),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [Colors.amber, Colors.green])),
                              ),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    "fotor",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
            ))
      ],
    ));
  }
}

class CutOut extends CustomClipper<Path> {
  CutOut(
      {required this.holeRadius, required this.context, required this.width});

  final BuildContext context;
  final double width;
  final double holeRadius;
  double get right {
    return (width - holeRadius) / 2;
  }

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo((size.width - holeRadius) / 2 + size.width * 0.02, size.height)
      ..arcToPoint(
        Offset(size.width - right, size.height),
        clockwise: true,
        radius: const Radius.circular(4),
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..lineTo(0.0, 0.0)
      ..lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CutOut oldClipper) => true;
}
