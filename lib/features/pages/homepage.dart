// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sparrow/core/constants/app_colors.dart';
import 'package:sparrow/features/widgets/drawer.dart';
import 'package:sparrow/features/widgets/list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool X = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.background,
        titleTextStyle: TextStyle(color: AppColor.primary, fontSize: 20),
        title: Row(
          children: [
            Spacer(),
            GestureDetector(
              child: X ? Text('English') : Text("हिन्दी"),
              onTap: () {
                setState(() {
                  X = !X;
                });
                ;
              },
            ),
            Icon(Icons.language)
          ],
        ),
      ),
      backgroundColor: AppColor.background,
      drawer: DrawerWidget(),
      body: Container(
        margin: EdgeInsets.only(
          left: 27,
          right: 27,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: AppColor.secondary,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 20, // spacing between rows
                  crossAxisSpacing: 20, // spacing between columns
                ),
                // padding around the grid
                itemCount: 6, // total number of items
                itemBuilder: (context, index) {
                  return ListTileWidget(
                    name: "name",
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "View all",
                style: TextStyle(fontSize: 20, color: AppColor.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
