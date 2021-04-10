import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/screens/manager_screens/manager_notes.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';

class ManagerNotesPage extends StatefulWidget {
  static const String id = "ManagerNotesPage";

  @override
  _ManagerNotesPageState createState() => _ManagerNotesPageState();
}

class _ManagerNotesPageState extends State<ManagerNotesPage> {
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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                NotesCard(
                  size: size,
                  title: 'Not ekle',
                  icon: Icons.add,
                  onTap: () {
                    Navigator.pushNamed(context, ManagerNotes.id)
                        .then((value) => setState(() {}));
                  },
                  isGuide: true,
                ),
                for (Notes note
                    in Provider.of<AppointmentData>(context, listen: true)
                        .managerNotes)
                  NotesCard(
                    size: size,
                    title: note.notes,
                    icon: Icons.chevron_right,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManagerNotes(
                            noteContent: note.notes,
                            index: note.index,
                          ),
                        ),
                      ).then((value) => setState(() {}));
                    },
                    index: note.index,
                    isGuide: false,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotesCard extends StatelessWidget {
  final Size size;
  final String title;
  final IconData icon;
  final Function onTap;
  final bool isGuide;
  int index;

  NotesCard({
    @required this.title,
    @required this.size,
    @required this.icon,
    @required this.onTap,
    this.index,
    @required this.isGuide,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 10,
        child: Container(
          width: size.width,
          height: size.height / 10,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !isGuide
                    ? Container(
                        width: 23,
                        child: Text(
                          "${++index}",
                          style: kTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade500),
                        ),
                      )
                    : SizedBox(),
                !isGuide ? SizedBox(width: 10) : SizedBox(),
                Container(
                  width: size.width / 1.7,
                  child: title.length > 22
                      ? FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            title.length > 22
                                ? "${title.substring(0, 22)}..."
                                : title,
                            style: kTextStyle.copyWith(
                                fontWeight: FontWeight.normal),
                          ),
                        )
                      : Text(
                          title,
                          style: kTextStyle.copyWith(
                              fontWeight: FontWeight.normal),
                        ),
                ),
                Spacer(),
                Icon(
                  icon,
                  size: 30,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
