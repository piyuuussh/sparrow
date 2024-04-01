// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sparrow/core/constants/Icons.dart';

import 'package:sparrow/core/constants/app_colors.dart';
import 'package:sparrow/features/pages/ListPage.dart';
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
              child: staticVaribales.X ? Text('English') : Text("हिन्दी"),
              onTap: () {
                setState(() {
                  staticVaribales.X = !staticVaribales.X;
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
          left: 17,
          right: 17,
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
                  image: const DecorationImage(
                    image: AssetImage('Assets/image/image.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
                child: StreamBuilder(
                    stream: (staticVaribales.X == true)
                        ? FirebaseFirestore.instance
                            .collection('English')
                            .snapshots()
                        : FirebaseFirestore.instance
                            .collection('Hindi')
                            .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.builder(
                        //padding: EdgeInsets.all(15),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, index) {
                          final Icon = IconList.IconsPath[index];
                          return ListTileWidget(
                            Snap: snapshot.data!.docs[index].data(),
                            im: AssetImage(Icon),
                          );
                        },
                      );
                    })),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListSparrow()),
                );
              },
              child: const Text(
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
