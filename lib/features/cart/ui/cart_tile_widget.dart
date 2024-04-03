import 'package:bloc_test/features/home/model/product_data_model.dart';
import 'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  const CartTileWidget(
      {super.key, required this.product, required this.cartBloc});
  final ProductDataModel product;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .2,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(product.imageUrl), fit: BoxFit.cover)),
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Text(product.name),
                const Spacer(),
                Text("${product.price.toStringAsFixed(2)} BDT"),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                // cartBloc.add(CartClickedEvent(clickedProduct: product));
              },
              icon: const Icon(Icons.remove))
        ],
      ),
    );
  }
}
