import 'dart:core';

import 'package:doctorapp/components/button.dart';
import 'package:doctorapp/components/custom_appbar.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // Add this import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // declaration
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now(); // Corrected variable name
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false; // Corrected variable name

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Appointment',
        icon: FaIcon(Icons.arrow_back_ios),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                _tableCalendar(),
                // Call the function here
                // Add other widgets as needed
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Center(
                    child: Text(
                      'Select Consultation Time',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          _isWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    alignment: Alignment.center,
                    child: Text(
                      'Weekend is not available, please select another date',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        // when selected
                        setState(() {
                          _currentIndex = index;
                          _timeSelected = true;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _currentIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: _currentIndex == index
                              ? Config.primarycolor
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _currentIndex == index ? Colors.white : null,
                          ),
                        ),
                      ),
                    );
                  }, childCount: 8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1.5),
                ),
          SliverToBoxAdapter(
            child: Button(
              width: double.infinity,
              title: "make Appoinment",
              onpress: () {
                Navigator.of(context).pushNamed('success_booking');
              },
              disable: _timeSelected && _dateSelected ? false : true,
            ),
          )
        ],
      ),
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2024, 12, 12),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Config.primarycolor,
          shape: BoxShape.circle,
        ),
      ),
      availableCalendarFormats: {
        CalendarFormat.month: 'month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;
          // check if weekend is selected
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            // Do not set _currentDay to null
          } else {
            _isWeekend = false;
          }
        });
      },
    );
  }
}
