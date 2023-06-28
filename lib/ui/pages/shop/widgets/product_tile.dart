import 'package:flutter/material.dart';
import 'package:teststore/data/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4.5),
              blurRadius: 6.5,
              color: Colors.black12,
            )
          ]),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              product.image,
            ),
          ),
          //Todo: setup text themes. Make fade better.
          Align(
            alignment: Alignment.centerLeft,
            child:
                Text(product.title, maxLines: 1, overflow: TextOverflow.fade),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${product.price.toString()}'),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border))
            ],
          ),
        ],
      ),
    );
  }
}
