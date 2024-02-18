import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_example/features/home/data/models/product_model.dart';
import 'package:clean_architecture_example/features/home/presentation/widgets/cache_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/responsive.dart';
import '../../../../theme/text_styles.dart';

class DynamicHeightGridView extends StatelessWidget {
  const DynamicHeightGridView({super.key, required this.str});

  final List<ProductModel> str;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _listView(getTwoList(str, true)),
          _listView(getTwoList(str, false))
        ],
      ),
    );
  }

  Widget _listView(List<ProductModel> str) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView.builder(
          itemCount: str.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(sized16() / 2),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(sized16() / 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 6,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                CachedImageView(img: str[index].thumbnail!),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: sized16() / 2,
                    ),
                    Text(
                      str[index].title ?? '',
                      style: headline3Style,
                    ),
                    Text(
                      str[index].description ?? '',
                      style: desTextStyle,
                    ),
                    Text(
                      str[index].price?.toString() ?? '',
                      style: titleBold,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<ProductModel> getTwoList(List<ProductModel> originalList, bool isLift) {
    // Two lists to store elements based on index
    final List<ProductModel> list1 = [];
    final List<ProductModel> list2 = [];

    // Iterate through the original list and distribute elements based on index
    for (int i = 0; i < originalList.length; i++) {
      if (i % 2 == 0) {
        // Add elements at even indices to list1
        list1.add(originalList[i]);
      } else {
        // Add elements at odd indices to list2
        list2.add(originalList[i]);
      }
    }

    return isLift ? list1 : list2;
  }
}
