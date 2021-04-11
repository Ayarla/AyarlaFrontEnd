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
    @required this.leftArrow,
  }) : super(key: key);

  final Size size;
  final bool leftArrow;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OverScroll(
        child: Row(
          children: [
            Icon(Icons.keyboard_arrow_left),
            SizedBox(width: 10),
            Container(
              height: 100,
              width: size.width / 1.3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (EmployeeModel x
                      in Provider.of<AppointmentData>(context, listen: true)
                          .employeesList)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: GenericIconButton(
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
            Spacer(),
            Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    );
  }
}
