import 'package:flutter/material.dart';
import '/datamodel.dart';
import '/datamanager.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  const MenuPage({ super.key, required this.dataManager });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder( // FutureBuilder renders content based on a request
      future: dataManager.getMenu(),
      builder: (context, snapshot) { // builder returns a widget
        if (snapshot.hasData) { // The data is ready
          var categories = snapshot.data as List<Category>;
          /* ListView.builder() creates a scrollable array of widgets that are created on demand, the builder is called only for those children that are actually visible. The itemBuilder callback will be called only with index greater than or equal to zero and less than itemCount.*/
          return ListView.builder( // outer list view for headings of categories
            itemCount: categories.length,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      categories[index].name,
                      style: Theme.of(context).textTheme.headlineMedium),
                  ),
                  
                  ListView.builder( // inner listview for products in categories
                    shrinkWrap: true, // to avoid both listviews fighting for scroll
                    physics: const ClampingScrollPhysics(), // prevent scroll from exceeding the content
                    itemCount: categories[index].products.length,
                    
                    itemBuilder: ((context, productIndex) {
                      var currentProduct = categories[index].products[productIndex];
                      return ProductItem(
                        product: currentProduct,
                        onAdd: (currentProduct) {
                          dataManager.addProduct(currentProduct);
                        },
                      );
                    })
                  ),
                ],
              );
            }),
          );
        } else if (snapshot.hasError) { // The data has an error
          return Center(
            child: Text(
              "There was an error loading data",
              style: Theme.of(context).textTheme.headlineSmall,
            )
          );
        } else { // The data is loading
          return const Center(
            child: CircularProgressIndicator()
          ); // circular loading animation widget
        }
      },
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
            Image.network(product.imageUrl),
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
                        "\$${product.price.toStringAsFixed(2)}",
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