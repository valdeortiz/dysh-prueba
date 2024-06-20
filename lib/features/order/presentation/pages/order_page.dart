import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});
  static const path = '/order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const OrderView(),
      appBar: AppBar(
        title: const Text('Order'),
      ),
    );
  }
}

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('order');
  }
}
