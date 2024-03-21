import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/data/wishlist_item.dart';
import 'package:bloc_demo/features/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
   on<WishlistInitialEvent>(wishlistInitialEvent);
   on<WishlistReMoveFromWishlistEvent>(wishlistReMoveFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishListItems));
  }

  FutureOr<void> wishlistReMoveFromWishlistEvent(WishlistReMoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishListItems.remove(event.productDataModel);
    emit(WishlistRemoveSuccessState(wishlistItems: wishListItems.toList()));
  }
}
