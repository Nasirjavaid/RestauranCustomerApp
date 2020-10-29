import 'package:flutter/material.dart';

class ReservationsListViewWidet extends StatefulWidget {
  @override
  _ReservationsListViewWidetState createState() =>
      _ReservationsListViewWidetState();
}

class _ReservationsListViewWidetState extends State<ReservationsListViewWidet> {
  @override
  Widget build(BuildContext context) {
    return listViewWidget(context);
  }

  Widget listViewWidget(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, right: 5, left: 5, bottom: 1),
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              // if (orderInfoList.length == 0) {
              //   return Center(
              //       child: Padding(
              //     padding: const EdgeInsets.only(top: 10.0),
              //     child: Text("No orders",
              //         style: Theme.of(context).textTheme.bodyText1),
              //   )); 
              // } else {
              //   return orderInfoListItemCard(
              //       context, orderInfoList[index], data);
              // }

              return reservationListCard(context);
            }),
      ),
    );
  }

  Widget reservationListCard(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Table Name",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "1",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Capacity",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "3",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reservation Time",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "2 PM",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          " to ",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "4 PM",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(fontWeight: FontWeight.w900),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reservation Date",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "20-10-2020",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Status",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "Gone",
                      style: Theme.of(context).textTheme.button.copyWith(
                          fontWeight: FontWeight.w900, color: Colors.red),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
