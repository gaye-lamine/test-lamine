import 'dart:async';

import 'package:flutter/material.dart';
import 'package:async/async.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:terappmobile/models/choice_train.dart';
import 'package:terappmobile/screens/home/accueil.dart';
import 'package:terappmobile/screens/home/home.dart';
import 'package:terappmobile/utils/app_colors.dart';
import 'package:terappmobile/utils/googlefonts.dart';
import 'package:terappmobile/utils/title_option.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:timelines/timelines.dart' as tl;

class TrainVoyage extends StatefulWidget {
  const TrainVoyage({Key? key}) : super(key: key);

  @override
  State<TrainVoyage> createState() => _TrainVoyageState();
}

class _TrainVoyageState extends State<TrainVoyage> {
  int selectedcarindex = 0;
  bool _isDakarSelected = true;
  bool _isChangingValues = false; // Track whether values are changing
  Timer? _debounceTimer;

  // Function to debounce state updates
  void _debounce(VoidCallback callback) {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(Duration(milliseconds: 500), () {
      callback();
    });
  }

   String getFirstOptionText() {
    return _isDakarSelected ? "Dakar" : "Diamniadio";
  }

  String getLastOptionText() {
    return _isDakarSelected ? "Diamniadio" : "Dakar";
  }

  List<ChoiceTrain> choiceTrains = [
    ChoiceTrain(id: 8355, depart: DateTime.now(), arrivee: DateTime.now()),
    ChoiceTrain(id: 8355, depart: DateTime.now(), arrivee: DateTime.now()),
    ChoiceTrain(id: 8355, depart: DateTime.now(), arrivee: DateTime.now()),
  ];
  final currentStep = 3;

  final appSteps = [
    'Configure',
    'Code',
    'Test',
    'Deploy',
    'Scale',
  ];

