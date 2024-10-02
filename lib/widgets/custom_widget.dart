import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/update_product_page.dart';

class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.product});
  ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(8, 8))
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            widget.product.title.substring(
                                0, widget.product.title.indexOf(' ')),
                            style: const TextStyle(
                                fontSize: 22, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateProductPage(
                                      product: widget.product),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                              size: 30,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${widget.product.price}",
                          style:
                              const TextStyle(fontSize: 19, color: Colors.grey),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              isFavorite = !isFavorite;
                              setState(() {});
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Colors.red,
                              size: 35,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )),
        Positioned(
          bottom: 130,
          right: 20,
          child: Image.network(
            widget.product.image,
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}
