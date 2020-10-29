import 'package:retaurant_app/model/myOrdersModel.dart';
import 'package:retaurant_app/model/myReservationModel.dart';

abstract class MyReservationState  {
  const MyReservationState();

  // @override
  // List<Object> get props => [];
}

class MyReservationInProgressState extends MyReservationState{}

class MyReservationStateInitialState extends MyReservationState {}

class MyReservationStateFailureState extends MyReservationState {}

class MyReservationStateSuccessState extends MyReservationState {


  final MyReserveListModel myReserveListModel;
  final bool hasReachedMax;

  const MyReservationStateSuccessState({this.myReserveListModel, this.hasReachedMax});

  MyReservationStateSuccessState copyWith(
      {MyOrdersModel myOrdersModel, bool hasReachedMax}) {

    return MyReservationStateSuccessState(

        myReserveListModel: myOrdersModel ?? this.myReserveListModel,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  // @override
  // List<Object> get props => [foodCategory, hasReachedMax];

  @override
  String toString() =>
      ' My Reservation state : ${myReserveListModel.data}, hasReachedMax : $hasReachedMax';
}
