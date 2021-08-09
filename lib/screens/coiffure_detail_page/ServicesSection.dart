import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicesSection extends StatefulWidget {
  @override
  _ServicesSectionState createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  List<ServiceModel> serviceList = [];
  List<EmployeeModel> employeeList = [EmployeeModel()];

  /// returns the index of the service
  int findIndex(ServiceModel x) => fullTimeServices.indexOf(x);

  @override
  void initState() {
    Provider.of<AppointmentData>(context, listen: false).serviceList.clear();
    Provider.of<AppointmentData>(context, listen: false).employeeList.clear();
    super.initState();
  }

  /// TODO - test everything.
  @override
  Widget build(BuildContext context) {
    // print(Provider.of<AppointmentData>(context, listen: false).employeeList);
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hizmetler',
          style: kTitleStyle.copyWith(fontSize: width <= 400 ? width / 20 : 20),
        ),
        SizedBox(height: 10),
        for (ServiceModel serviceModel in fullTimeServices)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Expandable(
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                if (!serviceList.contains(serviceModel)) {
                  serviceList.add(serviceModel);
                } else if (serviceList.contains(serviceModel)) {
                  for (int i = 0; i < serviceModel.employees.length; i++) {
                    setState(() {
                      serviceModel.employees[i].selected = false;
                    });
                  }
                  Provider.of<AppointmentData>(context, listen: false)
                      .employeeList
                      .removeAt(serviceList.indexOf(serviceModel));
                  serviceList.remove(serviceModel);
                }
                Provider.of<AppointmentData>(context, listen: false).serviceList = serviceList;
                Provider.of<AppointmentData>(context, listen: false).priceHandler();
                FirebaseAnalytics().logEvent(name: 'service_expandable', parameters: {
                  'name': serviceModel.name,
                  'state': serviceModel.selected ? 'opened' : 'closed'
                });
              },
              elevation: 5,
              primaryWidget: Container(
                width: width - 90,
                height: 60,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(serviceModel.name,
                        overflow: TextOverflow.ellipsis,
                        style: kTextStyle.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: width <= 400 ? width / 20 : 20)),
                    Spacer(),
                    Text(serviceModel.price.toString(),
                        style: kTextStyle.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: width <= 400 ? width / 20 : 20)),
                    Text(" ₺", style: TextStyle(fontSize: width <= 400 ? width / 20 : 20)),
                    SizedBox(width: 10),
                    Icon(
                      serviceList.contains(serviceModel) ? Icons.remove : Icons.add,
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
                              color: serviceList.contains(serviceModel) &&
                                      serviceModel.employees[index].selected
                                  ? serviceModel.employees[index].gender == 'female'
                                      ? Colors.pink[200]
                                      : Colors.blue[400]
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
                                          image: AssetImage(employeesList[index].image)),
                                    ),
                                  ],
                                ),
                              ),
                              textStyle: kTextStyle.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: width <= 400 ? width / 30 : 14),
                              text: employeesList[index].name,
                              onPressed: () {
                                for (EmployeeModel x in serviceModel.employees) {
                                  x.selected = false;
                                }
                                serviceModel.employees[index].selected =
                                    !serviceModel.employees[index].selected;
                                setState(() {});
                                employeeList.add(EmployeeModel());
                                employeeList[serviceList.indexOf(serviceModel)] =
                                    employeesList[index];
                                List holder =
                                    employeeList.where((element) => element.name != null).toList();
                                holder.length = serviceList.length;
                                Provider.of<AppointmentData>(context, listen: false).employeeList =
                                    holder;
                              }),
                        ),
                      );
                    }),
              ),
            ),
          ),
      ],
    );
  }
}
