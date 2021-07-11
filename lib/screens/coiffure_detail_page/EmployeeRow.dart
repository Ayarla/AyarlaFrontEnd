import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverScroll(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.keyboard_arrow_left),
          Expanded(
            child: Container(
              height: 100,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  for (EmployeeModel employeeModel
                      in Provider.of<AppointmentData>(context, listen: false)
                          .employeesList)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: GenericIconButton(
                        color: Colors.white,
                        width: 150,
                        iconContext: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            height: 40,
                            image: AssetImage(employeeModel.image),
                          ),
                        ),
                        text: employeeModel.name,
                        textStyle:
                            kSmallTextStyle.copyWith(color: Colors.black),
                        spaceBetween: 15,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }
}
