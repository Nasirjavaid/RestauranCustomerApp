import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retaurant_app/bloc/cartBloc/cartBloc.dart';
import 'package:retaurant_app/bloc/cartBloc/cartEvent.dart';
import 'package:retaurant_app/bloc/myReservationBloc/myReservationEvent.dart';
import 'package:retaurant_app/bloc/myReservationBloc/myReservationState.dart';
import 'package:retaurant_app/bloc/myReservationBloc/myReservetionBloc.dart';
import 'package:retaurant_app/bloc/userAuthBloc/userAuthBloc.dart';
import 'package:retaurant_app/bloc/userAuthBloc/userAuthEvent.dart';
import 'package:retaurant_app/config/appTheme.dart';
import 'package:retaurant_app/config/methods.dart';
import 'package:retaurant_app/main.dart';
import 'package:retaurant_app/repository/userAuthRepository.dart';
import 'package:retaurant_app/ui/CommomWidgets/commonWidgets.dart';
import 'package:retaurant_app/ui/CommomWidgets/loadingIndicator.dart';
import 'package:retaurant_app/ui/Screen/MyReservationsScreen/checkReservationAvailabilityWidet.dart';
import 'package:retaurant_app/ui/Screen/MyReservationsScreen/raservationsListViewWidget.dart';
import 'package:retaurant_app/ui/Screen/MyReservationsScreen/tableBookingFormWidget.dart';
import 'package:retaurant_app/ui/Screen/MyReservationsScreen/tableInfoListWidet.dart';

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
  _onShowFormButtonPressed() {
    BlocProvider.of<MyReservationBloc>(context).add(
      MyReservationEventToShowForm(),
    );
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 2000),
        backgroundColor: AppTheme.appDefaultColor,
        content:
            Text("$message", style: TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }

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
              onPressed: () {
                _onShowFormButtonPressed();
              })
        ],
      ),
      body: _buildBody(widget.contextA),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<MyReservationBloc, MyReservationState>(
        builder: (BuildContext context, state) {
      if (state is MyReservationNeedToLoginState) {
        return loginWidget(context);
      }
      if (state is MyReservationInProgressState) {
        return LoadingIndicator();
      }
      if (state is MyReservationStateSuccessState) {
        return ReservationsListViewWidet(
            myReserveListModel: state.myReserveListModel);
      }

      if (state is MyReservationStateFailureState) {
        return CheckReservationAvailabilityWidget();
      }

      /////////////////////////////////////////////////////
      if (state is CheckReserVationProgressState) {
        return CommonWidgets.progressIndicator;
      }
      if (state is CheckReservationStateSuccessState) {
        return TableInfoListWidget(
          tableInfoModel: state.tableInfoModel,
        );
      }

      if (state is CheckReserVationFailureState) {
        _showToast(context, state.message);
        return CheckReservationAvailabilityWidget();
      }

      if (state is MyReservationToShowBookingFormState) {
        return TableBookingFormWidget(tableinfo: state.tableinfo,);
      }

      return Container();
    });
  }

  Widget loginWidget(BuildContext context) {
    return FlatButton(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: Icon(
                FontAwesomeIcons.powerOff,
                size: 60,
                color: Colors.red[100],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Tap to Login",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
      onPressed: () {
        UserAuthRepository userAuthRepository = UserAuthRepository();
        Methods.storeGuestValueToSharedPref(false);
        BlocProvider.of<CartBloc>(context)
            .add(SaveDataToSharedPrefrencesCartEvent());
        BlocProvider.of<UserAuthBloc>(context).add(AuthLoggedOut());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => App(
              userRepository: userAuthRepository,
            ),
          ),
        );
      },
    );
  }
}
