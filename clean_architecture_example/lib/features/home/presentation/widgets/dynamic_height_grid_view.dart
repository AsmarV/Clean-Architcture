import 'package:clean_architecture_example/core/utils/cache_image_view.dart';
import 'package:clean_architecture_example/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/responsive.dart';
import '../../../../theme/text_styles.dart';

class DynamicHeightGridView extends StatelessWidget {
  const DynamicHeightGridView({super.key, required this.str});

  final List<ProductModel> str;

  @override
  Widget build(BuildContext context) {
    final leftColumn = getFilteredList(str, true);
    final rightColumn = getFilteredList(str, false);
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _listView(leftColumn),
          _listView(rightColumn),
        ],
      ),
    );
  }

  Widget _listView(List<ProductModel> str) {
    return Flexible(
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
                CachedImageView(img: str[index].thumbnail),
                SizedBox(width: double.infinity, height: sized16() / 2),
                Text(str[index].title, style: headline3Style),
                Text(str[index].description, style: desTextStyle),
                Text(str[index].price.toString(), style: titleBold)
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<ProductModel> getFilteredList(List<ProductModel> originalList, bool isLeft) {
    return originalList
        .asMap()
        .entries
        .where((entry) => (entry.key % 2 == 0) == isLeft)
        .map((entry) => entry.value)
        .toList();
  }
}
