import 'package:ayarla/components/core/expandable_ayarla.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/employeeAndService.dart';
import 'package:ayarla/screens/coiffure_detail_page/EmployeeRow.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicesSection extends StatefulWidget {
  @override
  _ServicesSectionState createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  /// returns the index of the service
  int findIndex(ServiceModel x) {
    return Provider.of<AppointmentData>(context, listen: false)
        .fullTimeServices
        .indexOf(x);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hizmetler', style: kTitleStyle),
        for (ServiceModel x
            in Provider.of<AppointmentData>(context, listen: false)
                .fullTimeServices)
          AyarlaExpandable(
            onPressed: () {
              Provider.of<AppointmentData>(context, listen: false)
                  .changeSelectedService(findIndex(x));
            },
            elevation: 5,
            primaryWidget: Container(
              width: size.width - 100,
              height: 60,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text(x.name,
                      style:
                          kTextStyle.copyWith(fontWeight: FontWeight.normal)),
                  Spacer(),
                  Text(x.price.toString(),
                      style:
                          kTextStyle.copyWith(fontWeight: FontWeight.normal)),
                  Text(" ₺", style: TextStyle(fontSize: 20)),
                  SizedBox(width: 10),
                  Icon(
                    Provider.of<AppointmentData>(context, listen: true)
                            .fullTimeServices[findIndex(x)]
                            .selected
                        ? Icons.remove
                        : Icons.add,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            secondaryWidget: Center(
              child: EmployeeRow(
                width: size.width < 700 ? size.width - 85 : 699,
              ),
            ),
            // secondaryWidget: ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: 5,
            //   itemBuilder: (BuildContext bc, int index) {
            //     return Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 4.0),
            //       child: Container(
            //         width: 100,
            //         child: GenericIconButton(
            //           color:
            //               // Provider.of<AppointmentData>(context, listen: true)
            //               //         .fullTimeServices[
            //               //             Provider.of<AppointmentData>(context,
            //               //                     listen: true)
            //               //                 .fullTimeServices
            //               //                 .indexOf(x)]
            //               // x.employees[index].selected ? Colors.green : null,
            //           Colors.green,
            //           iconContext: Container(
            //             padding: EdgeInsets.only(top: 5),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 ClipRRect(
            //                   borderRadius: BorderRadius.circular(10),
            //                   child: Image(
            //                     height: 40,
            //                     image: AssetImage(
            //                       Provider.of<AppointmentData>(context,
            //                               listen: true)
            //                           .employeesList[index]
            //                           .image,
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           text:
            //               Provider.of<AppointmentData>(context, listen: true)
            //                   .employeesList[index]
            //                   .name,
            //           onPressed: () {
            //             setState(() {
            //               // Provider.of<AppointmentData>(context, listen: false)
            //               //     .changeSelectedEmployee(
            //               //         Provider.of<AppointmentData>(context,
            //               //                 listen: true)
            //               //             .fullTimeServices
            //               //             .indexOf(x),
            //               //         index);
            //             });
            //           },
            //         ),
            //       ),
            //     );
            //   },
            // ),
          )
      ],
    );
  }
}
