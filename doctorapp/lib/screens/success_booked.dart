import 'package:doctorapp/components/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 3,
              child: Lottie.asset('assets/images/success.json') ,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text('Successfully Booked',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Spacer(),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Button(
                width: double.infinity,
                title: 'Back to Home Page',
              onpress: () => Navigator.of(context).pushNamed('main'),
              disable: false,
              ),)

            ],
             
            
          ),
      
         ),
    );
  }
}