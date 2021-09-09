import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

class TimeDropdown extends StatelessWidget {
  String defaultValue;
  final List<String> timeList;
  final Function onItemSelected;

  TimeDropdown({
    this.defaultValue,
    this.timeList,
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return MenuButton<String>(
      selectedItem: defaultValue,
      itemBackgroundColor: Colors.transparent,
      menuButtonBackgroundColor: Colors.transparent,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      scrollPhysics: AlwaysScrollableScrollPhysics(),
      popupHeight: 200,
      child: SizedBox(
        width: 93,
        height: 40,
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(child: Text(defaultValue ?? '00.00', overflow: TextOverflow.ellipsis)),
              SizedBox(
                width: 12,
                height: 17,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(Icons.arrow_drop_down, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
      items: timeList,
      itemBuilder: (value) => Container(
        height: 40,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
        child: Text(value),
      ),
      toggledChild: Container(
        child: SizedBox(
          width: 93,
          height: 40,
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(child: Text(defaultValue ?? '00.00', overflow: TextOverflow.ellipsis)),
                SizedBox(
                  width: 12,
                  height: 17,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(Icons.arrow_drop_down, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onItemSelected: (value) => onItemSelected(value),

      ///onMenuButtonToggle fonksiyonunu kaldırma
      onMenuButtonToggle: (bool isToggle) {},
    );
  }
}