  List<_TimelineStatus> data = [
    _TimelineStatus.done,
    _TimelineStatus.inProgress,
    _TimelineStatus.inProgress,
    _TimelineStatus.todo
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    const kTileHeight = 50.0;
    bool _isDakarSelected = true; // Initially Dakar is selected

    //late LineStyle afterLineStyle = LineStyle();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            //color: Colors.amber,
          ),
          Container(
            height: 300,
            width: width,
            color: AppColors.marron,
          ),
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            child: Container(
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: ((context) => Home())));
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
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TitleOption(
                        data: 'Train de voyage',
                        color: Colors.white,
                        size: 23,
                        weight: FontWeight.normal,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                      TitleOption(
                        data: 'Trajet occasionnel',
                        color: Colors.white,
                        size: 16,
                        weight: FontWeight.w400,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                  SizedBox(width: 45),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: 100,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: 300,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleOption(
                      data: 'Plan de la ligne',
                      color: Colors.black,
                      size: 20,
                      weight: FontWeight.w600,
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(maxHeight: 120),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(
                            width: 1, color: const Color(0xFF9F92E2)),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: appSteps.length,
                        itemBuilder: (BuildContext context, int index) {
                          var beforeLineStyle = const LineStyle(
                            thickness: 20,
                            color: Color(0xFFD4D4D4),
                          );

                          LineStyle afterLineStyle = LineStyle(
                              thickness: 20, color: Color(0xFFD4D4D4));
                          if (index <= currentStep) {
                            beforeLineStyle = const LineStyle(
                              thickness: 24,
                              color: AppColors.rouge,
                            );
                          }

                          if (index < currentStep) {
                            afterLineStyle = const LineStyle(
                              thickness: 24,
                              color: AppColors.rouge,
                            );
                          }

                          final isFirst = index == 0;
                          final isLast = index == appSteps.length - 1;
                          var indicatorX = 0.5;
                          if (isFirst) {
                            indicatorX = 0.3;
                          } else if (isLast) {
                            indicatorX = 0.7;
                          }

                          return TimelineTile(
                            axis: TimelineAxis.horizontal,
                            alignment: TimelineAlign.manual,
                            lineXY: 0.8,
                            isFirst: isFirst,
                            isLast: isLast,
                            beforeLineStyle: beforeLineStyle,
                            afterLineStyle: afterLineStyle,
                            hasIndicator: index <= currentStep || isLast,
                            indicatorStyle: IndicatorStyle(
                              width: 20,
                              height: 20,
                              indicatorXY: indicatorX,
                              color: Colors.white,
                              indicator: index <= currentStep
                                  ? const _IndicatorApp()
                                  : null,
                            ),
                            startChild: Container(
                              constraints: const BoxConstraints(minWidth: 120),
                              margin: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.rouge,
                                    child: Image.asset('images/location.png'),
                                  ),
                                  /* Image.asset('images/app/$index.png',
                                        height: 40), */
                                  const SizedBox(width: 8),
                                  Text(
                                    appSteps[index],
                                    style: GoogleFonts.sniglet(
                                      fontSize: 14,
                                      color: index <= currentStep
                                          ? const Color(0xFF9F92E2)
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                   
                    Container(
                        width: double.infinity,
                        height: 2,
                        color: Color.fromRGBO(208, 213, 221, 1)),
                    SizedBox(
                      height: 20,
                    ),
                    TitleOption(
                        data: 'Sens de voyage',
                        color: Color.fromRGBO(1, 84, 103, 1),
                        size: 21,
                        weight: FontWeight.w500),
                    SizedBox(
                      height: 10,
                    ),

Container(
                      height: 70,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(152, 162, 179, 1),
                                  child: Image.asset('images/location4.png'),
                                ),
                                TitleOption(
                                  data:
                                      _isDakarSelected ? "Dakar" : "Diamniadio",
                                  color: Color.fromRGBO(102, 112, 133, 1),
                                  size: 14,
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: Color.fromRGBO(208, 213, 221, 1),
                              thickness: 1,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Toggle the selection between Dakar and Diamniadio
                              setState(() {
                                _isDakarSelected = !_isDakarSelected;
                                      print(
                                    _isDakarSelected); // Print the current value for debugging

                              });

                              // Print the current value of _isDakarSelected
                              print(_isDakarSelected);
                            },
                            child: Container(
                              width: 100,
                              child: CircleAvatar(
                                radius: 80,
                                backgroundColor: AppColors.rouge,
                                child: Image.asset('images/sensvoyage.png'),
                              ),
                            ),
                          ),
                          /* GestureDetector(
                            onTap: () {
                              // Toggle the selection between Dakar and Diamniadio
                              setState(() {
                                _isDakarSelected = !_isDakarSelected;
                              });

                              // Print the current value of _isDakarSelected
                              print(_isDakarSelected);
                            },
                            child: Container(
                              width: 100,
                              child: CircleAvatar(
                                radius: 80,
                                backgroundColor: AppColors.rouge,
                                child: Image.asset('images/sensvoyage.png'),
                              ),
                            ),
                          ),
                           */Expanded(
                            child: Divider(
                              color: Color.fromRGBO(208, 213, 221, 1),
                              thickness: 1,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(152, 162, 179, 1),
                                  child: Image.asset('images/location4.png'),
                                ),
                                TitleOption(
                                  data:
                                      _isDakarSelected ? "Diamniadio" : "Dakar",
                                  color: Color.fromRGBO(102, 112, 133, 1),
                                  size: 14,
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: double.infinity,
                        height: 2,
                        color: Color.fromRGBO(208, 213, 221, 1)),
                    SizedBox(
                      height: 20,
                    ),
                    TitleOption(
                        data: 'Trains disponibles',
                        color: Color.fromRGBO(1, 84, 103, 1),
                        size: 21,
                        weight: FontWeight.w500),
                    trainswidget(),
                    TitleOption(
                        data: 'Trains disponibles2',
                        color: Color.fromRGBO(1, 84, 103, 1),
                        size: 21,
                        weight: FontWeight.w500),
                    trainswidget2(),
                    /*  Container(
                        width: double.infinity,
                        height: 2,
                        color: Color.fromRGBO(208, 213, 221, 1)), */
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget trainswidget() {
    return Column(
      children: [
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: choiceTrains.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {
                      if (mounted) {
                        setState(() {
                          selectedcarindex = index;
                        });
                      }
                    },
                    child: Container(
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: (selectedcarindex == index)
                            ? AppColors.rouge
                            : Color.fromRGBO(242, 244, 247, 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset('images/trainrouge.png'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              choiceTrains[index].id.toString(),
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                color: (selectedcarindex == index)
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
        SizedBox(height: 30),
        Container(
          width: double.infinity,
          height: 2,
          color: AppColors.rouge,
        ),
        TitleOption(
          data: 'Statut actuel du ${choiceTrains[selectedcarindex].id}',
          color: Color.fromRGBO(1, 84, 103, 1),
          size: 21,
          weight: FontWeight.w500,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 600,
            width: 200,
            // Adjust margin and constraints as needed
            margin: const EdgeInsets.all(8),
            constraints: const BoxConstraints(maxHeight: 500),
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(width: 1, color: const Color(0xFF9F92E2)),
            ),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: appSteps.length,
              itemBuilder: (BuildContext context, int index) {
                var beforeLineStyle = const LineStyle(
                  thickness: 20,
                  color: Color(0xFFD4D4D4),
                );

                LineStyle afterLineStyle =
                    LineStyle(thickness: 20, color: Color(0xFFD4D4D4));
                if (index <= currentStep) {
                  beforeLineStyle = const LineStyle(
                    thickness: 24,
                    color: AppColors.rouge,
                  );
                }

                if (index < currentStep) {
                  afterLineStyle = const LineStyle(
                    thickness: 24,
                    color: AppColors.rouge,
                  );
                }

                final isFirst = index == 0;
                final isLast = index == appSteps.length - 1;
                var indicatorX = 0.5;
                if (isFirst) {
                  indicatorX = 0.3;
                } else if (isLast) {
                  indicatorX = 0.7;
                }

                return TimelineTile(
                  axis: TimelineAxis.vertical,
                  alignment: TimelineAlign.start,
                  lineXY: 0.2,
                  isFirst: isFirst,
                  isLast: isLast,
                  beforeLineStyle: beforeLineStyle,
                  afterLineStyle: afterLineStyle,
                  hasIndicator: index <= currentStep || isLast,
                  indicatorStyle: IndicatorStyle(
                    width: 20,
                    height: 20,
                    indicatorXY: indicatorX,
                    color: Colors.white,
                    indicator:
                        index <= currentStep ? const _IndicatorApp() : null,
                  ),
                  endChild: Container(
                    constraints: BoxConstraints(minWidth: 50),
                    margin: EdgeInsets.all(0),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 17,
                                backgroundColor: AppColors.rouge,
                                child: Image.asset('images/location.png'),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                textAlign: TextAlign.start,
                                appSteps[index],
                                style: GoogleFonts.sniglet(
                                  fontSize: 14,
                                  color: index <= currentStep
                                      ? const Color(0xFF9F92E2)
                                      : Colors.black,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('images/detailvoyage.png'),
                              Column(
                                children: [
                                  TitleOption(
                                    data: '9h45 depart',
                                    color: Colors.black,
                                    size: 15,
                                    weight: FontWeight.normal,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  ),
                                  TitleOption(
                                    data: '9h45 depart',
                                    color: Colors.black,
                                    size: 15,
                                    weight: FontWeight.normal,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  )
                                ],
                              )
                            ],
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
        /* Container(
          height: 500, // Adjust the height as needed
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          constraints: const BoxConstraints(maxHeight: 120),
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(width: 1, color: const Color(0xFF9F92E2)),
          ),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: appSteps.length,
            itemBuilder: (BuildContext context, int index) {
              var beforeLineStyle = const LineStyle(
                thickness: 20,
                color: Color(0xFFD4D4D4),
              );

              LineStyle afterLineStyle =
                  LineStyle(thickness: 20, color: Color(0xFFD4D4D4));
              if (index <= currentStep) {
                beforeLineStyle = const LineStyle(
                  thickness: 24,
                  color: AppColors.rouge,
                );
              }

              if (index < currentStep) {
                afterLineStyle = const LineStyle(
                  thickness: 24,
                  color: AppColors.rouge,
                );
              }

              final isFirst = index == 0;
              final isLast = index == appSteps.length - 1;
              var indicatorX = 0.5;
              if (isFirst) {
                indicatorX = 0.3;
              } else if (isLast) {
                indicatorX = 0.7;
              }

              return TimelineTile(
                axis: TimelineAxis.horizontal,
                alignment: TimelineAlign.manual,
                lineXY: 0.8,
                isFirst: isFirst,
                isLast: isLast,
                beforeLineStyle: beforeLineStyle,
                afterLineStyle: afterLineStyle,
                hasIndicator: index <= currentStep || isLast,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  height: 20,
                  indicatorXY: indicatorX,
                  color: Colors.white,
                  indicator:
                      index <= currentStep ? const _IndicatorApp() : null,
                ),
                startChild: Container(
                  constraints: const BoxConstraints(minWidth: 120),
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.rouge,
                        child: Image.asset('images/location.png'),
                      ),
                      /* Image.asset('images/app/$index.png',
                                            height: 40), */
                      const SizedBox(width: 8),
                      Text(
                        appSteps[index],
                        style: GoogleFonts.sniglet(
                          fontSize: 14,
                          color: index <= currentStep
                              ? const Color(0xFF9F92E2)
                              : Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              );

              // Your timeline tile widgets here
            },
          ),
        ),
      */
      ],
    );
  }

  Widget trainswidget2() {
    return Column(
      children: [
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: choiceTrains.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {
                      if (mounted) {
                        setState(() {
                          selectedcarindex = index;
                        });
                      }
                    },
                    child: Container(
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: (selectedcarindex == index)
                            ? AppColors.rouge
                            : Color.fromRGBO(242, 244, 247, 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset('images/trainrouge.png'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              choiceTrains[index].id.toString(),
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                color: (selectedcarindex == index)
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
        SizedBox(height: 30),
        Container(
          width: double.infinity,
          height: 2,
          color: AppColors.rouge,
        ),
        TitleOption(
          data: 'Statut actuel du ${choiceTrains[selectedcarindex].id}',
          color: Color.fromRGBO(1, 84, 103, 1),
          size: 21,
          weight: FontWeight.w500,
        ),
        Container(
          height: 600,
          width: 300,
          // Adjust margin and constraints as needed
          margin: const EdgeInsets.all(8),
          constraints: const BoxConstraints(maxHeight: 500),
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(width: 1, color: const Color(0xFF9F92E2)),
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final data = _data(index + 1);
              return Center(
                child: Container(
                  width: 360.0,
                  child: Card(
                    margin: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: _OrderTitle(
                            orderInfo: data,
                          ),
                        ),
                        Divider(height: 1.0),
                        _DeliveryProcesses(processes: data.deliveryProcesses),
                        Divider(height: 1.0),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: _OnTimeBar(driver: data.driverInfo),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        /* Container(
          height: 500, // Adjust the height as needed
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          constraints: const BoxConstraints(maxHeight: 120),
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(width: 1, color: const Color(0xFF9F92E2)),
          ),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: appSteps.length,
            itemBuilder: (BuildContext context, int index) {
              var beforeLineStyle = const LineStyle(
                thickness: 20,
                color: Color(0xFFD4D4D4),
              );

              LineStyle afterLineStyle =
                  LineStyle(thickness: 20, color: Color(0xFFD4D4D4));
              if (index <= currentStep) {
                beforeLineStyle = const LineStyle(
                  thickness: 24,
                  color: AppColors.rouge,
                );
              }

              if (index < currentStep) {
                afterLineStyle = const LineStyle(
                  thickness: 24,
                  color: AppColors.rouge,
                );
              }

              final isFirst = index == 0;
              final isLast = index == appSteps.length - 1;
              var indicatorX = 0.5;
              if (isFirst) {
                indicatorX = 0.3;
              } else if (isLast) {
                indicatorX = 0.7;
              }

              return TimelineTile(
                axis: TimelineAxis.horizontal,
                alignment: TimelineAlign.manual,
                lineXY: 0.8,
                isFirst: isFirst,
                isLast: isLast,
                beforeLineStyle: beforeLineStyle,
                afterLineStyle: afterLineStyle,
                hasIndicator: index <= currentStep || isLast,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  height: 20,
                  indicatorXY: indicatorX,
                  color: Colors.white,
                  indicator:
                      index <= currentStep ? const _IndicatorApp() : null,
                ),
                startChild: Container(
                  constraints: const BoxConstraints(minWidth: 120),
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.rouge,
                        child: Image.asset('images/location.png'),
                      ),
                      /* Image.asset('images/app/$index.png',
                                            height: 40), */
                      const SizedBox(width: 8),
                      Text(
                        appSteps[index],
                        style: GoogleFonts.sniglet(
                          fontSize: 14,
                          color: index <= currentStep
                              ? const Color(0xFF9F92E2)
                              : Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              );

              // Your timeline tile widgets here
            },
          ),
        ),
      */
      ],
    );
  }

  /*     Widget trainswidget() {
        //Text((tripDirectionDetail != null)? CommonMethods.calculateFareAmount((tripDirectionDetail!)).toString() : "" ,style: GoogleFonts.montserrat(color: Colors.black , fontSize: 20  ,fontWeight: FontWeight.bold),),
        //var cars = CommonMethods.calculateFareAmount(tripDirectionDetail!);
        return Column(
          children: [
            StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //itemCount: choiceCars.length,
                  itemCount: choiceTrains.length,

                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          if (mounted) {
                            //barTapedd(index);
                            setState(() {
                              selectedcarindex = index; // Update selected car index
                            });
                            print(' l index choisi pour train ${index}');
                            /*  setState(() {
                                
                                //SelectedVehiculeType = choiceCars[index].type;
                                // You can also update other state variables here if needed
                                // defaultcar = (SelectedVehiculeType == 'taxi');
                              }); */
                          }
                        },
                        child: Container(
                            width: 130,
                            //height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: (selectedcarindex == index)
                                  ? AppColors.rouge
                                  : Color.fromRGBO(242, 244, 247, 1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image.asset('images/trainrouge.png'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    choiceTrains[index].id.toString(),
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w700,
                                      color: (selectedcarindex == index)
                                          ? Colors.white
                                          : Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    );
                  },
                ),
              );
            }),
            SizedBox(height: 30,) ,
            Container(
                width: double.infinity,
                height: 2,
                color:AppColors.rouge),
            TitleOption(
                data: 'Statut actuel du ${choiceTrains[selectedcarindex].id}',
                color: Color.fromRGBO(1, 84, 103, 1),
                size: 21,
                weight: FontWeight.w500),
            Container(
                height: 500,
                width: double.infinity,
                  margin: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(maxHeight: 120),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(width: 1, color: const Color(0xFF9F92E2)),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: appSteps.length,
                    itemBuilder: (BuildContext context, int index) {
                      var beforeLineStyle = const LineStyle(
                        thickness: 20,
                        color: Color(0xFFD4D4D4),
                      );
              
                      LineStyle afterLineStyle =
                          LineStyle(thickness: 20, color: Color(0xFFD4D4D4));
                      if (index <= currentStep) {
                        beforeLineStyle = const LineStyle(
                          thickness: 24,
                          color: AppColors.rouge,
                        );
                      }
              
                      if (index < currentStep) {
                        afterLineStyle = const LineStyle(
                          thickness: 24,
                          color: AppColors.rouge,
                        );
                      }
              
                      final isFirst = index == 0;
                      final isLast = index == appSteps.length - 1;
                      var indicatorX = 0.5;
                      if (isFirst) {
                        indicatorX = 0.3;
                      } else if (isLast) {
                        indicatorX = 0.7;
                      }
              
                      return TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.manual,
                        lineXY: 0.8,
                        isFirst: isFirst,
                        isLast: isLast,
                        beforeLineStyle: beforeLineStyle,
                        afterLineStyle: afterLineStyle,
                        hasIndicator: index <= currentStep || isLast,
                        indicatorStyle: IndicatorStyle(
                          width: 20,
                          height: 20,
                          indicatorXY: indicatorX,
                          color: Colors.white,
                          indicator:
                              index <= currentStep ? const _IndicatorApp() : null,
                        ),
                        startChild: Container(
                          constraints: const BoxConstraints(minWidth: 120),
                          margin: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.rouge,
                                child: Image.asset('images/location.png'),
                              ),
                              /* Image.asset('images/app/$index.png',
                                            height: 40), */
                              const SizedBox(width: 8),
                              Text(
                                appSteps[index],
                                style: GoogleFonts.sniglet(
                                  fontSize: 14,
                                  color: index <= currentStep
                                      ? const Color(0xFF9F92E2)
                                      : Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
            
            
                    
            
                
                
          ],
        );
      }
  */
}

class _EmptyContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      height: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: Color(0xffe6e7e9),
      ),
    );
  }
}

class _IndicatorApp extends StatelessWidget {
  const _IndicatorApp();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 5,
            left: 5,
          ),
          child: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

enum _TimelineStatus {
  done,
  sync,
  inProgress,
  todo,
}

extension on _TimelineStatus {
  bool get isInProgress => this == _TimelineStatus.inProgress;
}

class _OrderTitle extends StatelessWidget {
  const _OrderTitle({
    Key? key,
    required this.orderInfo,
  }) : super(key: key);

  final _OrderInfo orderInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Delivery #${orderInfo.id}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          '${orderInfo.date.day}/${orderInfo.date.month}/${orderInfo.date.year}',
          style: TextStyle(
            color: Color(0xffb6b2b2),
          ),
        ),
      ],
    );
  }
}

class _InnerTimeline extends StatelessWidget {
  const _InnerTimeline({
    required this.messages,
  });

  final List<_DeliveryMessage> messages;

  @override
  Widget build(BuildContext context) {
    bool isEdgeIndex(int index) {
      return index == 0 || index == messages.length + 1;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: tl.FixedTimeline.tileBuilder(
        theme: tl.TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          connectorTheme: tl.TimelineTheme.of(context).connectorTheme.copyWith(
                thickness: 1.0,
              ),
          indicatorTheme: tl.TimelineTheme.of(context).indicatorTheme.copyWith(
                size: 10.0,
                position: 0.5,
              ),
        ),
        builder: tl.TimelineTileBuilder(
          indicatorBuilder: (_, index) => !isEdgeIndex(index)
              ? tl.Indicator.outlined(borderWidth: 1.0)
              : null,
          startConnectorBuilder: (_, index) => tl.Connector.solidLine(),
          endConnectorBuilder: (_, index) => tl.Connector.solidLine(),
          contentsBuilder: (_, index) {
            if (isEdgeIndex(index)) {
              return null;
            }

            return Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(messages[index - 1].toString()),
            );
          },
          itemExtentBuilder: (_, index) => isEdgeIndex(index) ? 10.0 : 30.0,
          nodeItemOverlapBuilder: (_, index) =>
              isEdgeIndex(index) ? true : null,
          itemCount: messages.length + 2,
        ),
      ),
    );
  }
}

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({Key? key, required this.processes})
      : super(key: key);

  final List<_DeliveryProcess> processes;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Color(0xff9b9b9b),
        fontSize: 12.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: tl.FixedTimeline.tileBuilder(
          theme: tl.TimelineThemeData(
            nodePosition: 0,
            color: Color(0xff989898),
            indicatorTheme: tl.IndicatorThemeData(
              position: 0,
              size: 20.0,
            ),
            connectorTheme: tl.ConnectorThemeData(
              thickness: 2.5,
            ),
          ),
          builder: tl.TimelineTileBuilder.connected(
            connectionDirection: tl.ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              if (processes[index].isCompleted) return null;

              return Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      processes[index].name,
                      style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: 18.0,
                          ),
                    ),
                    _InnerTimeline(messages: processes[index].messages),
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              if (processes[index].isCompleted) {
                return tl.DotIndicator(
                  color: Color(0xff66c97f),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12.0,
                  ),
                );
              } else {
                // Customize the before-line style here
                return tl.DotIndicator(
                  color: Color(0xFFD4D4D4), // Example color
                  child: tl.OutlinedDotIndicator(
                    borderWidth: 2.5,
                  ),
                );
              }
            },
            connectorBuilder: (_, index, ___) {
              // Customize the after-line style here
              return tl.SolidLineConnector(
                thickness: 20,
                color: processes[index].isCompleted
                    ? Color(0xff66c97f)
                    : Color(0xFFD4D4D4), // Example colors
              );
            },
          ),

          /*  builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              if (processes[index].isCompleted) return null;

              return Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      processes[index].name,
                      style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: 18.0,
                          ),
                    ),
                    _InnerTimeline(messages: processes[index].messages),
                  ],
                ),
              );
            },
           indicatorBuilder: (_, index) {
              if (processes[index].isCompleted) {
                return DotIndicator(
                  color: Color(0xff66c97f),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12.0,
                  ),
                );
              } else {
                return OutlinedDotIndicator(
                  borderWidth: 2.5,
                );
              }
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(
              thickness: 20,
              color: processes[index].isCompleted ? Color(0xff66c97f) : null,
            ), 
          ),
         */
        ),
      ),
    );
  }
}

