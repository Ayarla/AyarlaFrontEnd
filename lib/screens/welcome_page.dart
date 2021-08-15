import 'package:ayarla/api_services/ayarla_account_api_services.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/services/service_appointment.dart';
import 'package:ayarla/services/service_gender.dart';
import 'package:ayarla/services/service_login.dart';
import 'package:ayarla/api_services/api_services.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  AyarlaAccountApiServices ayarlaAccountApiServices = AyarlaAccountApiServices();

  getAllAccounts() async {
    List localList;
    await ApiServices().getToken();

    try {
      localList = await ayarlaAccountApiServices.getAllAyarlaAccount();
      print(localList.length);

      for (int i = 0; i < localList.length; i++) {
        Provider.of<AppointmentService>(context, listen: false).currentList.add(
              CoiffureModel.fromJson({
                "address": localList[i]['address'],
                "gender": localList[i]['gender'],
                "commentNumber": localList[i]['commentNumber'],
                "accountNotes": localList[i]['accountNotes'],
                "openCloseTimes": localList[i]['openCloseTimes'],
                "phone1": localList[i]['phone1'],
                "id": localList[i]['id'],
                "meanRating": localList[i]['meanRating'],
                "city": localList[i]['city'],
                "district": localList[i]['district'],
                "accountName": localList[i]['accountName']
              }, i),
            );
      }
    } catch (e) {
      print(e);
    }

    for (CoiffureModel x in Provider.of<AppointmentService>(context, listen: false).currentList) {
      print("id: " + x.id + " kuafor adi: " + x.name);
    }
  }

  @override
  void initState() {
    getAllAccounts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: DefaultAppBar(
          title: UI.AppBarTitleCustomer(),
          color: Color(0xFF90a4ae).withOpacity(0.4),
          showBackButton: false,
        ).build(context),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xFF6CC4D7), Color(0xFFFEEDA8)]),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/YoneticiAnasayfasi");
                      Provider.of<LoginService>(context, listen: false).loggedInManager();
                    },
                    child: Text(
                      'Manager Girişi',
                      style: kTextStyle.copyWith(color: Colors.black, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                UI.generalLogo,
                SizedBox(height: 30),
                Text("Yeni Nesil, Akıllı Randevu Danışmanı",
                    textAlign: TextAlign.center, style: kTitleStyle),
                SizedBox(height: 15),
                AyarlaPage(
                  child: Expandable(
                    padding: EdgeInsets.all(0.0),
                    backgroundColor: Color(0xFF90a4ae).withOpacity(0.4),
                    showArrowIcon: true,
                    hoverOn: true,
                    arrowWidget: Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: Colors.white,
                      size: size.width <= 425 ? size.width / 20 : 25,
                    ),
                    primaryWidget: Container(
                      height: 80,
                      child: Center(
                        child: Text(
                          'Kuaför Randevumu Ayarla',
                          style: kTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: size.width <= 425 ? size.width / 20 : 25,
                            backgroundColor: Color(0xFF90a4ae).withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),
                    secondaryWidget: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            ),
                            onPressed: () {
                              Provider.of<GenderService>(context, listen: false)
                                  .selectGender(Gender.female);
                              Navigator.pushNamed(context, '/AramaSayfasi');
                              FirebaseAnalytics().logEvent(name: 'female_button', parameters: null);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Kadın',
                                  softWrap: true,
                                  style: kTextStyle.copyWith(color: Colors.white),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.arrow_right_rounded,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(height: 5),
                          TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                            ),
                            onPressed: () {
                              Provider.of<GenderService>(context, listen: false)
                                  .selectGender(Gender.male);
                              Navigator.pushNamed(context, '/AramaSayfasi');
                              FirebaseAnalytics().logEvent(name: 'male_button', parameters: null);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Erkek',
                                  softWrap: true,
                                  style: kTextStyle.copyWith(color: Colors.white),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.arrow_right_rounded,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(height: 5),
                          TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                            ),
                            onPressed: () {
                              Provider.of<GenderService>(context, listen: false)
                                  .selectGender(Gender.unisex);
                              Navigator.pushNamed(context, '/AramaSayfasi');
                              FirebaseAnalytics().logEvent(name: 'unisex_button', parameters: null);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Unisex',
                                  softWrap: true,
                                  style: kTextStyle.copyWith(color: Colors.white),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.arrow_right_rounded,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    backgroundImage: DecorationImage(
                      image: AssetImage('assets/new/cfr2.png'),
                      repeat: ImageRepeat.repeatX,
                      scale: 1.4,
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
