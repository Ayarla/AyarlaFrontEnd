import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

class TimeDropdown extends StatefulWidget {
  ///initial value
  String selected;
  bool isHour;
  ///items farklı içerikler lazım olursa constructor'a eklenir

  // TimeDropdown({this.selected});
  List<String> itemsHour = <String>[
    '00:00',
    '00:30',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
  ];
  List<String> itemsMinute = <String>[
    '0','5','10','15','20','25','30','35','40','45','50','55','60'
  ];
  TimeDropdown({this.selected,this.isHour=true});

  @override
  _TimeDropdownState createState() => _TimeDropdownState();
}

class _TimeDropdownState extends State<TimeDropdown> {


  @override
  Widget build(BuildContext context) {
    return  MenuButton<String>(
      scrollPhysics: AlwaysScrollableScrollPhysics(),
      popupHeight: 200,
      child: SizedBox(
        width: 93,
        height: 40,
        child: Padding(
          padding:
          const EdgeInsets.only(left: 16, right: 11),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                  child: Text(widget.selected,
                      overflow: TextOverflow.ellipsis)),
              const SizedBox(
                width: 12,
                height: 17,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      items:widget.isHour?widget.itemsHour:widget.itemsMinute,
      // items: items,
      itemBuilder: (String value) => Container(
        height: 40,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(
            vertical: 0.0, horizontal: 16),
        child: Text(value),
      ),
      toggledChild: Container(
        child: SizedBox(
          width: 93,
          height: 40,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 16, right: 11),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                    child: Text(widget.selected,
                        overflow: TextOverflow.ellipsis)),
                const SizedBox(
                  width: 12,
                  height: 17,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onItemSelected: (String value) {
        setState(() {
         widget.selected = value;
        });
      },
      ///onMenuButtonToggle fonksiyonunu kaldırma
      onMenuButtonToggle: (bool isToggle) {

      },
    );
  }
}
