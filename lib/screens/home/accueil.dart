import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:terappmobile/models/card_info.dart';
import 'package:terappmobile/models/voyage_info.dart';
import 'package:terappmobile/provider/auth_provider.dart';
import 'package:terappmobile/screens/ajout_voyage/ajout_voyage.dart';
import 'package:terappmobile/screens/train/suivi_voyage.dart';
import 'package:terappmobile/screens/train/train_voyage.dart';
import 'package:terappmobile/utils/app_colors.dart';
import 'package:terappmobile/utils/googlefonts.dart';
import 'package:terappmobile/utils/title_option.dart';
import 'package:terappmobile/widgets/customelevatedbutton.dart';
import 'package:terappmobile/widgets/listegare_widgets.dart';
import 'package:voice_message_package/voice_message_package.dart';

class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  String userName = "";

  String fullname = '';
  /* List<CardInfo> cardinfo = [
    CardInfo(imageAsset: 'images/logoter.png', title: 'À savoir !', description: 'Aliquam eget purus sit malesuada tempor euismod. Aliquam eget purus sit malesuada tempor euismod.', audioFile: audioFile)
  ]; */

  List<CardInfo> cardInfoList = [];
  List<VoyageInfo> voyageInfoList = [];
  List<String> gares = [
    'Gare de Dakar',
    'Gare de Thiaroye',
    'Gare de Pikine',
    'Gare de Baux maraichers',
    'Gare de Dalifort',
    'Gare de Hann',
    'Gare de Colobane'
  ];

  void gareModal() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              //color: Colors.white,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.grey,
                        width: 100,
                        height: 3,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TitleOption(
                    data: 'Liste des gares du TER',
                    color: Colors.black,
                    size: 20,
                    weight: FontWeight.w600,
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  // Add a Container to provide a height constraint
                  //height: 500, // Set the desired height for the container
                  //padding: EdgeInsets.symmetric(vertical: 20),
                  child: ListView.builder(
                    itemCount: gares.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          /* Your onTap logic here */
                          print('gare');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TrainVoyage()));
                        },
                        child: ListeGareWidget(
                          gareName: gares[index],
                        ),
                      );
                    },
                  ),
                ),
              ]),
            )

        /* Stack(
        //clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height / 4,
            width: double.infinity,
            //color: Colors.white,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      color: Colors.grey,
                      width: 100,
                      height: 3,
                    ),
                  ),
                  Container(height: 500, color: Colors.red,)
                  /* ListView.builder(
                  itemCount: gares.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        /* Your onTap logic here */
                      },
                      child: ListeGare(),
                    );
                  },
                ) */
                  
                ],
              )
            ]),
          )
        ],
      ),
    */
        );
  }

  void ajoutVoyageModal() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              //color: Colors.white,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.grey,
                        width: 100,
                        height: 3,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Image.asset('images/ajoutvoyage.png'),
                SizedBox(
                  height: 32,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TitleOption(
                      data: 'Ajout d’un nouveau voyage',
                      color: Color.fromRGBO(20, 20, 20, 1),
                      size: 24,
                      weight: FontWeight.w400),
                ),
                TitleOption(
                    data:
                        'Scannez le code qr de votre ticket de voyage pour pouvoir l’enregistrer sur votre historique de voyage.',
                    color: Color.fromRGBO(102, 112, 133, 1),
                    size: 15,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    weight: FontWeight.w300),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomElevatedButton(
                      text: 'Annuler',
                      textColor: AppColors.marron,
                      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
                      borderColor: Colors.white,
                      borderRadius: 6.0,
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      height: 50,
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Add your onPressed logic here
                      },
                    ),
                    CustomElevatedButton(
                        text: 'Scanner',
                        textColor: Colors.white,
                        backgroundColor: AppColors.marron,
                        borderColor: AppColors.marron,
                        borderRadius: 6.0,
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        height: 50,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AjoutVoyage()));
                        }),
                  ],
                ),

                /*  */
              ]),
            )

        /* Stack(
        //clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height / 4,
            width: double.infinity,
            //color: Colors.white,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      color: Colors.grey,
                      width: 100,
                      height: 3,
                    ),
                  ),
                  Container(height: 500, color: Colors.red,)
                  /* ListView.builder(
                  itemCount: gares.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        /* Your onTap logic here */
                      },
                      child: ListeGare(),
                    );
                  },
                ) */
                  
                ],
              )
            ]),
          )
        ],
      ),
    */
        );
  }

  Future<void> getUserFromSP() async {
    try {
      
       final value = await Provider.of<AuthProvider>(context, listen: false)
          .getUserFromSP();
      if (value != null) {
        print('Retrieved user data: $value');
        setState(() {
          if (value.data != null) {
            userName = value.data!.fullname!;
            print('---------- username = $userName -------------');
          } else {
            print('User data is null');
          }
        });
      } else {
        print('User data not found in shared preferences');
      } 
    } catch (e) {
      print('Error retrieving user data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fullname = Provider.of<AuthProvider>(context, listen: false)
        .authRegisterResponse!
        .data!
        .fullname!;

    getUserFromSP();

    // Assuming the audio file is located at 'path/to/audio/file.mp3'
    File audioFile2 = File('audio/audio.mp3');
    File audioFile1 = File('audio/audio.mp3');
    File audioFile3 = File('audio/audio.mp3');

    voyageInfoList = [
      VoyageInfo(
          id: 83511,
          depart: 'Thiaroye',
          arrive: 'Colobane',
          prix: 500,
          date: DateTime.now(),
          classe: '2nde',
          zone: '1'),
      VoyageInfo(
          id: 83511,
          depart: 'Thiaroye',
          arrive: 'Colobane',
          prix: 500,
          date: DateTime.now(),
          classe: '2nde',
          zone: '1'),
      VoyageInfo(
          id: 83511,
          depart: 'Thiaroye',
          arrive: 'Colobane',
          prix: 500,
          date: DateTime.now(),
          classe: '2nde',
          zone: '1'),
    ];

    cardInfoList = [
      CardInfo(
        imageAsset: 'images/logoter.png',
        title: 'À savoir !',
        description:
            'Aliquam eget purus sit malesuada tempor euismod. Aliquam eget purus sit malesuada tempor euismod.',
        audioFile: audioFile1,
      ),
      CardInfo(
        imageAsset: 'images/logoter.png',
        title: 'À savoir !',
        description:
            'Aliquam eget purus sit malesuada tempor euismod. Aliquam eget purus sit malesuada tempor euismod.',
        audioFile: audioFile2,
      ),
      CardInfo(
        imageAsset: 'images/logoter.png',
        title: 'À savoir !',
        description:
            'Aliquam eget purus sit malesuada tempor euismod. Aliquam eget purus sit malesuada tempor euismod.',
        audioFile: audioFile3,
      ),
    ];
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
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        width: 180,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          //borderRadius: BorderRadius.circular(90)

          // borderRadius: BorderRadius.circular(200)
        ),
        child: FloatingActionButton(
          onPressed: () {
            // Perform some action when the button is pressed
            print('Floating action button pressed!');
            ajoutVoyageModal();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                minRadius: 15,
                backgroundColor: Colors.white,
                child: Image.asset('images/plus.png'),
              ),
              TitleOption(
                  data: 'Ajouter voyage',
                  color: Colors.white,
                  size: 16,
                  weight: FontWeight.w600),

              /*  */
            ],
          ),
          backgroundColor: AppColors.marron,
        ),
      ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleOption(
                              data: 'Bonjour $userName',
                              color: Colors.white,
                              size: 18,
                              weight: FontWeight.w600),
                          TitleOption(
                              data: 'Où allez-vous aujourd’hui?',
                              color: Colors.white,
                              size: 16,
                              weight: FontWeight.w400)
                        ],
                      ),
                      CircleAvatar(
                        child: Image.asset('images/profile.png'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      gareModal();
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Image.asset('images/arrow.png'),
                            SizedBox(
                              width: 15,
                            ),
                            TitleOption(
                                data: 'Point de départ',
                                color: Color.fromRGBO(152, 162, 179, 1),
                                size: 18,
                                weight: FontWeight.w500),
                          ],
                        ),
                      ),
                    ),
                  )
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
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TitleOption(
                      data: 'Informations ',
                      color: AppColors.marron,
                      size: 25,
                      weight: FontWeight.w700,
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(245, 245, 245, 1),
                        borderRadius: BorderRadius.circular(6)),
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ListView.builder(
                        reverse: true,
                        //padding: EdgeInsets.all(10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: cardInfoList.length,
                        itemBuilder: (context, index) {
                          CardInfo cardInfo = cardInfoList[index];
                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              width: 300,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 46,
                                          color:
                                              Color.fromRGBO(245, 245, 245, 1),
                                          child: Center(
                                            child: Image.asset(
                                              'images/logoter.png',
                                              width: 58,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //Image.asset(cardInfo.imageAsset),
                                              TitleOption(
                                                  data: cardInfo.title,
                                                  color: Colors.black,
                                                  size: 16,
                                                  weight: FontWeight.w500),
                                              TitleOption(
                                                  data: cardInfo.description,
                                                  color: Color.fromRGBO(
                                                      152, 162, 179, 1),
                                                  size: 12,
                                                  textAlign: TextAlign.start,
                                                  weight: FontWeight.w300),

                                              // Other card content
                                            ],
                                          ),
                                        )
                                      ],
                                    ),

                                    // color: Colors.red,
                                    /* child: Container(
                                            //height: 80,
                                           width: 280, */
                                    Flexible(
                                      child: VoiceMessageView(
                                        backgroundColor: Colors.yellow,
                                        circlesColor: AppColors.marron,
                                        activeSliderColor: AppColors.marron,
                                        notActiveSliderColor:
                                            Colors.transparent,
                                        size: 39,
                                        controller: VoiceController(
                                          audioSrc:
                                              cardInfo.audioFile.toString(),
                                          maxDuration:
                                              const Duration(seconds: 10),
                                          isFile: false,
                                          onComplete: () {
                                            /// do something on complete
                                          },
                                          onPause: () {
                                            /// do something on pause
                                          },
                                          onPlaying: () {
                                            /// do something on playing
                                          },
                                          onError: (err) {
                                            /// do somethin on error
                                          },
                                        ),
                                        innerPadding: 12,
                                        cornerRadius: 5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TitleOption(
                      data: 'Historique des voyages du jour',
                      color: Colors.black,
                      size: 20,
                      weight: FontWeight.w600),
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      //padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: voyageInfoList.length,
                      itemBuilder: (context, index) {
                        VoyageInfo voyageInfo = voyageInfoList[index];
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Color.fromRGBO(208, 213, 221, 1)),
                                borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors.rouge,
                                        child: Image.asset('images/train.png'),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      TitleOption(
                                          data: voyageInfoList[index]
                                              .id
                                              .toString(),
                                          color: AppColors.rouge,
                                          size: 20,
                                          weight: FontWeight.w600),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      SuiviVoyage())));
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: AppColors.marron,
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          //padding: EdgeInsets.all(10),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                    'images/location3.png'),
                                                TitleOption(
                                                    data: 'suivre',
                                                    color: Colors.white,
                                                    size: 15,
                                                    weight: FontWeight.w600)
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 58,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'images/trajet.png',
                                          height: 49,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TitleOption(
                                                data: voyageInfoList[index]
                                                    .depart,
                                                color: Color.fromRGBO(
                                                    152, 162, 179, 1),
                                                size: 15,
                                                weight: FontWeight.w600),
                                            Spacer(),
                                            TitleOption(
                                                data:
                                                    '${voyageInfoList[index].arrive.toString()}',
                                                color: Color.fromRGBO(
                                                    152, 162, 179, 1),
                                                size: 15,
                                                weight: FontWeight.w600),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          children: [
                                            TitleOption(
                                                data:
                                                    '${voyageInfoList[index].prix.toString()} CFA',
                                                color: Colors.black,
                                                size: 16,
                                                weight: FontWeight.w600),
                                            Spacer(),
                                            TitleOption(
                                                data: '10 fev',
                                                color: Color.fromRGBO(
                                                    152, 162, 179, 1),
                                                size: 15,
                                                weight: FontWeight.w600),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                    decoration: BoxDecoration(
                                      //color: Colors.yellow,
                                      border: Border(
                                        bottom: BorderSide(
                                          color:
                                              Color.fromRGBO(208, 213, 221, 1),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            Color.fromRGBO(208, 213, 221, 1),
                                        minRadius: 15,
                                        child: Image.asset('images/star.png'),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      TitleOption(
                                          data: '2nde classe',
                                          color:
                                              Color.fromRGBO(152, 162, 179, 1),
                                          size: 18,
                                          weight: FontWeight.w600),
                                      Spacer(),
                                      Image.asset('images/classe.png'),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      TitleOption(
                                          data: '1 zone',
                                          color:
                                              Color.fromRGBO(152, 162, 179, 1),
                                          size: 18,
                                          weight: FontWeight.w600),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
