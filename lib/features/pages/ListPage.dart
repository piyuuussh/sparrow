import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sparrow/core/constants/Icons.dart';
import 'package:sparrow/core/constants/app_colors.dart';
import 'package:sparrow/features/widgets/list_tile.dart';

class ListSparrow extends StatelessWidget {
  ListSparrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Sections",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
      backgroundColor: AppColor.background,
      body: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: StreamBuilder(
              stream: (staticVaribales.X == true)
                  ? FirebaseFirestore.instance.collection('English').snapshots()
                  : FirebaseFirestore.instance.collection('Hindi').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GridView.builder(
                  padding: EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, index) {
                    final Icon = IconList.IconsPath[index];
                    return ListTileWidget(
                      Snap: snapshot.data!.docs[index].data(),
                      im: AssetImage(Icon),
                    );
                  },
                );
              })),
    );
  }
}
