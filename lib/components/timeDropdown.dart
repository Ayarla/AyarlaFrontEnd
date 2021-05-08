import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

class TimeDropdown extends StatefulWidget {
  ///initial value
  String selected;
  ///items farklı içerikler lazım olursa constructor'a eklenir

  TimeDropdown({this.selected});

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
      items: items,
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
