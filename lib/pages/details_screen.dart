import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_list.dart';
import '../providers/cart_provider.dart';
import '../widgets/available_size.dart';
import 'Cart_details.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    //final provider = CartProvider.of(context);

    final provider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Details'),
          centerTitle: true,
      ),

      body: Column(
        children: [
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(80),
                  color: Colors.blue.shade50
                ),
                child: Image.asset(product.image, height: 55),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              )
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                Text(
                    product.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 12,
                    )
                ),

                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Available Size",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ]
                ),

                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AvailableSize(size: "S"),
                    AvailableSize(size: "M"),
                    AvailableSize(size: "L"),
                    AvailableSize(size: "XL"),
                    AvailableSize(size: "XXL"),
                  ]
                ),

                const SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                          "Available Colors",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          )
                      )
                    ]
                ),

                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue,
                    ),
                    //SizedBox(width: 10),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.red,
                    ),
                    //SizedBox(width: 10),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.green,
                    ),
                    //SizedBox(width: 10),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.black,
                    ),
                    //SizedBox(width: 10),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey,
                    ),
                  ],
                )

              ],
            ),
          )
        ],
      ),

      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height/10,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${product.price}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              )
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                  )
                ),
                onPressed: () {
                  provider.toggleProduct(product);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartDetails(),
                      )
                  );
                },
                icon: const Icon(Icons.send_rounded, color: Colors.white, size: 24,),
                label: const Text(
                  'Add to Cart',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                )
            )
          ],
        )
      ),
    );
  }
}
