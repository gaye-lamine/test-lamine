import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terappmobile/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terappmobile/utils/app_colors.dart';

class ListeGareWidget extends StatelessWidget {
  ListeGareWidget({super.key,  required this.gareName});

  String gareName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity-20,
        height: 54,
        
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.rouge,
              child: Image.asset('images/train.png'),
            ),
            SizedBox(width: 5,),
            Text(
              gareName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(242, 244, 247, 1),
        ),
      ),
    );
  }
}
