import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Music Player",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerSection(),
            PlayListeSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomSection(),
    );
  }
}

class BottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.pause,
            color: Colors.white,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Text(
            'Bendo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_circle_up, color: Colors.white),
          label: '',
        ),
      ],
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0),
      elevation: 0,
      leading: const IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: null,
      ),
      actions: const [
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 25,
          ),
          onPressed: null,
        ),
      ],
    );
  }
}

class headerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage('images/ariana.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            bottom: 30,
            child: Text(
              'Ariana Grande',
              style: GoogleFonts.arizonia(
                color: Colors.white,
                fontSize: 43,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: MaterialButton(
              color: Colors.blue,
              shape: const CircleBorder(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerPage(),
                  ),
                );
              },
              child: Padding(
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                padding: EdgeInsets.all(17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayListeSection extends StatelessWidget {
  final List playList = [
    {
      'title': 'Bendo',
      'duration': '5,16',
      'played': true,
    },
    {
      'title': 'Make money',
      'duration': '3,23',
      'played': false,
    },
    {
      'title': 'Hostile',
      'duration': '3,10',
      'played': false,
    },
    {
      'title': 'My life be like',
      'duration': '4,54',
      'played': false,
    },
    {
      'title': 'Maskoff',
      'duration': '4,32',
      'played': false,
    },
    {
      'title': 'See you my friend',
      'duration': '6,34',
      'played': false,
    },
    {
      'title': 'No wooman no cry',
      'duration': '4,67',
      'played': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 40, 20, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Text(
                  'Show All',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: playList.map(
              (song) {
                return Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        song['title'],
                        style: TextStyle(
                          color: song['played'] ? Colors.blue : Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            song['duration'],
                            style: TextStyle(
                              color:
                                  song['played'] ? Colors.blue : Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: song['played'] ? Colors.blue : Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
