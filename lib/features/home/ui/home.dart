import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/ui/cart.dart';
import '../../wishlist/ui/wishlist.dart';
import '../bloc/home_bloc.dart';
import 'product_tile_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (context, current) => current is HomeActionState,
      buildWhen: (context, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Wishlist()));
        } else if(state is HomeProductCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Add to Cart")));
        } else if(state is HomeProductWishListedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Add to Wishlist")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadingState):
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case const (HomeLoadedSuccessState):
            final successState = state as HomeLoadedSuccessState;
            return _successStateView(successState);
          case const (HomeErrorState):
            return const Scaffold(
              body: Center(
                child: Text("Something Went Wrong."),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }

  _successStateView(HomeLoadedSuccessState successState) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: const Text("My Grocery"),
          actions: [
            IconButton(
                onPressed: () {
                  homeBloc.add(WishlistNavigateEvent());
                },
                icon: const Icon(Icons.favorite_sharp)),
            IconButton(
                onPressed: () {
                  homeBloc.add(CartNavigateEvent());
                },
                icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ProductTileWidget(
                product: successState.products[index],
                homeBloc: homeBloc,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
            itemCount: successState.products.length));
  }
}
