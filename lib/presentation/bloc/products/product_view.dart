import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:noteit/domain/models/Product.dart';
import 'package:noteit/presentation/bloc/products/product_bloc.dart';
import 'package:noteit/presentation/bloc/products/product_state.dart';
import 'package:noteit/presentation/pages/InsertNotePage.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Products',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter products name',
              ),
              onChanged: (query) {
                //context.read<NotesBloc>()..add(FilterAllNotes(query));
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
                        //  Get.to(NotePage(),arguments: state.allProducts[index]);
                      },
                      child: CardProductItem(
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

class CardProductItem extends StatelessWidget {
  final Product product;

  const CardProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black12,
      color: Colors.black87,
      margin: EdgeInsets.all(16),
      child: Container(
          width: 500,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${product.title}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${product.description}",
                style: TextStyle(fontSize: 16, color: Colors.yellow),
              ),
            ],
          )),
    );
  }
}
