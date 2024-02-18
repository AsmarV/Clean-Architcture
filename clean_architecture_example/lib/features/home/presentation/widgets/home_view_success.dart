

import 'package:clean_architecture_example/features/home/presentation/widgets/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class HomeViewSuccess extends StatelessWidget {
  const HomeViewSuccess({super.key, required this.prods});

  final List<ProductModel> prods;

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(str: prods);
  }
}
