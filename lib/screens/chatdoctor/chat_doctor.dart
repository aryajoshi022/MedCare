import 'package:flutter/material.dart';

class ChatDoctor extends StatefulWidget {
  const ChatDoctor({super.key});

  @override
  State<ChatDoctor> createState() => _ChatDoctorState();
}

class _ChatDoctorState extends State<ChatDoctor> {
  final List<Map<String, dynamic>> doctorList = [
    {
      "image": "assets/images/Dr_Luca_Rossi.png",
      "name": "Dr. Luca Rossi",
      "specialist": "Cardiology Specialist",
      "experience": "3 Years",
      "arrow": ">",
      "available_on": "Available on Wed - Sat"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: TextButton.icon(
                onPressed: (){},
                label: Text('Chat Doctor',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff090909)
                  ),
                ),
                icon: Icon(Icons.arrow_back_ios_new_sharp),
              ),
            ),
            Container(
              width: 372,
              height: 48,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16, top: 14, bottom: 14, right: 16),
                    prefixIconColor: Color(0xff8F8F8F),
                    prefixIcon: Icon(Icons.search),
                    // prefixIconConstraints: BoxConstraints(minHeight: 7),
                    hintText: 'Find a doctor',
                    hintStyle: TextStyle(letterSpacing: 1,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Color(0xff8F8F8F),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Color(0xFFC2E7D9),
                        width: 1
                      ),
                    ),
                    filled: true,
                    fillColor: Color(0xffF9F9F9),
                  ),
                ),
              ),
            ),
            // Container(
            //   child: ListView.builder(
            //     // padding: EdgeInsets.only(top: 14, bottom: 14, left: 6, right: 6),
            //     physics: AlwaysScrollableScrollPhysics(),
            //     itemCount: doctorList.length,
            //     itemBuilder: (context, index) {
            //       final list = doctorList[index];
            //       return _buildDoctorList(list);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Widget _buildDoctorList(Map<String, dynamic> list) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 8),
  //     // padding: EdgeInsets.only(top: 14, bottom: 14, left: 6, right: 6),
  //     child: Row(
  //       children: [
  //         SizedBox(
  //           width: 64,
  //           height: 64,
  //           child: Image.asset(
  //             list['image'],
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //         SizedBox(width: 16),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 list['name'],
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   Text(
  //                     list['specialist'],
  //                   ),
  //                   Text('.'),
  //                   Text(
  //                     list['experience'],
  //                   ),
  //                 ],
  //               ),
  //               Container(
  //                 width: 124,
  //                 height: 19,
  //                 padding: EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 12),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(2),
  //                   color: Color(0xffDCFFDD)
  //                 ),
  //                 child: Text(
  //                   list['available_on'],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Icon(
  //           list['arrow'],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
