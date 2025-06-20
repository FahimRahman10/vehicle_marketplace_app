import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    //final provider = CartProvider.of(context);
    final provider = Provider.of<CartProvider>(context);
    final finalList = provider.cart;

    _buildProductQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQuantity(index)
                : provider.decrementQuantity(index);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.shade50,
          ),
          child: Icon(icon, color: Colors.blue, size: 20),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            finalList[index].quantity = 1;
                            finalList.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),

                    child: Container(
                      height: 100,
                      color: Colors.blue.shade50,
                      child: Center(
                        child: ListTile(

                          title: Text(
                            finalList[index].name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          subtitle: Text(
                            '\$${finalList[index].price}',
                            overflow: TextOverflow.ellipsis,
                          ),

                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(finalList[index].image),
                            backgroundColor: Colors.blue.shade50,
                          ),

                          trailing: Expanded(
                            child: SizedBox(
                              height: double.infinity, // Fill the height of the ListTile's parent container
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildProductQuantity(Icons.add, index),
                                  const SizedBox(height: 6),
                                  Text(
                                    finalList[index].quantity.toString(),
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 6),
                                  _buildProductQuantity(Icons.remove, index),
                                ],
                              ),
                            ),
                          ),
                          tileColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.center,
            width: double.infinity,
            height: MediaQuery.of(context).size.height/10,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)
                )
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '\$${provider.getTotalPrice()}',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    )
                )
              ],

            ),
          )
        ],
      ),
    );
  }
}


