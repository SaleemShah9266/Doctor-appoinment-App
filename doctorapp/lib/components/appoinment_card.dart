import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primarycolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile2.jpeg'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr GMK",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Dental",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              // Shedule information
              ScheduleCard(),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        'cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'completed',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Schedule Widget
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today, color: Colors.white, size: 15),
          SizedBox(width: 5),
          Text(
            'Monday, 13/02/2024',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 20),
          Icon(Icons.access_alarm, color: Colors.white, size: 17),
          SizedBox(width: 5),
          Flexible(
              child: Text(
            '2:30 PM',
            style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
