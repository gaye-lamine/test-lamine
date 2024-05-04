import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:terappmobile/models/response/trains_station_response.dart';
import 'package:terappmobile/provider/auth_provider.dart';
import 'package:terappmobile/provider/train_provider.dart';
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
      var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 2.8;
    final double itemWidth = size.width / 2;
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
              child: SingleChildScrollView(
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
                          ),
                          TitleOption(data: 'Gare de Thiaroye', color: Color.fromRGBO(109, 76, 35, 1), size: 23, weight: FontWeight.w700, maxLines: 1, overflow: TextOverflow.clip,),
                
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
                            height: height/5,
                            //width: itemWidth,
                            decoration :BoxDecoration(
                              border: Border.all(color: Color.fromRGBO(152, 162, 179, 1)),
                              borderRadius: BorderRadius.circular(10), 
                          
                          
                            ),
                            child: Center(
                              child :Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                               children:[
                                CircleAvatar(
                                  backgroundColor: Color.fromRGBO(48, 183, 0, 0.14),
                                  minRadius: 25,
                                  child: Image.asset('images/timegreen.png'),
                                ),
                                TitleOption(data: 'Heure d’ouverture', color: Colors.black54, size: 14, weight: FontWeight.w500, maxLines: 1, overflow: TextOverflow.clip,),
                                TitleOption(data: '05h 00mn', color: Colors.black, size: 14, weight: FontWeight.w500, maxLines: 1, overflow: TextOverflow.clip,),
                          
                          
                               ]
                              )
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                         Flexible(
                           child: Container(
                             padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
                
                            height: height/5,
                            //width: itemWidth,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(152, 162, 179, 1)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child :Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                               children:[
                                CircleAvatar(
                                  backgroundColor: Color.fromRGBO(186, 0, 0, 0.14),
                                  minRadius: 25,
                                  child: Image.asset('images/timered2.png'),
                                ),
                                TitleOption(data: 'Heure de fermeture', color: Colors.black54, size: 14, weight: FontWeight.w500, maxLines: 1, overflow: TextOverflow.clip,),
                                TitleOption(data: '23h 00', color: Colors.black, size: 14, weight: FontWeight.w500, maxLines: 1, overflow: TextOverflow.clip,),
                           
                               ]
                              )
                            ),
                                                 ),
                         ),
                      ],
                    ),
                    SizedBox(height: 30,) ,
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            height: height / 6,
                            //width: itemWidth,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(242, 244, 247, 1),
                              border: Border.all(
                                  color: Color.fromRGBO(152, 162, 179, 1)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        Colors.white,
                                    minRadius: 20,
                                    child: Image.asset('images/parking.png' ,height: 20,),
                                  ),
                                  TitleOption(
                                    data: 'Parking',
                                    color: Color.fromRGBO(102, 112, 133, 1),
                                    size: 15,
                                    weight: FontWeight.w400,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.check ,color: Colors.green, weight: 12,),
                                       TitleOption(
                                        data: 'Disponible',
                                        color: Color.fromRGBO(102, 112, 133, 1),
                                        size: 12,
                                        weight: FontWeight.w400,
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                      ),
                
                                    ],
                                  )
                                ])),
                          
                        ),
                        SizedBox(
                          width: 20,
                        ),
                         Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            height: height / 6,
                            //width: itemWidth,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(242, 244, 247, 1),
                              border: Border.all(
                                  color: Color.fromRGBO(152, 162, 179, 1)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    minRadius: 20,
                                    child: Image.asset(
                                      'images/parvis.png',
                                      height: 20,
                                    ),
                                  ),
                                  TitleOption(
                                    data: 'Parvis',
                                    color: Color.fromRGBO(102, 112, 133, 1),
                                    size: 15,
                                    weight: FontWeight.w400,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        weight: 12,
                                      ),
                                      TitleOption(
                                        data: 'Disponible',
                                        color: Color.fromRGBO(102, 112, 133, 1),
                                        size: 12,
                                        weight: FontWeight.w400,
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ],
                                  )
                                ])),
                          
                        ),
                        SizedBox(width: 20,),
                         Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            height: height / 6,
                            //width: itemWidth,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(242, 244, 247, 1),
                              border: Border.all(
                                  color: Color.fromRGBO(152, 162, 179, 1)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                           
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    minRadius: 20,
                                    child: Image.asset(
                                      'images/agence.png',
                                      height: 20,
                                    ),
                                  ),
                                  TitleOption(
                                    data: 'Agence',
                                    color: Color.fromRGBO(102, 112, 133, 1),
                                    size: 15,
                                    weight: FontWeight.w400,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: ,
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.green,
                                          weight: 12,
                                        ),
                                      ),
                                      TitleOption(
                                        data: 'Disponible',
                                        color: Color.fromRGBO(102, 112, 133, 1),
                                        size: 12,
                                        weight: FontWeight.w400,
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ],
                                  )
                                ])),
                          
                        ),
                       ],
                    ),
                    SizedBox(height: 40,) ,
                  Consumer<GareProvider>(
                      builder: (context, provider, child) {
                        return Column(
                          children: provider.selectedStation.commerces
                              .map((commerce) {
                            return CommerceListItem(commerce: commerce);
                          }).toList(),
                        );
                      },
                    ),  
                
                
                
                
                ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CommerceListItem extends StatefulWidget {
  final Commerces commerce;

  const CommerceListItem({Key? key, required this.commerce}) : super(key: key);

  @override
  _CommerceListItemState createState() => _CommerceListItemState();
}

class _CommerceListItemState extends State<CommerceListItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
           decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(152, 162, 179, 1)),
            borderRadius: BorderRadius.circular(10),
            color: isExpanded ? Color.fromRGBO(242, 244, 247, 1) : Colors.white
          ),
          child: 
            ListTile(
              selectedColor: Color.fromRGBO(242, 244, 247, 1),
              title: Text(widget.commerce.nom),
              subtitle: isExpanded
                  ? Text('Description: ${widget.commerce.description}')
                  : null,
              trailing: GestureDetector(
                onTap : () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
                
                child:  Flexible(
                  child: CircleAvatar(
                    backgroundColor:isExpanded ? Colors.white :  Color.fromRGBO(242, 244, 247, 1) ,
                    child: Icon(isExpanded ? Icons.more : Icons.expand_more)),
                ),
                  /* onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  }, */
                ),
              ),
            ),
        
        
        SizedBox(height: 5,),

      ],
    );
  }
}
