import 'package:bloc_test/features/home/model/product_data_model.dart';
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget(
      {super.key, required this.product, required this.homeBloc});
  final ProductDataModel product;
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .2,
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(product.imageUrl), fit: BoxFit.cover)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      homeBloc
                          .add(WishListClickedEvent(clickedProduct: product));
                    },
                    icon: const Icon(Icons.favorite_border)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(CartClickedEvent(clickedProduct: product));
                    },
                    icon: const Icon(Icons.add_shopping_cart_rounded))
              ],
            ),
          ),
          Container(
            color: Colors.white.withOpacity(.5),
            height: 70,
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(product.name),
                    const Spacer(),
                    Text("${product.price.toStringAsFixed(2)} BDT"),
                  ],
                ),
                Text(
                  product.description,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
