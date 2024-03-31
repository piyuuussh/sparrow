import 'package:flutter/material.dart';
import 'package:sparrow/core/constants/app_colors.dart';
import 'package:sparrow/features/pages/Books.dart';
import 'package:sparrow/features/widgets/drawer_list.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      backgroundColor: AppColor.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100,
          ),
          GestureDetector(
              onTap: () {},
              child: DrawerList(text: "Ask Us", icon: Icons.forum_outlined)),
          DrawerList(text: "Wallpapers", icon: Icons.add_to_photos),
          DrawerList(text: "Ringtones", icon: Icons.library_music),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyBooks()),
                );
              },
              child: DrawerList(text: "Books", icon: Icons.book_rounded)),
          DrawerList(text: "About Us", icon: Icons.info),
          DrawerList(text: "Share Us", icon: Icons.share),
          DrawerList(
            text: "Rate Us",
            icon: Icons.note_alt_sharp,
          ),
          const Spacer(),
          const Padding(
            padding:
                EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8, top: 230),
            child: Text(
              "Developed by Piyush Singh & Utkarsh Ranjan",
              style: TextStyle(color: Colors.white, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
