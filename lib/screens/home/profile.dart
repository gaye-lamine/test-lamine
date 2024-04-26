import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:terappmobile/models/card_info.dart';
import 'package:terappmobile/models/voyage_info.dart';
import 'package:terappmobile/screens/ajout_voyage/ajout_voyage.dart';
import 'package:terappmobile/screens/home/accueil.dart';
import 'package:terappmobile/screens/home/carte_abonnement.dart';
import 'package:terappmobile/screens/home/home.dart';
import 'package:terappmobile/screens/home/modify_profile.dart';
import 'package:terappmobile/screens/train/suivi_voyage.dart';
import 'package:terappmobile/screens/train/train_voyage.dart';
import 'package:terappmobile/utils/app_colors.dart';
import 'package:terappmobile/utils/googlefonts.dart';
import 'package:terappmobile/utils/title_option.dart';
import 'package:terappmobile/widgets/customelevatedbutton.dart';
import 'package:terappmobile/widgets/listegare_widgets.dart';
import 'package:voice_message_package/voice_message_package.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
            height: 350,
            width: double.infinity,
            child: Image.asset(
              "images/homefond.png",
              fit: BoxFit.fill,
              height: 230,
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Homescreencustomer()));
                    },
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
                          color: AppColors.marron,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'images/profil2.png',
                              height: 100,
                              width: 100,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleOption(
                                  data: ' Mouhamadou Coulibaly',
                                  color: AppColors.marron,
                                  size: 21,
                                  weight: FontWeight.w600,
                                  maxLines: 1,
                                ),
                                TitleOption(
                                  data: '+221 77 123 45 67',
                                  color: Color.fromRGBO(152, 162, 179, 1),
                                  size: 16,
                                  weight: FontWeight.w600,
                                  maxLines: 1,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ModifyProfile()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(245, 245, 245, 1),
                                    ),
                                    child: Row(
                                      children: [
                                        TitleOption(
                                          data: 'Modifier profil',
                                          color: AppColors.marron,
                                          size: 16,
                                          weight: FontWeight.w600,
                                          maxLines: 1,
                                        ),
                                        Icon(
                                          Icons.arrow_right,
                                          color: AppColors.marron,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: width,
                          color: Color.fromRGBO(245, 245, 245, 1),
                          height: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('images/abonne.png'),
                              TitleOption(
                                data: 'Abonné',
                                color: Colors.black87,
                                size: 16,
                                weight: FontWeight.w600,
                                maxLines: 1,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              TitleOption(
                                data: 'SamaTER',
                                color: AppColors.beige,
                                size: 16,
                                weight: FontWeight.w600,
                                style: FontStyle.italic,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          //SizedBox(height: 300,) ,
          Positioned.fill(
            top: 270,
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleOption(
                          data: 'Carte ',
                          color: Colors.black87,
                          size: 20,
                          weight: FontWeight.w700,
                          maxLines: 2,
                        ),
                        TitleOption(
                          data: 'SamaTER ',
                          color: AppColors.marron,
                          size: 22,
                          weight: FontWeight.w700,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarteAbonnement()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.rouge,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset('images/logoter2.png'),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TitleOption(
                                  data: 'M. Coulibaly ',
                                  color: Colors.white,
                                  size: 22,
                                  weight: FontWeight.w700,
                                  maxLines: 2,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: AppColors.beige,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: TitleOption(
                                    data: '123 456 789 ',
                                    color: Colors.white,
                                    size: 16,
                                    weight: FontWeight.w700,
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              minRadius: 25,
                              child: Image.asset('images/arrowright.png'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Color.fromRGBO(220, 223, 227, 1),
                    width: double.infinity,
                    height: 2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(245, 245, 245, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          minRadius: 40,
                          backgroundColor: AppColors.rouge,
                          child: Image.asset('images/aide.png'),
                        ),
                        // Image.asset('images/logoter2.png') ,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleOption(
                              data: 'Aide & support technique',
                              color: Colors.black,
                              size: 20,
                              weight: FontWeight.w700,
                              maxLines: 2,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 40,
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TitleOption(
                                    data: '+221 33 123 45 67',
                                    color: Colors.grey,
                                    size: 20,
                                    weight: FontWeight.w700,
                                    maxLines: 1,
                                  ),
                                  Image.asset('images/aide2.png')
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Color.fromRGBO(220, 223, 227, 1),
                    width: double.infinity,
                    height: 2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(245, 245, 245, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/exit.png'),
                        TitleOption(
                          data: 'Se déconnecter',
                          color: AppColors.rouge,
                          size: 20,
                          weight: FontWeight.w700,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  )

                  //
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
