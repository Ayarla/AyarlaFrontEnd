import 'package:ayarla/models/employeeAndService.dart';
import 'package:ayarla/screens/coiffure_detail_page/EmployeeRow.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/constants/constants.dart';


class MenuItemData2 {
  String label;

  MenuItemData2({this.label});
}

class MenuSection2 extends StatefulWidget {
  final Widget title;
  final Color backgroundColor;
  final Color accentColor;
  final List menuOptions;
  final int serviceIndex;

  MenuSection2({
    this.title,
    this.backgroundColor,
    this.accentColor,
    this.menuOptions,
    this.serviceIndex,
  });

  @override
  State<StatefulWidget> createState() => _SectionState();
}

class _SectionState extends State<MenuSection2>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  static final Animatable<double> _sizeTween = Tween<double>(
    begin: 0.0,
    end: 1.0,
  );

  Animation<double> _sizeAnimation;

  /// returns the index of the service
  int findIndex(ServiceModel x) {
    print(Provider.of<AppointmentData>(context, listen: false)
        .fullTimeServices
        .indexOf(x));
    return Provider.of<AppointmentData>(context, listen: false)
        .fullTimeServices
        .indexOf(x);
  }

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    /// This curve is controlled by [_controller].
    final CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    /// [_sizeAnimation] will interpolate using this curve - [Curves.fastOutSlowIn].
    _sizeAnimation = _sizeTween.animate(curve);
    _controller.addListener(() {});


  }
  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Whenever a tap is detected, toggle a change in the state and move the
  /// animation forward or backwards depending on the initial status.
  _toggleExpand() {
    setState(() {
      if(Provider.of<AppointmentData>(context, listen: true)
          .fullTimeServices[widget.serviceIndex].selected==true ){
        _controller.forward();
      }else{
        _controller.reverse();
      }
    });
  }

  bool isSelected = false;
  // ignore:missing_return
  Icon buttonBehavior(bool isSelected) {
    if (isSelected == true) {
      return Icon(
        Icons.remove_circle_outline,
        size: 30,
        color: Colors.white,
      );
    } else if (isSelected == false) {
      return Icon(
        Icons.add_circle_outline,
        size: 30,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _toggleExpand();
    final size = MediaQuery.of(context).size;
    return Center(
      child: Card(
        shape: roundedShape,
        elevation: 5,
        child: Container(
            // do not use height here.
            // height: 50,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  children: <Widget>[
                    Column(children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [widget.title],
                      ),
                      SizeTransition(
                        axisAlignment: 0.0,
                        axis: Axis.vertical,
                        sizeFactor: _sizeAnimation,
                        child: Container(
                          height: 90,
                          child: Row(
                            children: [
                              Icon(Icons.keyboard_arrow_left),
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (BuildContext bc, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:4.0),
                                      child: Container(
                                        width: 100,
                                        child: GenericIconButton(
                                          color:Provider.of<AppointmentData>(context,
                                              listen: true).fullTimeServices[widget.serviceIndex].employees[index].selected?
                                              Colors.green:null,
                                          iconContext: Container(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image(
                                                    height: 40,
                                                    image: AssetImage(
                                                      Provider.of<AppointmentData>(
                                                              context,
                                                              listen: true)
                                                          .employeesList[index]
                                                          .image,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          text: Provider.of<AppointmentData>(context,
                                                  listen: true)
                                              .employeesList[index]
                                              .name,
                                          onPressed: () {
                                            setState(() {
                                              Provider.of<AppointmentData>(context,
                                                  listen: false).changeSelectedEmployee(widget.serviceIndex, index);
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_right),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ],
                ))),
      ),
    );
  }
}
