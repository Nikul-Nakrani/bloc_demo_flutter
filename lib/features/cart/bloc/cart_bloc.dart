import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/data/cart_items.dart';
import 'package:bloc_demo/features/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartItemsRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartItemsRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItems));
    //run a function to remove product model
    //emit CartItemRemovedState
  }
}
