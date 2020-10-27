import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:retaurant_app/config/appTheme.dart';

class BookNewReservationWidget extends StatefulWidget {
  @override
  _BookNewReservationWidgetState createState() =>
      _BookNewReservationWidgetState();
}

class _BookNewReservationWidgetState extends State<BookNewReservationWidget> {
  String selectedDate;
  String selectedTime;
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [datePickerWidget(context), timePickerWidget(context)],
        ),
      ),
    );
  }

  Widget datePickerWidget(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.grey.shade300,
      onPressed: () {
        DatePicker.showDatePicker(context, showTitleActions: true,
            // minTime: DateTime(2020, 1, 1),
            //  maxTime: DateTime(2050, 12, 30),
            onChanged: (date) {
          setState(() {
            selectedDate = DateFormat('dd-MM-yyyy').format(date).toString();
          });
        }, onConfirm: (date) {
          print('confirm $date');

          setState(() {
            selectedDate = DateFormat('dd-MM-yyyy').format(date).toString();
          });
        }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.09,
        child: Center(
            child: selectedDate == null
                ? myMainCard(
                    "Select Date",
                    FontAwesomeIcons.calendar,
                  )
                : myMainCard(
                    selectedDate,
                    FontAwesomeIcons.calendar,
                  )),
      ),
    );
  }

  Widget timePickerWidget(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.grey.shade300,
      onPressed: () {
        DatePicker.showTime12hPicker(context, showTitleActions: true,
            // minTime: DateTime(2020, 1, 1),
            //  maxTime: DateTime(2050, 12, 30),
            onChanged: (time) {
          setState(() {
            selectedTime = DateFormat('hh:mm:a').format(time).toString();
          });
        }, onConfirm: (time) {
          print('confirm $time');

          setState(() {
            selectedTime = DateFormat('hh:mm:a').format(time).toString();
          });
        }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.09,
        child: Center(
            child: selectedTime == null
                ? myMainCard(
                    "Select Time",
                    FontAwesomeIcons.clock,
                  )
                : myMainCard(
                    selectedTime,
                    FontAwesomeIcons.clock,
                  )),
      ),
    );
  }

  Widget myMainCard(
    String title,
    IconData iconData,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.background,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              topLeft: Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    iconData,
                    color: Colors.black45,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 1,
                    height: MediaQuery.of(context).size.height * 0.03,
                    color: Colors.black26,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$title ",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_downward,
                color: Colors.black45,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
