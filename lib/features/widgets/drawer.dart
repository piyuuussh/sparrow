import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          DrawerList(text: "Ask Us", icon: Icons.forum_outlined),
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
          DrawerList(text: "Rate Us", icon: Icons.note_alt_sharp),
          Spacer(),
          Text(
            "Developed by Piyush Singh & Utkarsh Ranjan",
            style: TextStyle(color: Colors.white, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
