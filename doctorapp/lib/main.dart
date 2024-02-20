import 'package:doctorapp/main_layout.dart';
import 'package:doctorapp/screens/auth_page.dart';
import 'package:doctorapp/screens/booking_page.dart';
import 'package:doctorapp/screens/doctor_details.dart';
import 'package:doctorapp/screens/success_booked.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// this is for push Navigator
  static final navigatorkKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // define theme data
    return MaterialApp(
      navigatorKey: navigatorkKey,
      title: ' DOctor App',
      theme: ThemeData(
// predefine input decoration
          inputDecorationTheme: const InputDecorationTheme(
            focusColor: Config.primarycolor,
            border: Config.OutlinedBorder,
            errorBorder: Config.errorborder,
            enabledBorder: Config.OutlinedBorder,
            floatingLabelStyle: TextStyle(color: Config.primarycolor),
            prefixIconColor: Colors.black,
          ),
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Config.primarycolor,
            selectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey.shade700,
            elevation: 10,
            type: BottomNavigationBarType.fixed,
          )),
      initialRoute: '/',
      routes: {
        // initial routes of app,for login and signup
        '/': (context) => AuthPage(),
        // the is for main layout after login
        'main': (context) => MainLayout(),
        'doc_details': (context) => DoctorDetails(),
        'booking_Page': (context) => BookingPage(),
        'success_booking':(context) => AppointmentBooked(),
      },
    );
  }
}
