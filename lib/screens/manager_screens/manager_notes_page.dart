import 'package:ayarla/components/ayarla_page.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/screens/manager_screens/manager_notes.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';

class ManagerNotesPage extends StatefulWidget {
  @override
  _ManagerNotesPageState createState() => _ManagerNotesPageState();
}

class _ManagerNotesPageState extends State<ManagerNotesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      body: AyarlaPage(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: ListView(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Expandable(
                  padding: EdgeInsets.all(5.0),
                  primaryWidget: NotesCard(
                    title: 'Not ekle',
                    icon: Icons.add,
                    onTap: () {
                      // Navigator.pushNamed(context, ManagerNotes.id)
                      //     .then((value) => setState(() {}));
                    },
                    isGuide: true,
                  ),
                  secondaryWidget: Container(
                    color: Colors.grey.shade200,
                    height: 100,
                    child: TextFormField(
                      style: kSmallTextStyle,
                      // initialValue: noteContent,
                      onChanged: (value) {
                        // noteContent = value;
                      },
                      keyboardType: TextInputType.multiline,
                      autofocus: false,
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
              ),
              for (Notes note
                  in Provider.of<AppointmentData>(context, listen: true)
                      .managerNotes)
                NotesCard(
                  title: note.notes,
                  icon: Icons.chevron_right,
                  onTap: () {
                    /// TODO - fix
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
        ),
      ),
    );
  }
}

class NotesCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  final bool isGuide;
  int index;

  NotesCard({
    @required this.title,
    @required this.icon,
    @required this.onTap,
    this.index,
    @required this.isGuide,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            title,
            style: kTextStyle.copyWith(fontWeight: FontWeight.normal),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Spacer(),
        Icon(
          icon,
          size: 30,
          color: Colors.grey.shade500,
        ),
      ],
    );
  }
}
