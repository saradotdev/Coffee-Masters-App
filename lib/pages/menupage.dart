import 'package:flutter/material.dart';
import '/datamodel.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({ super.key });

  @override
  Widget build(BuildContext context) {
    var product1 = Product(id: 1, name: 'Black Coffee', price: 1.25, image: '');
    return ListView(
      children: [
        ProductItem(product: product1, onAdd: () {},),
        ProductItem(product: product1, onAdd: () {},),
        ProductItem(product: product1, onAdd: () {},)
      ],
    );
  }
}

class ProductItem extends StatelessWidget {

  final Product product;
  final Function onAdd;

  const ProductItem({ super.key, required this.product, required this.onAdd });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      child: Card(
        elevation: 8,
        child: Column(
          children: [
            Image.asset('assets/images/black_coffee.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "\$${product.price}",
                        style: const TextStyle(
                          color: Colors.brown,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onAdd(product);
                    },
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}