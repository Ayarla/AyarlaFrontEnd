import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/services/service_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

privacyPolicyModalBottomSheet({BuildContext context, StateSetter setState}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    child: Container(
      height: 600,
      child: Column(
        children: <Widget>[
          Text('Ayarla Gizlilik Sözleşmesi', style: kTitleStyle),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                Text('Ayarla Gizlilik Sözleşmesi', style: kSmallTextStyle),
              ],
            ),
          ),
          Row(
            children: [
              GenericIconButton(
                height: 75,
                width: 140,
                text: 'hayır',
                onPressed: () {
                  setState(() {
                    Provider.of<UserService>(context, listen: false).checkBox = false;
                  });
                  Navigator.pop(context);
                },
                iconContext: Icon(Icons.cancel_outlined, size: 30, color: Colors.red),
              ),
              Spacer(),
              GenericIconButton(
                axis: Axis.horizontal,
                height: 75,
                width: 156,
                iconContext: Icon(Icons.check, size: 30, color: Colors.green),
                text: 'Onaylıyorum',
                onPressed: () {
                  setState(() {
                    Provider.of<UserService>(context, listen: false).checkBox = true;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    ),

    // floatingActionButton: Padding(
    //   padding: EdgeInsets.only(left: 32.0),
    //   child: Row(
    //     children: <Widget>[
    //       Container(
    //         decoration: BoxDecoration(
    //           gradient: functions.decideColor(context),
    //           borderRadius: BorderRadius.circular(15),
    //         ),
    //         child: FloatingActionButton.extended(
    //           elevation: 0,
    //           backgroundColor: Colors.transparent,
    //           onPressed: () {
    //             setState(() {
    //               Provider.of<BusinessAndUserData>(context, listen: false)
    //                   .checkBox = false;
    //             });
    //
    //             Navigator.pop(context);
    //           },
    //           label: FittedBox(
    //             fit: BoxFit.cover,
    //             child: Icon(
    //               Icons.cancel_outlined,
    //               size: 40,
    //             ),
    //           ),
    //         ),
    //       ),
    //       Spacer(),
    //       Container(
    //         decoration: BoxDecoration(
    //           gradient: functions.decideColor(context),
    //           borderRadius: BorderRadius.circular(15),
    //         ),
    //         child: FloatingActionButton.extended(
    //           elevation: 0,
    //           backgroundColor: Colors.transparent,
    //           onPressed: () {
    //             setState(() {
    //               Provider.of<BusinessAndUserData>(context, listen: false)
    //                   .checkBox = true;
    //             });
    //             Navigator.pop(context);
    //           },
    //           label: FittedBox(
    //             fit: BoxFit.cover,
    //             child: Icon(
    //               Icons.check,
    //               size: 40,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
  );
}
