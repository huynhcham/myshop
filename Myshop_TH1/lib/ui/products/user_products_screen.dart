import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_product_list_tile.dart';
import 'products_manager.dart';
import '../shared/app_drawer.dart';
import 'package:myshop/ui/products/edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductsManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Product'),
        actions: <Widget>[buildAddButton(context)],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        // ignore: avoid_print
        onRefresh: () async => print('refresh products'),
        child: buildUserProductListView(productsManager),
      ),
    );
  }

  Widget buildUserProductListView(ProductsManager productsManager) {
    return Consumer<ProductsManager>(
      builder: (ctx, productsManager, child) {
        return ListView.builder(
          itemCount: productsManager.itemCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              UserProductListTile(
                productsManager.items[i],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditProductScreen.routeName,
        );
      },
    );
  }
}
