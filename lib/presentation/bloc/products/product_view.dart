import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:noteit/data/model/product/ProductEntity.dart';
import 'package:noteit/domain/models/Product.dart';
import 'package:noteit/main.dart';
//import 'package:noteit/objectbox.g.dart';
import 'package:noteit/presentation/bloc/products/product_bloc.dart';
import 'package:noteit/presentation/bloc/products/product_event.dart';
import 'package:noteit/presentation/bloc/products/product_state.dart';
import 'package:noteit/presentation/pages/InsertNotePage.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productBox = objectbox.store.box<ProductEntity>();
    final product = ProductEntity(
        title: 'abc',
        description: "asc",
        id: 1,
        price: 1,
        discountPercentage: 1,
        rating: 1,
        stock: 1,
        brand: '',
        category: '',
        thumbnail: '');
    productBox.put(product);

    final prod = productBox.get(1);
    print("product " + prod!.title.toString());

    var appBar = AppBar(
      elevation: 0.0,
      titleSpacing: 0.0,
      leading: Icon(Icons.menu),
      title: Text('Products'),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
          onPressed: () {
            // TODO: Add open login (104)
          },
        ),
        IconButton(
          icon: Icon(
            Icons.tune,
            semanticLabel: 'filter',
          ),
          onPressed: () {
            Get.toNamed("/note");
          },
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter products name',
              ),
              onChanged: (query) {
                context.read<ProductBloc>()..add(ShowFiltersProducts(query));
              },
            ),
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              if (state is ProductError) {
                return Container();
              } else if (state is ProductLoading) {
                return CircularProgressIndicator();
              } else if (state is AllProductsState) {
                return Expanded(
                    child: MasonryGridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  itemCount: state.allProducts.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<ProductBloc>()
                          ..add(AddToCart(state.allProducts[index]));
                      },
                      child: CartItemUpdated(
                        product: state.allProducts[index],
                      ),
                    );
                  },
                ));
              } else
                return SizedBox();
            }),
            Container(
              margin: EdgeInsets.all(16),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                      onPressed: () {
                        // context.read<NotesBloc>().add(DeleteNoteEvent(Note(
                        //     id: 3, title: "Watch", description: "All is well")));
                      },
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black54,
                      child: const Icon(Icons.delete),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        Get.to(InsertNotePage());
                      },
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black54,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartItemUpdated extends StatelessWidget {
  final Product product;

  const CartItemUpdated({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(10),
      // TODO: Adjust card heights (103)
      child: Column(
        // TODO: Center items on the card (103)
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18 / 11,
            child: Image.network(
              product.images![0], fit: BoxFit.fitWidth,
              // package: product.assetPackage,
              // TODO: Adjust the box size (102)
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              // TODO: Align labels to the bottom and center (103)
              crossAxisAlignment: CrossAxisAlignment.start,
              // TODO: Change innermost Column (103)
              children: <Widget>[
                // TODO: Handle overflowing labels (103)
                Text(
                  "${product.title}",
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 1,
                ),
                const SizedBox(height: 8.0),
                Text(
                  "${product.description}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
