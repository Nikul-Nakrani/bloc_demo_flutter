part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistReMoveFromWishlistEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishlistReMoveFromWishlistEvent({required this.productDataModel});

}
