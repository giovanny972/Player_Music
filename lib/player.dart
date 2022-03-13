import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class PlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(),
      body: Container(
        child: Column(children: [
          Container(),
        ]),
      ),
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
