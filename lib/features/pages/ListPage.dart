import 'package:flutter/material.dart';
import 'package:sparrow/core/constants/app_colors.dart';
import 'package:sparrow/features/widgets/list_tile.dart';

class ListSparrow extends StatelessWidget {
  const ListSparrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: GridView.builder(
            padding: EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemCount: 12,
            itemBuilder: (BuildContext context, index) {
              return ListTileWidget(name: "Text");
            }),
      ),
    );
  }
}
