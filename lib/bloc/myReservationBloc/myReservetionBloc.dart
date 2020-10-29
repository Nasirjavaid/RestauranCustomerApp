import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retaurant_app/bloc/myReservationBloc/myReservationEvent.dart';
import 'package:retaurant_app/bloc/myReservationBloc/myReservationState.dart';
import 'package:retaurant_app/model/myReservationModel.dart';
import 'package:retaurant_app/repository/myReservationRepository.dart';

class MyReservationBloc extends Bloc<MyReservationEvent, MyReservationState> {
  MyReservationRepository myReservationRepository = new MyReservationRepository();

  @override
  MyReservationState get initialState => MyReservationStateInitialState();

  @override
  Stream<MyReservationState> mapEventToState(MyReservationEvent event) async* {
    try {
      if (event is MyReservationEventFetched) {
        MyReserveListModel myReserveListModel = MyReserveListModel();
        myReserveListModel = await myReservationRepository.getMyReservationList();

        yield MyReservationInProgressState();
        await Future.delayed(Duration(milliseconds: 500));

        if (myReserveListModel.data.reserveinfo.length != 0) {
          yield MyReservationStateSuccessState(myReserveListModel: myReserveListModel);
        } else {
          yield MyReservationStateFailureState();
        }
      }
    } catch (ex) {
      print("Exception in My Reservation Bloc $ex");
      yield MyReservationStateFailureState();
    }
  }
}
