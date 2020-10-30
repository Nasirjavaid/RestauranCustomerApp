abstract class MyReservationEvent  {
  // @override
  // List<Object> get props => [];
}

class MyReservationEventFetched extends MyReservationEvent {}

class MyReservationEventCheckTableAvailabilty extends MyReservationEvent {
 final String person;
 final String reserveDate;
 final String reserveTime;
MyReservationEventCheckTableAvailabilty({this.person,this.reserveDate,this.reserveTime});

}
class MyReservationEventToShowForm extends MyReservationEvent {}

