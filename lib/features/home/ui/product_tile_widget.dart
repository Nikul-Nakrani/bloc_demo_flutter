import 'package:bloc_demo/features/home/model/home_product_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';

class ProductTileWidgets extends  StatelessWidget{
  final ProductDataModel productDateModel;
  final HomeBloc homeBloc;

  const ProductTileWidgets({super.key, required this.productDateModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10)
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(productDateModel.imageUrl)
              )
            ),
          ),
          const SizedBox(height: 16),
          Text(productDateModel.name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Text(productDateModel.description),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$"+productDateModel.price.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishlistButtonClickEvent(clickProduct: productDateModel));
                      },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                   homeBloc.add(HomeProductCartButtonClickEvent(clickProduct: productDateModel));
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

}
