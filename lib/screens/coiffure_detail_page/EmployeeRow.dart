import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeRow extends StatelessWidget {
  final double width;
  final int serviceIndex;
  EmployeeRow({@required this.width,@required this.serviceIndex});

  @override
  Widget build(BuildContext context) {
    /// returns the index of the employee
    int findIndex(EmployeeModel x) {
      return Provider.of<AppointmentData>(context, listen: false)
          .fullTimeServices[serviceIndex].employees
          .indexOf(x);
    }
    return
      serviceIndex != null ?
      Center(
      child: OverScroll(
        child: Container(
          width: width < 700 ? width : 700,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.keyboard_arrow_left),
              Container(
                height: 100,
                width: width < 700 ? width - 100 : 600,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (EmployeeModel x
                        in Provider.of<AppointmentData>(context, listen: false)
                            .fullTimeServices[serviceIndex].employees)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: GenericIconButton(
                          onPressed: (){
                            Provider.of<AppointmentData>(context, listen: false)
                                .changeSelectedEmployee(serviceIndex,findIndex(x));
                          },
                          color: Provider.of<AppointmentData>(context, listen: true)
                              .fullTimeServices[serviceIndex].employees[findIndex(x)]
                              .selected?Colors.green:Colors.white,
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
    ) :
      Center(
        child: OverScroll(
          child: Container(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.keyboard_arrow_left),
                Container(
                  height: 100,
                  width: width / 1.3,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (EmployeeModel x
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
