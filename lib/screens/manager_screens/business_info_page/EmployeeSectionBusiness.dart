import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:flutter/material.dart';

class EmployeeSectionBusiness extends StatefulWidget {
  @override
  _EmployeeSectionBusinessState createState() => _EmployeeSectionBusinessState();
}

class _EmployeeSectionBusinessState extends State<EmployeeSectionBusiness> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ScrollController _scrollControllerServices = ScrollController();
    return Stack(children: [
      Container(
        height: size.width / 5.3,
        child: ListView.builder(
            itemCount: employeesList.length,
            scrollDirection: Axis.horizontal,
            controller: _scrollControllerServices,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                      child: Container(
                        width: 90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                height: size.height / 20,
                                image: AssetImage(employeesList[index].image),
                              ),
                            ),
                            Spacer(),
                            FittedBox(
                                child: Text(
                                  employeesList[index].name,
                                  style: kSmallTextStyle.copyWith(color: Colors.black),
                                ),
                                fit: BoxFit.cover)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: -12,
                      right: 5,
                      child: IconButton(icon: Icon(Icons.remove_circle, color: Colors.red)))
                ],
              );
            }),
      ),
      Positioned(right: 0, top: 10, child: Icon(Icons.keyboard_arrow_left))
    ]);
  }
}
