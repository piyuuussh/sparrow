import 'package:flutter/material.dart';
import 'package:sparrow/core/constants/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sparrow/features/pages/description_page.dart';

class ListTileWidget extends StatelessWidget {
  final Snap;
  final im;

  const ListTileWidget({
    super.key,
    this.Snap,
    this.im,
  });

  @override
  Widget build(BuildContext context) {
    String name = Snap['name'];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DescriptionPage(
              snap: Snap,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.secondary, borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: im,
                        fit: BoxFit.fill,
                      ))),
              Text(
                name,
                style: TextStyle(
                    color: AppColor.background,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
