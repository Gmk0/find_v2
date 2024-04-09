import 'package:find_v2/components/bottomNav.dart';
import 'package:find_v2/components/buildCategoryCard.dart';
import 'package:find_v2/controller/categoryController.dart';
import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/views/category/TestCategory.dart';
import 'package:find_v2/views/category/oneSubCategory.dart';
import 'package:find_v2/views/home/searchPageAll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCategory extends GetView<CategoryController> {
  const AllCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catégories'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const SearchPageAll(),
                  transition: Transition.downToUp);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      bottomSheet: const BottomNav(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Catégories',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      shrinkWrap: true,
                      itemCount: controller.category.length,
                      itemBuilder: (BuildContext context, int index) {
                        final category = controller.category[index];
                        return BuildCategoryCard(category: category);
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Détails des Catégories',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: controller.category.map((category) {
              return _buildCategoryDetails(
                  category.name, category.subcategories!);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryDetails(
      String categoryName, List<SubCategoryModel?> subCategories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryName,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: subCategories
              .map((subCategory) => GestureDetector(
                    onTap: () {
                      Get.to(OneSubCategory(subcategory: subCategory));
                      // Gérer le clic sur la sous-catégorie ici
                    },
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(subCategory?.name ?? ''),
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
