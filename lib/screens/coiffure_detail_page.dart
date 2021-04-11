import 'package:ayarla/components/floatingButton.dart';
import 'package:ayarla/components/textOverFlowHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
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
        gradient: Functions().decideColor(context),
        title: TextOverFlowHandler(
          child: Text(coiffureModel.name,
              style: kTitleStyle.copyWith(color: Colors.white)),
        ),
      ).build(context),
      body: CoiffureDetailCard(coiffureModel: coiffureModel),
      floatingActionButton: total != 0
          ? Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingButton(
                  gradient: Functions().decideColor(context),
                  text: "Ara Toplam = $total",
                ),
                Spacer(),
                FloatingButton(
                  text: "Saati Belirle",
                  gradient: Functions().decideColor(context),
                ),
              ],
            )
          : null,
    );
  }
}
