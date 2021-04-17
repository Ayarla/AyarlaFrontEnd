import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/models/employeeAndService.dart';
import 'package:ayarla/screens/coiffure_detail_page/EmployeeRow.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/virtual_data_base/genderSelection.dart';

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
  bool _isExpanded = false;

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
    _controller.addListener(() {
      setState(() {});
    });
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
      _isExpanded = !_isExpanded;
    });
    switch (_sizeAnimation.status) {
      case AnimationStatus.completed:
        _controller.reverse();
        break;
      case AnimationStatus.dismissed:
        _controller.forward();
        break;
      case AnimationStatus.reverse:
      case AnimationStatus.forward:
        break;
    }
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
    final size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          _toggleExpand();
          if (isSelected == false) {
            isSelected = true;
          } else
            isSelected = false;
        },
        child: Center(
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
                              height: 80,
                              // child: ListView.builder(
                              //   scrollDirection: Axis.horizontal,
                              //   itemCount: 5,
                              //   itemBuilder: (BuildContext bc, int index) {
                              //     return GenericIconButton(
                              //       iconContext: Container(
                              //         padding: EdgeInsets.only(top: 5),
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             ClipRRect(
                              //               borderRadius:
                              //                   BorderRadius.circular(10),
                              //               child: Image(
                              //                 height: 40,
                              //                 image: AssetImage(
                              //                   Provider.of<AppointmentData>(
                              //                           context,
                              //                           listen: true)
                              //                       .employeesList[index]
                              //                       .image,
                              //                 ),
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       text: Provider.of<AppointmentData>(context,
                              //               listen: true)
                              //           .employeesList[index]
                              //           .name,
                              //       onPressed: () {
                              //         setState(() {});
                              //       },
                              //     );
                              //   },
                              // ),
                              child: EmployeeRow(
                                  size: MediaQuery.of(context).size),
                            ),
                          ),
                        ]),
                      ],
                    ))),
          ),
        ));
  }
}
