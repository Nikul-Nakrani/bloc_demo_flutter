part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickEvent extends HomeEvent {
  final ProductDataModel clickProduct;

  HomeProductWishlistButtonClickEvent({required this.clickProduct});
}

class HomeProductCartButtonClickEvent extends HomeEvent {
  final ProductDataModel clickProduct;

  HomeProductCartButtonClickEvent({required this.clickProduct});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
