import 'package:flutter/material.dart';
import 'package:sparrow/core/constants/app_colors.dart';

class ListTileWidget extends StatelessWidget {
  final iamge;
  final String name;
  const ListTileWidget({super.key, this.iamge, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.secondary, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 50,
            ),
            Text(
              name,
              style: TextStyle(
                  color: AppColor.background,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
