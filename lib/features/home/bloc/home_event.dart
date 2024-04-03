part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class WishListClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  WishListClickedEvent({required this.clickedProduct});
}

class CartClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  CartClickedEvent({required this.clickedProduct});
}

class WishlistNavigateEvent extends HomeEvent {}

class CartNavigateEvent extends HomeEvent {}
