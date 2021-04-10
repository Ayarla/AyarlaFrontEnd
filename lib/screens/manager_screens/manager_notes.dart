import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';

class ManagerNotes extends StatelessWidget {
  static const String id = "ManagerNotes";
  final Functions functions = Functions();

  String noteContent;
  final int index;

  ManagerNotes({this.noteContent, this.index});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultAppBar(
        showIconButton: false,
        color: Colors.grey,
        childrenColor: Colors.white,
        title: Text(
          'Notlarım',
          style: kTitleStyle.copyWith(color: Colors.white),
        ),
        // showIconButton: false,
      ).build(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Container(
          height: size.height / 1.34,
          child: TextFormField(
            style: kSmallTextStyle,
            initialValue: noteContent,
            onChanged: (value) {
              noteContent = value;
            },
            keyboardType: TextInputType.multiline,
            autofocus: true,
            maxLines: 100,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              hintStyle: kSmallTextStyle,
              hintText: "Notunuzu yazınız...",
              fillColor: Colors.grey.shade200,
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: size.width / 7.5,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        width: size.width / 3,
        child: FloatingActionButton.extended(
          onPressed: () {
            if (index == null) {
              Provider.of<AppointmentData>(context, listen: false)
                  .managerNotes
                  .add(Notes(
                      notes: noteContent,
                      index:
                          Provider.of<AppointmentData>(context, listen: false)
                              .managerNotes
                              .length));
            } else {
              Provider.of<AppointmentData>(context, listen: false)
                  .managerNotes[index]
                  .notes = noteContent;
            }

            Navigator.pop(context);
          },
          heroTag: null,
          elevation: 0,
          backgroundColor: Colors.transparent,
          highlightElevation: 0,
          label: Container(
            width: size.width - 4 * (size.width / 5.7),
            child: Center(
              child: Text(
                "Kaydet",
                style: kTextStyle.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
