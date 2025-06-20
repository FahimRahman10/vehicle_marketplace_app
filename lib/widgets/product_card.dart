import 'package:car_marketplace_app/providers/favourite_providers.dart';
import 'package:flutter/material.dart';
import '../models/product_list.dart';

class ProductCard extends StatefulWidget {

  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {

    final provider = FavouriteProvider.of(context);

    return Container(
      width: MediaQuery.of(context).size.width/2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade100
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => provider.toggleFavourite(widget.product),
                  child: Icon(
                    provider.isExist(widget.product)
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.blue,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              widget.product.image,
              //fit: BoxFit.cover,
              height: 70,
            ),
          ),
          Text(
              widget.product.name,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              )
          ),
          Text(
              widget.product.category,
              style: const TextStyle(
                  fontSize: 10,
                  color: Colors.blue
              )
          ),
          Text(
              "\$${widget.product.price}",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              )
          ),

          /*Text(
            widget.product.description,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold
            )
          ),*/

        ],
      ),
    );
  }
}