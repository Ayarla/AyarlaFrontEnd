import 'package:ayarla/components/UI/menuItemv2.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/employeeAndService.dart';
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
      children: [
        Text('Hizmetler', style: kTitleStyle),
        for (ServiceModel x
            in Provider.of<AppointmentData>(context, listen: false)
                .fullTimeServices)
          MenuSection2(
            title: Container(
              width: size.width / 1.1,
              height: 80,
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
                  IconButton(
                    icon: Provider.of<AppointmentData>(context, listen: true)
                            .fullTimeServices[findIndex(x)]
                            .selected
                        ? Icon(Icons.remove,size:25)
                        : Icon(Icons.add,size:25),
                    onPressed: (){
                      Provider.of<AppointmentData>(
                        context,
                        listen: false)
                        .changeSelectedService(findIndex(x));

                      },
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            accentColor: Colors.white,
            backgroundColor: Colors.white,
            serviceIndex: Provider.of<AppointmentData>(context, listen: true)
                .fullTimeServices
                .indexOf(x),
          ),
      ],
    );
  }
}
