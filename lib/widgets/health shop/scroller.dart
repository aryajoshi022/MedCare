import 'package:flutter/material.dart';
import 'package:medcare/util/constants/colors.dart';

class CustomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(text: 'Medicine & Treatment'),
              SizedBox(width: 10), // Space between buttons
              CustomButton(text: 'Milk'),
              SizedBox(width: 10), // Space between buttons
              CustomButton(text: 'Sexual Health'),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;

  CustomButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(height: 50,width: 162,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6), // Rounded corners
              side: BorderSide(color: AppColors.borderBtn,width: 1), // Border color
            ),
          ),
          onPressed: () {
            // Action to perform on button press
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            child: Text(text, style: TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
