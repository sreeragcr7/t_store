import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/order/widgets/orders_list.dart';
import 'package:t_store/utils/constants/size.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: TAppBar(title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),

        // Orders
        child: TOrdersListItems(),
      ),
    );
  }
}
