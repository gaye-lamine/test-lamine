import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:terappmobile/provider/auth_provider.dart';
import 'package:terappmobile/screens/auth/info_perso.dart';
import 'package:terappmobile/utils/app_colors.dart';
import 'package:terappmobile/utils/googlefonts.dart';
import 'package:terappmobile/utils/title_option.dart';

class GareDetail extends StatefulWidget {
  @override
  _GareDetailState createState() => _GareDetailState();
}

class _GareDetailState extends State<GareDetail> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: 300,
            width: double.infinity,
            child: Image.asset(
              "images/terimage.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(children: [
                      TitleOption(data: 'Informations de la gare', color: Colors.white, size: 23, weight: FontWeight.w700, maxLines: 1, overflow: TextOverflow.clip,),
                      TitleOption(data: 'Trajets occasionnels', color: Colors.white, size: 15, weight: FontWeight.w300, maxLines: 1, overflow: TextOverflow.clip,)

                    ],)
                  ),
                  SizedBox(width: 45),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: 150,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          minRadius: 45,
                          child: Image.asset('images/detailgare.png',height :60),
                        )
                      ],
                    ),
                  )
              ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
