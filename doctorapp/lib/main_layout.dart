import 'package:doctorapp/screens/Home_Page.dart';
import 'package:doctorapp/screens/appoinment_Page.dart';
 // Corrected import
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Added import for FontAwesomeIcons

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key); // Corrected constructor syntax

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // Variable Declaration
  int currentPage = 0;
  final PageController _pageController = PageController(); // Renamed _Page to _pageController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        children: [
          HomePage(),
          AppointmentPage(), // Corrected the class name to AppointmentPage
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page) {
          setState(() {
            currentPage = page;
            _pageController.animateToPage(
              page,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
            label: "Home",
          ),
          BottomNavigationBarItem( // Added another BottomNavigationBarItem for the second page
            icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
            label: "Appointments",
          ),
        ],
      ),
    );
  }
}
