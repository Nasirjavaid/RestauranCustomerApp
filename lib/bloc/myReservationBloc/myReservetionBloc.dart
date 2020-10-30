import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retaurant_app/bloc/myReservationBloc/myReservationEvent.dart';
import 'package:retaurant_app/bloc/myReservationBloc/myReservationState.dart';
import 'package:retaurant_app/model/myReservationModel.dart';
import 'package:retaurant_app/model/tableInfoModel.dart';
import 'package:retaurant_app/model/userLogin.dart';
import 'package:retaurant_app/repository/myReservationRepository.dart';
import 'package:retaurant_app/repository/tableInfoRepository.dart';
import 'package:retaurant_app/repository/userAuthRepository.dart';

class MyReservationBloc extends Bloc<MyReservationEvent, MyReservationState> {
  MyReservationRepository myReservationRepository =
      new MyReservationRepository();
  UserLogin userLogin = UserLogin();
  TableInfoRepository tableInfoRepository = TableInfoRepository();

  UserAuthRepository userAuthRepository = new UserAuthRepository();
  TableInfoModel tableInfoModel = TableInfoModel();

  @override
  MyReservationState get initialState => MyReservationStateInitialState();

  @override
  Stream<MyReservationState> mapEventToState(MyReservationEvent event) async* {
    try {
      if (event is MyReservationEventFetched) {
        userLogin = await userAuthRepository.getUserDataFromSharedPrefrences();

        if (userLogin == null) {
          yield MyReservationNeedToLoginState();
        } else {
          MyReserveListModel myReserveListModel = MyReserveListModel();
          myReserveListModel =
              await myReservationRepository.getMyReservationList();

          yield MyReservationInProgressState();
          await Future.delayed(Duration(milliseconds: 500));

          if (myReserveListModel.data.reserveinfo.length != 0) {
            yield MyReservationStateSuccessState(
                myReserveListModel: myReserveListModel);
          } else {
            yield MyReservationStateFailureState();
          }
        }
      }

      if (event is MyReservationEventToShowForm) {
        yield MyReservationStateFailureState();
      }

      if (event is MyReservationEventCheckTableAvailabilty) {
        yield CheckReserVationProgressState();
        tableInfoModel = await tableInfoRepository.getTableInfo(
            event.person, event.reserveDate, event.reserveTime);

        if (tableInfoModel.data.tableinfo.length != 0) {
          yield CheckReservationStateSuccessState(
              tableInfoModel: tableInfoModel);
        } else {
          yield CheckReserVationFailureState(message: tableInfoModel.message);
        }
      }
    } catch (ex) {
      print("Exception in My Reservation Bloc $ex");
      yield MyReservationStateFailureState();
    }
  }
}
