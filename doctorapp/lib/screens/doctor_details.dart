import 'package:doctorapp/components/button.dart';
import 'package:doctorapp/components/custom_appbar.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key}) : super(key: key);

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  // for fav button
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: FaIcon(Icons.arrow_back_ios),
        actions: [
          // Fav button
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
            icon: FaIcon(
              isFav ? Icons.favorite_rounded : Icons.favorite_outline,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            AboutDoctor(),
            DetailsBody(),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(20),
              child: Button(
                width: double.infinity,
                title: 'Book Appointment',
                onpress: () {
                  // navigation to booking page
                  Navigator.of(context).pushNamed('booking_Page');
                },
                disable: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// About Doctor With profile code
class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          CircleAvatar(
            radius: 90.0,
            backgroundImage: AssetImage(
              'assets/images/doctor_6.jpg',
            ),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium, // Check if this is defined in the Config class
          Text(
            "Dr Asif",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall, // Check if this is defined in the Config class
          SizedBox(
            width: Config.widthSize * 0.75,
            child: Text(
              'A cardiologist can work independently with an independent practice or for a medical institution. A Cardiologist',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall, // Check if this is defined in the Config class
          SizedBox(
            width: Config.widthSize * 0.75,
            child: Text(
              'Ayub Medical University Pakistan',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsBody extends StatelessWidget {
  const DetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Config.spaceSmall, // Check if this is defined in the Config class
          DoctorInfo(),
          Config.spaceMedium, // Check if this is defined in the Config class
          Text(
            'About Doctor',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(
            width: 80,
          ),
          Text(
            'Educational requirements are similar to a doctor in any field. A bachelors in a medical field is required by all employers with most also requiring many years of residency. An advanced degree such as a Masters or Doctorate in the specific area of cardiology is highly preferred amongst most hospitals',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
          // doc exp, patient, and rating
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InfoCard(label: 'Patient', value: '110'),
        SizedBox(
          width: 15,
        ),
        InfoCard(label: 'Experience', value: '10 years'),
        SizedBox(
          width: 15,
        ),
        InfoCard(label: 'Rating', value: '4.5'),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config
              .primarycolor, // Check if this is defined in the Config class
        ),
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
