import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'calender_page.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/coiffeurModel.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/components/coiffure_detail_card.dart';

class CoiffureDetailPage extends StatelessWidget {
  final CoiffureModel coiffureModel;
  final String name;
  CoiffureDetailPage({this.coiffureModel, this.name});

  @override
  Widget build(BuildContext context) {
    int total = Provider.of<AppointmentData>(context, listen: true).total;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(
        showIconButton: true,
        gradient: Functions().decideColor(context),
        title: Container(
          height: 30,
          width: double.infinity,
          child: Functions().titleLength(
              inputName: coiffureModel.name,
              textStyle: kTitleStyle.copyWith(color: Colors.white),
              ctrlLength: 20),
        ),
      ).build(context),
      body: CoiffureDetailCard(
        coiffureModel: coiffureModel,
      ),
      floatingActionButton: total != 0
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Container(
                    height: MediaQuery.of(context).size.width / 7.5,
                    width: MediaQuery.of(context).size.width -
                        3 * (MediaQuery.of(context).size.width / 6),
                    decoration: BoxDecoration(
                      gradient: Functions().decideColor(context),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: FloatingActionButton(
                      onPressed: null,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width -
                            3 * (MediaQuery.of(context).size.width / 5.7),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Row(
                            children: [
                              Text(
                                "Ara Toplam = $total",
                                style: kTextStyle.copyWith(color: Colors.white),
                              ),
                              Text(
                                "₺",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      heroTag: null,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: MediaQuery.of(context).size.width / 7.5,
                  decoration: BoxDecoration(
                    gradient: Functions().decideColor(context),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: MediaQuery.of(context).size.width / 3,
                  child: FloatingActionButton.extended(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    highlightElevation: 0,
                    label: Container(
                      width: MediaQuery.of(context).size.width -
                          4 * (MediaQuery.of(context).size.width / 5.7),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "Saati Belirle",
                          style: kTextStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await Provider.of<AppointmentData>(context, listen: false)
                          .getServicesWithEmployee();

                      // Navigator.pushNamed(context, ConfirmationPage.id);
                      showModalBottomSheet(
                        enableDrag: false,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return CalenderPage(
                              servicesAndEmployees:
                                  Provider.of<AppointmentData>(context,
                                          listen: true)
                                      .servicesAndEmployees);
                        },
                      );
                    },
                    heroTag: null,
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
