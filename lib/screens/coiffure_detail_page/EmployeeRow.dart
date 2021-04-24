import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/employeeAndService.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeRow extends StatelessWidget {
  const EmployeeRow({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OverScroll(
        child: Container(
          width: size.width,
          child: Row(
            children: [
              Icon(Icons.keyboard_arrow_left),
              SizedBox(width: size.width < 350 ? 2 : 8),
              Container(
                height: 100,
                width: size.width < 680
                    ? size.width - size.width / 4
                    : size.width - size.width / 6,
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
              size.width < 680 ? SizedBox(width: 0) : Spacer(),
              SizedBox(width: size.width < 350 ? 2 : 8),
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
