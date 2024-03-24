import 'package:flutter/material.dart';
import 'package:sparrow/core/constants/app_colors.dart';
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
          DrawerList(text: "Books", icon: Icons.book_rounded),
          DrawerList(text: "About Us", icon: Icons.info),
          DrawerList(text: "Share Us", icon: Icons.share),
          DrawerList(
            text: "Rate Us",
            icon: Icons.note_alt_sharp,
          ),
        ],
      ),
    );
  }
}
