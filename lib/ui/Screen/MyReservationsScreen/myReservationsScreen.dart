import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retaurant_app/bloc/myReservationBloc/myReservationEvent.dart';
import 'package:retaurant_app/bloc/myReservationBloc/myReservationState.dart';
import 'package:retaurant_app/bloc/myReservationBloc/myReservetionBloc.dart';
import 'package:retaurant_app/config/appTheme.dart';
import 'package:retaurant_app/ui/CommomWidgets/loadingIndicator.dart';

class MyReservationScreenMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (context) {
          return MyReservationBloc()..add(MyReservationEventFetched());
        },
        child: MyReservationsScreen(contextA: context),
      ),
    );
  }
}

class MyReservationsScreen extends StatefulWidget {
  final BuildContext contextA;

  MyReservationsScreen({this.contextA});
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
      ),
      body: _buildBody(widget.contextA),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<MyReservationBloc, MyReservationState>(
        builder: (BuildContext context, state) {
      if (state is MyReservationInProgressState) {
        return LoadingIndicator();
      }
      if (state is MyReservationStateSuccessState) {}

      return Container();
    });
  }
}
