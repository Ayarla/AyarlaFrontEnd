import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/employeeAndService.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeRow extends StatelessWidget {
  final double width;
  EmployeeRow({@required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OverScroll(
        child: Container(
          width: width < 700 ? width : 700,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.keyboard_arrow_left),
              Container(
                height: 100,
                width: width < 700 ? width - 85 : 640,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (EmployeeModel x
                        in Provider.of<AppointmentData>(context, listen: true)
                            .employeesList)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: GenericIconButton(
                          width: 150,
                          iconContext: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              height: 40,
                              image: AssetImage(x.image),
                            ),
                          ),
                          text: x.name,
                          textStyle:
                              kSmallTextStyle.copyWith(color: Colors.black),
                          spaceBetween: 15,
                        ),
                      ),
                  ],
                ),
              ),
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
