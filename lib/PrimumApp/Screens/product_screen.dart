import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../Contents/Widget/contents.dart';
import '../Provider/db_provider.dart';
import '../Widgets/MainClients/main_appbar.dart';
import '../Widgets/Products/category_item.dart';
import '../Widgets/Products/filter_button.dart';
import '../Widgets/Products/product_item.dart';
import 'add_product.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dbProvider=Provider.of<DBProvider>(context,listen: true);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: builAppBar(condition: 'prod', ctx: context, title: 'المنتجات'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildFilterButton(),
              const SizedBox(height: 5),
              buildCategoryItem(context),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.18,
                  children: dbProvider.productList.map((e) =>ProductItem(model: e,context: context)).toList(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pushNavigate(context, AddProduct());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
