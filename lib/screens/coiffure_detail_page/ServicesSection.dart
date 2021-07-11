import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/textOverFlowHandler.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_service.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
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
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hizmetler',
          style: kTitleStyle.copyWith(fontSize: width <= 400 ? width / 20 : 20),
        ),
        SizedBox(height: 10),
        for (ServiceModel x
            in Provider.of<AppointmentData>(context, listen: false)
                .fullTimeServices)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Expandable(
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                Provider.of<AppointmentData>(context, listen: false)
                    .changeSelectedService(findIndex(x));
                FirebaseAnalytics().logEvent(
                    name: 'service_expandable',
                    parameters: {
                      'name': x.name,
                      'state': x.selected ? 'opened' : 'closed'
                    });
              },
              elevation: 5,
              primaryWidget: Container(
                width: width - 90,
                height: 60,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(x.name,
                        overflow: TextOverflow.ellipsis,
                        style: kTextStyle.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: width <= 400 ? width / 20 : 20)),
                    Spacer(),
                    Text(x.price.toString(),
                        style: kTextStyle.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: width <= 400 ? width / 20 : 20)),
                    Text(" ₺",
                        style: TextStyle(
                            fontSize: width <= 400 ? width / 20 : 20)),
                    SizedBox(width: 10),
                    Icon(
                      Provider.of<AppointmentData>(context, listen: false)
                              .fullTimeServices[findIndex(x)]
                              .selected
                          ? Icons.remove
                          : Icons.add,
                      size: width <= 400 ? width / 16.6 : 24,
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              secondaryWidget: Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext bc, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        width: 120,
                        child: GenericIconButton(
                          color: Provider.of<AppointmentData>(context,
                                      listen: false)
                                  .fullTimeServices[
                                      Provider.of<AppointmentData>(context,
                                              listen: false)
                                          .fullTimeServices
                                          .indexOf(x)]
                                  .employees[index]
                                  .selected
                              ? Provider.of<AppointmentData>(context,
                                              listen: false)
                                          .fullTimeServices[
                                              Provider.of<AppointmentData>(
                                                      context,
                                                      listen: false)
                                                  .fullTimeServices
                                                  .indexOf(x)]
                                          .employees[index]
                                          .gender ==
                                      'female'
                                  ? Colors.pink[200]
                                  : Colors.blue
                              : null,
                          iconContext: Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    height: 40,
                                    image: AssetImage(
                                      Provider.of<AppointmentData>(context,
                                              listen: false)
                                          .employeesList[index]
                                          .image,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          textStyle: kTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: width <= 400 ? width / 30 : 14),
                          text: Provider.of<AppointmentData>(context,
                                  listen: false)
                              .employeesList[index]
                              .name,
                          onPressed: () {
                            setState(() {
                              Provider.of<AppointmentData>(context,
                                      listen: false)
                                  .changeSelectedEmployee(
                                      Provider.of<AppointmentData>(context,
                                              listen: false)
                                          .fullTimeServices
                                          .indexOf(x),
                                      index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
      ],
    );
  }
}
