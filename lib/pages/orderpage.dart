import 'package:flutter/material.dart';
import '/datamodel.dart';
import '/datamanager.dart';

class OrderPage extends StatefulWidget {
  final DataManager dataManager;
  const OrderPage({ super.key, required this.dataManager });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.dataManager.cart.isEmpty) {
      return Center(child: Text("Your cart is empty", style: Theme.of(context).textTheme.headlineSmall,));
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.dataManager.cart.length,
              itemBuilder: (context, index) {
                var currentItem = widget.dataManager.cart[index];
                return OrderItem(
                  item: currentItem, 
                  onRemove: (currentProduct) {
                    setState(() {
                      widget.dataManager.removeProduct(currentProduct);
                    });
                  }
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$${widget.dataManager.cartTotal().toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}

class OrderItem extends StatelessWidget {
  
  final ItemInCart item;
  final Function onRemove;

  const OrderItem({ super.key, required this.item, required this.onRemove });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("${item.quantity}x"),
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  item.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 2,
                child: Text("\$ ${(item.product.price * item.quantity).toStringAsFixed(2)}"),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    onRemove(item.product);
                  },
                  icon: const Icon(Icons.delete),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}