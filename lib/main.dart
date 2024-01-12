import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shopping App'),
        ),
        body: ShoppingPage(),
      ),
    );
  }
}

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  int itemCount = 0;
  double unitPrice = 10.0;

  void _addToCart(int quantity) {
    itemCount += quantity;
    double totalAmount = itemCount * unitPrice;

    // Show dialog when 5 items are added
    if (itemCount == 5) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Item Added'),
            content: Text('You have added $itemCount items to your bag!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }

    setState(() {});
  }

  void _checkout() {
    // Show snackbar on checkout
    final snackBar = SnackBar(
      content: Text('Congratulations! Checkout successful.'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image added
          Image.asset(
            'images/image.jpeg',
            height: 50,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  _addToCart(-1);
                },
              ),
              Text('$itemCount'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _addToCart(1);
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('Total Amount: \$${itemCount * unitPrice}'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _checkout,
            child: Text('CHECK OUT'),
          ),
        ],
      ),
    );
  }
}
