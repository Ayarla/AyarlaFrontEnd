import 'package:ayarla/components/calendar/calendar.dart';
import 'package:ayarla/constants/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/Appointment.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/screens/confirmation_page.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';

class CalenderPage extends StatefulWidget {
  List servicesAndEmployees;
  CalenderPage({this.servicesAndEmployees});
  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  ///we used for color
  Functions functions = Functions();

  ///calender
  DateTime now = DateTime.now();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 14));
  DateTime selectedDate;

  ///calender strip package
  onSelect(data) {
    Provider.of<AppointmentData>(context, listen: false).getAvailableData(data);
    setState(() {
      selectedDate = data;
      for (AppointmentInfo x in Provider.of<AppointmentData>(context, listen: false).servicesAndEmployees) {
        x.dateTime = selectedDate;
      }
      widget.servicesAndEmployees = Provider.of<AppointmentData>(context, listen: false).servicesAndEmployees;
    });
    Provider.of<AppointmentData>(context, listen: false).getAvailableData(data);
  }

  ///DON`T DELETE onWeekSelected OTHERWISE STATE WON`T CHANGE!! (CHANGING WEEK BY PRESSING RIGHT OR LEFT BUTTON)
  onWeekSelected(data) {}

  ///calender strip package, in date timeline this print month and year section
  _monthNameWidget(monthName) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text(
          monthName,
          style: kTextStyle.copyWith(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),
      padding: EdgeInsets.only(top: 8, bottom: 0),
    );
  }

  ///calender strip packages, builds date timeline
  dateTileBuilder(date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;

    Color fontColor = isDateOutOfRange ? Colors.grey.shade400 : Colors.white;
    TextStyle normalStyle = kTextStyle.copyWith(fontWeight: FontWeight.normal, color: fontColor);
    TextStyle selectedStyle = kTextStyle.copyWith(fontWeight: FontWeight.bold, color: Colors.white);
    TextStyle dayNameStyle = kTextStyle.copyWith(color: fontColor);

    List<Widget> _children = [
      FittedBox(fit: BoxFit.cover, child: Text(dayName, style: dayNameStyle)),
      FittedBox(
        fit: BoxFit.cover,
        child: Text(date.day.toString(), style: !isSelectedDate ? normalStyle : selectedStyle),
      ),
    ];
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.7,
          color: !isSelectedDate ? Colors.transparent : Colors.white70,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  ///builds available time selection section
  Container buildTimeButton({String time, bool selected, int whichService, int index}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 5.0),
      decoration: BoxDecoration(
        color: selected ? Colors.green : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: FlatButton(
        splashColor: Colors.transparent,
        onPressed: () {
          setState(() {
            for (int i = 0; i < 8; i++) {
              if (index == i) {
                if (widget.servicesAndEmployees[whichService].availability[i].selected == false) {
                  widget.servicesAndEmployees[whichService].availability[i].selected = true;
                } else {
                  widget.servicesAndEmployees[whichService].availability[i].selected = false;
                }
              } else {
                widget.servicesAndEmployees[whichService].availability[i].selected = false;
              }

              if (widget.servicesAndEmployees[whichService].availability[i].selected == true) {
                Provider.of<AppointmentData>(context, listen: false).servicesAndEmployees[whichService].time =
                    widget.servicesAndEmployees[whichService].availability[i].time;
              }
            }
          });
        },
        child: FittedBox(
          fit: BoxFit.cover,
          child: Text(
            time,
            style: kSmallTextStyle.copyWith(
              color: selected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  ///builds time selection section
  Column servicesAndDates(String serviceName, int whichService, String employeeName) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),

          /// Fitted in order to avoid overflow with long names.
          child: FittedBox(
            fit: BoxFit.cover,
            child: Row(
              children: <Widget>[
                Text(
                  '$serviceName: ',
                  style: kTextStyle.copyWith(fontSize: 16),
                ),
                Text(
                  '$employeeName',
                  style: kSmallTextStyle.copyWith(fontSize: 15.0, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Container(
            height: size.height / 4.3,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: size.width * 1.5,
                  child: GridView.count(
                    /// setting the buildTimeButton width
                    childAspectRatio: size.aspectRatio * 3.7,

                    /// DON`T DELETE
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    children: List.generate(8, (index) {
                      return FittedBox(
                        fit: BoxFit.fitWidth,
                        child: buildTimeButton(
                          time: widget.servicesAndEmployees[whichService].availability[index].time,
                          selected: widget.servicesAndEmployees[whichService].availability[index].selected,
                          whichService: whichService,
                          index: index,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),

        /// added -F
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height - size.height / 10,
      alignment: Alignment.center,
      child: Scaffold(
        backgroundColor: Color(0xFFE5EBEE),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 18.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Gün Seçin',
                      style: kSmallTitleStyle,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0, top: 12),

                      ///Calender Strip Packages
                      child: CalendarStrip(
                        containerHeight: size.width / 3.3,
                        addSwipeGesture: true,
                        selectedDate: selectedDate,
                        startDate: now,
                        endDate: endDate,
                        onWeekSelected: onWeekSelected,
                        onDateSelected: onSelect,
                        dateTileBuilder: dateTileBuilder,
                        iconColor: Colors.white,
                        monthNameWidget: _monthNameWidget,
                        containerDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: functions.decideColor(context),
                        ),
                      ),
                    ),
                    Text(
                      'Saat Seçin',
                      style: kSmallTitleStyle,
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          for (AppointmentInfo x in widget.servicesAndEmployees)
                            servicesAndDates(x.service, widget.servicesAndEmployees.indexOf(x), x.employee),
                          SizedBox(height: 35),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 32.0),
          child: Row(
            children: <Widget>[
              Container(
                width: size.width - 4 * (size.width / 6),
                decoration: BoxDecoration(
                  gradient: functions.decideColor(context),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: FloatingActionButton.extended(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      'Geri Dön',
                      style: kTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: size.width - 4 * (size.width / 6),
                decoration: BoxDecoration(
                  gradient: functions.decideColor(context),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: FloatingActionButton.extended(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    // Navigator.pushNamed(context, ConfirmationPage.id);
                    Routers.router.navigateTo(context, "/OnaySayfası");
                  },
                  label: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      'Onayla',
                      style: kSmallTitleStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
