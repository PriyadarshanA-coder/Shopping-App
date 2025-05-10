import 'package:demo/homepage.dart';
import 'package:demo/order_confirmed.dart';
import 'package:demo/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartPage extends StatelessWidget {
 CartPage({super.key});

  final Color softBeige = Color(0xFFFDF6EC);


  void _handlePaymentSuccess(
    PaymentSuccessResponse response,
    BuildContext context,
    Shop shop,
  ) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OrderConfirmed()),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Payment successful! Order ID: ${response.orderId}"),
      ),
    );
    shop.cart.clear();
  }

  void _handlePaymentError(
    PaymentFailureResponse response,
    BuildContext context,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment failed: ${response.message}")),
    );
  }

  void _handlePaymentWallet(
    ExternalWalletResponse response,
    BuildContext context,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("External wallet selected: ${response.walletName}"),
      ),
    );
  }

  void openRazorpayCheckout(double amount, BuildContext context, Shop shop) {
    final razorpay = Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (
      PaymentSuccessResponse response,
    ) {
      _handlePaymentSuccess(response, context, shop);
      razorpay.clear();
    });

    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (
      PaymentFailureResponse response,
    ) {
      _handlePaymentError(response, context);
      razorpay.clear();
    });

    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, (
      ExternalWalletResponse response,
    ) {
      _handlePaymentWallet(response, context);
      razorpay.clear();
    });

    var options = {
      'key': 'rzp_test_9bBneyOaKF8zW2',
      'amount': (amount * 100).toInt(), // Convert to paise
      'name': 'Shopping App',
      'description': 'Order Payment',
      'prefill': {'contact': '8248529117', 'email': 'cboy8405@gmail.com'},
      'external': {
        'wallets': ['paytm'],
      },
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error initializing payment: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<Shop>(context);
    final cartItems = shop.cart;

    double calculateTotal() {
      double total = 0.0;
      for (var item in cartItems) {
        total += double.parse(item.price.replaceAll("\$", ""));
      }
      return total;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: softBeige,
      ),
      backgroundColor:softBeige,
      body:
          cartItems.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Lottie.asset('assets/img/cart.json'),
                    ),
                    Text(
                      'Your shopping cart is empty.',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Please add something soon, carts have feelings too.,',
                      style: GoogleFonts.lato(),
                    ),
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        height: 50,
                        width: 200,
                        child: Center(
                          child: Text(
                            'CONTINUE SHOPPING',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return ListTile(
                          leading: Image.asset(item.imagePath, width: 50),
                          title: Text(item.name),
                          subtitle: Text(item.price),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              shop.removeFromCart(item);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Removed from cart")),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total:', style: TextStyle(fontSize: 18)),
                            Text(
                              '\$${calculateTotal().toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              final totalAmount = calculateTotal();
                              openRazorpayCheckout(totalAmount, context, shop);
                            },
                            child: Text(
                              'Place Order',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
