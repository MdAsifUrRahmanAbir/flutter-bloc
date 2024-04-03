import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart' as meta;

import '../../../data/cart_items.dart';
import '../../../data/grocery_data.dart';
import '../../../data/wishlist_items.dart';
import '../model/product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<WishListClickedEvent>(wishListClickedEvent);
    on<CartClickedEvent>(cartClickedEvent);
    on<WishlistNavigateEvent>(wishlistNavigateEvent);
    on<CartNavigateEvent>(cartNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    debugPrint("Initial Event");
    emit(HomeLoadingState());

    await Future.delayed(const Duration(seconds: 3));
    debugPrint("Data Showed");
    emit(HomeLoadedSuccessState(
        products: GroceryData.products
            .map((element) => ProductDataModel(
                id: element["id"].toString(),
                name: element["name"],
                description: element["description"],
                price: element["price"],
                imageUrl: element["image"]))
            .toList()));
  }

  FutureOr<void> wishListClickedEvent(
      WishListClickedEvent event, Emitter<HomeState> emit) {
    debugPrint("Wishlist Product Clicked");
    wishListItems.add(event.clickedProduct);
    emit(HomeProductWishListedActionState());
  }

  FutureOr<void> cartClickedEvent(
      CartClickedEvent event, Emitter<HomeState> emit) {
    debugPrint("Cart Product Clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductCartedActionState());
  }

  FutureOr<void> wishlistNavigateEvent(
      WishlistNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint("Wishlist Navigate Clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> cartNavigateEvent(
      CartNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint("Cart Navigate Clicked");
    emit(HomeNavigateToCartPageActionState());
  }
}
