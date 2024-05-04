import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terappmobile/provider/get_user_provider.dart';
import 'package:terappmobile/utils/app_colors.dart';
import 'package:terappmobile/utils/title_option.dart';
import 'package:terappmobile/widgets/customelevatedbutton.dart';

class ModifyProfile extends StatefulWidget {
  @override
  _ModifyProfileState createState() => _ModifyProfileState();
}

class _ModifyProfileState extends State<ModifyProfile> {
  late TextEditingController addressController;
  late TextEditingController carteController;
  late TextEditingController nomController;
  late TextEditingController phoneNumberController = TextEditingController();

  bool isactive = false;
  bool switchValue = false;

  @override
  void initState() {
    // TODO: implement initState
    nomController = TextEditingController();
    addressController = TextEditingController();
    carteController = TextEditingController();

    nomController.addListener(updateActivateState);
    addressController.addListener(updateActivateState);
    carteController.addListener(updateActivateState);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nomController.dispose();
    addressController.dispose();
    carteController.dispose();
    super.dispose();
  }

  void updateActivateState() {
    bool isActive = false;

    if (!switchValue) {
      isActive =
          nomController.text.isNotEmpty && addressController.text.isNotEmpty;
    } else {
      isActive = carteController.text.isNotEmpty;
    }

    setState(() {
      isactive = isActive;
    });
  }

  void getuser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("user_id") as int;
    print("l'id du user connecté $id");
  }

  @override
  Widget build(BuildContext context) {
    var getUserProvider = Provider.of<GetUserProvider>(context, listen: false);
    getUserProvider.fetchUser();
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
            color: Color.fromRGBO(245, 245, 245, 1),
            /* child: Image.asset(
              "images/homefond.png",
              fit: BoxFit.fill,
              height: 230,
            ), */
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
                      Navigator.of(context).pop();
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
                        data: 'Profil',
                        color: Colors.black,
                        size: 27,
                        weight: FontWeight.normal,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                      TitleOption(
                        data: 'Modification du profil',
                        color: Colors.black,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(children: [
                          Image.asset(
                            'images/profil2.png',
                            width: 100,
                          ),
                          Positioned(
                            bottom: 5,
                            right: 0,
                            //right:10 ,
                            // alignment: Alignment.bottomLeft,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset('images/modifypic.png'),
                            ),
                          )
                        ]),
                        TitleOption(
                          data: 'Mouhamadou Coulibaly ',
                          color: Colors.black87,
                          size: 18,
                          weight: FontWeight.w700,
                          maxLines: 2,
                        ),
                        TitleOption(
                          data: '+221 77 123 45 67',
                          color: Colors.grey,
                          size: 16,
                          weight: FontWeight.w700,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TitleOption(
                    data: "Nom complet",
                    color: Color.fromRGBO(94, 94, 94, 1),
                    size: 16,
                    weight: FontWeight.w500,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 70,
                    child: TextField(
                      controller: nomController,
                      onChanged: (value) {
                        updateActivateState();
                      },
                      decoration: InputDecoration(
                        prefixIcon: Image.asset('images/person.png'),
                        hintText: 'Ex: John Doe',
                        //prefixText: "Ex: John Doe",
                        hintStyle: TextStyle(fontSize: 16),
                        labelStyle: TextStyle(color: Colors.black38),
                        fillColor: Color.fromRGBO(245, 245, 245, 1),
                        focusColor: Colors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              width: 3.0, color: Colors.grey.shade200),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TitleOption(
                    data: "Adresse de résidence",
                    color: Color.fromRGBO(94, 94, 94, 1),
                    size: 16,
                    weight: FontWeight.w500,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 70,
                    child: TextField(
                      controller: addressController,
                      onChanged: (value) {
                        updateActivateState();
                      },
                      decoration: InputDecoration(
                        prefixIcon: Image.asset('images/location.png'),
                        /* Icon(
                          Icons.location_city,
                          size: 25,
                          color: Colors.b,
                        ), */
                        suffixIcon: Image.asset('images/location2.png'),
                        hintText: 'Choisir l’adresse',
                        //prefixText: "Ex: John Doe",
                        hintStyle: TextStyle(fontSize: 16),
                        labelStyle: TextStyle(color: Colors.black38),
                        fillColor: Color.fromRGBO(245, 245, 245, 1),
                        focusColor: Colors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              width: 3.0, color: Colors.grey.shade200),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleOption(
                        data: 'Téléphone',
                        color: Colors.black45,
                        size: 16,
                        weight: FontWeight.w100,
                        textAlign: TextAlign.start,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1),
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'images/flag.png',
                                  width: 30,
                                  height: 20,
                                ),
                                TitleOption(
                                    data: '+221',
                                    color: Colors.black26,
                                    size: 16,
                                    weight: FontWeight.bold)
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 250,
                            height: 70,
                            decoration: BoxDecoration(
                                //color: Color.fromRGBO(245, 245, 245, 1),
                                /*  border: Border.all(
                                    color: AppColors.marron,
                                    width: 1,
                                  ), */
                                borderRadius: BorderRadius.circular(6)),
                            child: TextField(
                              controller: phoneNumberController,
                              onChanged: (value) {
                                updateActivateState();
                              },
                              decoration: InputDecoration(
                                hintText: '',
                                labelStyle: TextStyle(color: Colors.black38),
                                fillColor: Colors.white,
                                focusColor: Colors.grey,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      width: 3.0, color: AppColors.marron),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomElevatedButton(
                      text: 'Enregistrer les modifications',
                      textColor: Colors.white,
                      backgroundColor: AppColors.marron,
                      borderColor: AppColors.marron,
                      borderRadius: 10,
                      width: double.infinity,
                      height: 55,
                      onPressed: () {})

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
