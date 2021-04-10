import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';

class EmployeeBoard extends StatelessWidget {
  final String service;
  final Function onTap;
  final String selectedEmployee;

  EmployeeBoard({this.service, this.selectedEmployee, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFE5EBEE),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  // border: Border.all(width: 2, color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          '$service',
                          textAlign: TextAlign.left,
                          style: kSmallTextStyle,
                        ),
                      ),
                      Spacer(),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          '$selectedEmployee',
                          textAlign: TextAlign.left,
                          style: kSmallTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 3.0, horizontal: 30.0),
            // child: EmployeeList().employeeList.circleAvatar,
          ),
        ],
      ),
    );
  }
}
