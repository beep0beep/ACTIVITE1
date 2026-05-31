import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';



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
      ),
      home: const MyFirstPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({super.key, required this.title});


  final String title;

  @override
  State<MyFirstPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyFirstPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search)),
        title: const Text('Your streaming emissions'),
        actions: [
          IconButton(icon: const Icon(Icons.list),
          onPressed: () {},
          )
        ],
      ),
      body: const Center(
        child: PartieGrilleImage(),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.search),
          label: 'Recherche'),
          BottomNavigationBarItem(icon: Icon(Icons.person),
          label: 'Profil'),
        ],
          
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class IdentiStreaming extends StatelessWidget {
  final String tagStream;
  final String imageStream;
  final String nomStream;
  final String chaineRadio;

  const IdentiStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.nomStream,
    required this.chaineRadio,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(2, 4),
          )
        ]
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
              AlbumStreaming(
                tagStream: tagStream,
                imageStream: imageStream,
                nomStream: nomStream,
                chaineRadio: chaineRadio,
              ),
            )
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(tag: tagStream, child: Image.asset(imageStream, width: double.infinity, height: 120, fit: BoxFit.cover,)),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.amber.shade100,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nomStream, style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4), 
                  Text(
                    chaineRadio,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PartieGrilleImage extends StatelessWidget {

  const PartieGrilleImage ({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveGridList(
      desiredItemWidth: 100,
      minSpacing: 20,
      children: [
        IdentiStreaming(tagStream: 'Streaming news', imageStream: 'assets/images/news.jpeg', nomStream: 'ONly News', chaineRadio: '4th radio'),
        IdentiStreaming(tagStream: 'Mode', imageStream: 'assets/images/mode.jpeg', nomStream: 'Trending mode', chaineRadio: '3rd Radio'),
        IdentiStreaming(tagStream: 'crime', imageStream: 'assets/images/crimescene.jpeg', nomStream: 'Criminal cases', chaineRadio: '2nd Radio'),
        IdentiStreaming(tagStream: 'Foot', imageStream: 'assets/images/foot.jpeg', nomStream: 'Live Matches', chaineRadio: '1st Radio'),
      ],
    );
  }
}


class AlbumStreaming extends StatelessWidget {
  final String tagStream;
  final String imageStream;
  final String nomStream;
  final String chaineRadio;

  const AlbumStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.nomStream,
    required this.chaineRadio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // ── AppBar ───────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nomStream,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              chaineRadio,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // ── Hero Image ─────────────────────────────────────
            Hero(
              tag: tagStream,
              child: SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.asset(
                  imageStream,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // ── Gradient title overlay ─────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.amber.shade700,
                    Colors.amber.shade300,
                  ],
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.radio, color: Colors.white, size: 28),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nomStream,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          chaineRadio,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}