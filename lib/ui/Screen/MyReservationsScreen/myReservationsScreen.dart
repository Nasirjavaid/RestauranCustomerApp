import 'package:flutter/material.dart';
import 'package:retaurant_app/config/appTheme.dart';
import 'package:retaurant_app/ui/Screen/MyReservationsScreen/bookNewReservationWidet.dart';

class MyReservationsScreen extends StatefulWidget {
  @override
  _MyReservationsScreenState createState() => _MyReservationsScreenState();
}

class _MyReservationsScreenState extends State<MyReservationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background1,
        appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "My Reservations",
        style: Theme.of(context).textTheme.button,
      ),
      actions: [
        IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.add,
                size: 28,
              ),
            ),
            onPressed: () {})
      ],
    ),body: BookNewReservationWidget(),);
  }
}
