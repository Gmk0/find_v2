import 'package:find_v2/components/netWorkImage.dart';
import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/views/category/OneCategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BuildCategoryCard extends StatelessWidget {
  BuildCategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => OneCategory(category: category),
            transition: Transition.leftToRightWithFade);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: 200.w,
                    height: 120.w,
                    child: PNetworkImage(
                      category.media[0].url,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    width: 180.w,
                    height: 30.w,
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.black, Colors.black12])),
                    ),
                  ),
                  Positioned(
                      left: 5,
                      bottom: 10,
                      width: 170.w,
                      child: Expanded(
                        child: Text(
                          category.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1),
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
