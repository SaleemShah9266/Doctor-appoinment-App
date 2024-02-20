import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppoinmentPageState();
}

enum Filterstatus { upcomming, complete, cancle }

class _AppoinmentPageState extends State<AppointmentPage> {
  Filterstatus status = Filterstatus.upcomming;
  Alignment _alignment = Alignment.centerLeft;

  List<dynamic> schedules = [
    {
      "doctor_name": "saleem",
      'doctor_profile': "assets/images/doctor_2.jpg",
      "category": "Dental",
      "status": Filterstatus.upcomming,
    },
    {
      "doctor_name": "Anabia",
      'doctor_profile': "assets/images/doctor_3.jpg",
      "category": "Cardiology",
      "status": Filterstatus.complete,
    },
    {
      "doctor_name": "asif",
      'doctor_profile': "assets/images/doctor_4.jpg",
      "category": "Respiration",
      "status": Filterstatus.complete,
    },
    {
      "doctor_name": "Ehtisham",
      'doctor_profile': "assets/images/doctor_5.jpg",
      "category": "General",
      "status": Filterstatus.cancle,
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      // switch (schedule['status']) {
      //   case 'upcoming':
      //     schedules['status'] = Filterstatus.upcomming;

      //     break;
      //      case 'complete':
      //     schedules['status'] = Filterstatus.complete;

      //     break;
      //      case 'cancle':
      //     schedules['status'] = Filterstatus.cancle;

      //     break;
      // }
      return schedule['status'] == status;
    }).toList();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Appoinnment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (Filterstatus filterstatus in Filterstatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {});
                              if (filterstatus == Filterstatus.upcomming) {
                                status = Filterstatus.upcomming;
                                _alignment = Alignment.centerLeft;
                              } else if (filterstatus ==
                                  Filterstatus.complete) {
                                status = Filterstatus.complete;
                                _alignment = Alignment.center;
                              } else if (filterstatus == Filterstatus.cancle) {
                                status = Filterstatus.cancle;
                                _alignment = Alignment.centerRight;
                              }
                            },
                            child: Center(
                              child: Text(filterstatus.name),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primarycolor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      status.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                )
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: !isLastElement
                        ? EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(_schedule['doctor_profile']),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _schedule['doctor_name'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _schedule['category'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ScheduleCard(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'cancel',
                                    style:
                                        TextStyle(color: Config.primarycolor),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Config.primarycolor,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Reschedule',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.calendar_today, color: Config.primarycolor, size: 15),
          SizedBox(width: 5),
          Text(
            'Monday, 13/02/2024',
            style: TextStyle(color: Config.primarycolor),
          ),
          SizedBox(width: 20),
          Icon(Icons.access_alarm, color: Config.primarycolor, size: 17),
          SizedBox(width: 5),
          Flexible(
              child: Text(
            '2:30 PM',
            style: TextStyle(color: Config.primarycolor),
          ))
        ],
      ),
    );
  }
}