class _OnTimeBar extends StatelessWidget {
  const _OnTimeBar({Key? key, required this.driver}) : super(key: key);

  final _DriverInfo driver;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('On-time!'),
              ),
            );
          },
          elevation: 0,
          shape: StadiumBorder(),
          color: Color(0xff66c97f),
          textColor: Colors.white,
          child: Text('On-time'),
        ),
        Spacer(),
        Text(
          'Driver\n${driver.name}',
          textAlign: TextAlign.center,
        ),
        SizedBox(width: 12.0),
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                driver.thumbnailUrl,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

_OrderInfo _data(int id) => _OrderInfo(
      id: id,
      date: DateTime.now(),
      driverInfo: _DriverInfo(
        name: 'Philipe',
        thumbnailUrl:
            'https://i.pinimg.com/originals/08/45/81/084581e3155d339376bf1d0e17979dc6.jpg',
      ),
      deliveryProcesses: [
        _DeliveryProcess(
          'Package Process',
          messages: [
            _DeliveryMessage('8:30am', 'Package received by driver'),
            _DeliveryMessage('11:30am', 'Reached halfway mark'),
          ],
        ),
        _DeliveryProcess(
          'In Transit',
          messages: [
            _DeliveryMessage('13:00pm', 'Driver arrived at destination'),
            _DeliveryMessage('11:35am', 'Package delivered by m.vassiliades'),
          ],
        ),
        _DeliveryProcess.complete(),
      ],
    );

class _OrderInfo {
  const _OrderInfo({
    required this.id,
    required this.date,
    required this.driverInfo,
    required this.deliveryProcesses,
  });

  final int id;
  final DateTime date;
  final _DriverInfo driverInfo;
  final List<_DeliveryProcess> deliveryProcesses;
}

class _DriverInfo {
  const _DriverInfo({
    required this.name,
    required this.thumbnailUrl,
  });

  final String name;
  final String thumbnailUrl;
}

class _DeliveryProcess {
  const _DeliveryProcess(
    this.name, {
    this.messages = const [],
  });

  const _DeliveryProcess.complete()
      : this.name = 'Done',
        this.messages = const [];

  final String name;
  final List<_DeliveryMessage> messages;

  bool get isCompleted => name == 'Done';
}

class _DeliveryMessage {
  const _DeliveryMessage(this.createdAt, this.message);

  final String createdAt; // final DateTime createdAt;
  final String message;

  @override
  String toString() {
    return '$createdAt $message';
  }
}
