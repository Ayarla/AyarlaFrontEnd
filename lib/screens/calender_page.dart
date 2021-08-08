import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/components/calendar/calendar.dart';
import 'package:ayarla/components/floatingTextButton.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/models/model_appointment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Functions functions = Functions();

  ///calender
  DateTime now = DateTime.now();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 14));
  DateTime selectedDate;

  List localList = [];
  List timeList = [];

  ///calender strip package
  onSelect(data) {
    setState(() {
      selectedDate = data;
    });
    Provider.of<AppointmentData>(context, listen: false).currentAppointment.date =
        '${selectedDate.day} '
        '${month[selectedDate.month - 1]} '
        '${week[selectedDate.weekday - 1]}';
  }

  ///DON`T DELETE
  ///
  ///onWeekSelected OTHERWISE STATE WON`T CHANGE!!
  ///
  ///(CHANGING WEEK BY PRESSING RIGHT OR LEFT BUTTON)
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
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontStyle: FontStyle.italic),
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
      child: Column(children: _children),
    );
  }

  bool selected = false;

  /// Builds time buttons
  GestureDetector buildTimeButton({String time, int index2}) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        selected = !selected;
        setState(() {
          print(selected);
        });
        Provider.of<AppointmentData>(context, listen: false).hoursList.add('00.00');
        Provider.of<AppointmentData>(context, listen: false).hoursList[index2] = time;
        Provider.of<AppointmentData>(context, listen: false).hoursList.length =
            Provider.of<AppointmentData>(context, listen: false).serviceList.length;
      },
      child: Container(
        width: size.width < 700 ? 150 : size.width / 5,
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 1),
        decoration: BoxDecoration(
          color: selected ? Colors.green : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0.0, 5), blurRadius: 10)],
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              time,
              style: kTextStyle.copyWith(color: selected ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds time table for each service
  Column servicesAndDates(String serviceName, String employeeName, int index2) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Row(
            children: <Widget>[
              Text('$serviceName: ', style: kTextStyle.copyWith(fontSize: 16)),
              Text(
                '$employeeName',
                style: kSmallTextStyle.copyWith(fontSize: 15.0, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: CircularParent(
            direction: Directions.all,
            radius: 20,
            color: Colors.white,
            child: Container(
              width: size.width,
              height: 200,
              color: Colors.transparent,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: timeList.sublist(17, 37).length,
                  gridDelegate: size.width < 700
                      ? SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 0.2,
                          mainAxisExtent: 100,
                        )
                      : SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 3,
                          mainAxisExtent: 100,
                        ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Dummy(
                          selected: selected,
                          time: timeList.sublist(17, 37)[index],
                          nextTime: timeList.sublist(18, 38)[index],
                          index2: index2,
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    localList =
        Provider.of<AppointmentData>(context, listen: false).currentAppointment.appointmentDetails;
    Provider.of<AppointmentData>(context, listen: false).currentAppointment.date =
        '${selectedDate.day} '
        '${month[selectedDate.month - 1]} '
        '${week[selectedDate.weekday - 1]}';
    timeList = dividedHours;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultAppBar(
        title: UI.AppBarTitleCustomer(),
        gradient: functions.decideColor(context),
      ).build(context),
      backgroundColor: Color(0xFFE5EBEE),
      body: AyarlaPage(
        child: OverScroll(
          child: ListView(
            children: <Widget>[
              Container(
                height: size.height,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Gün Seçin', style: kSmallTitleStyle),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.0, top: 12),
                        child: CalendarStrip(
                            containerHeight: size.width < 700 ? (90 + size.width / 20) : 125,
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
                            leftIcon: Icon(CupertinoIcons.left_chevron,
                                size: size.width < 700 ? size.width / 23.3 : 30,
                                color: Colors.white),
                            rightIcon: Icon(CupertinoIcons.right_chevron,
                                size: size.width < 700 ? size.width / 23.3 : 30,
                                color: Colors.white)),
                      ),
                      Text('Saat Seçin', style: kSmallTitleStyle),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            for (AppointmentModel x in localList)
                              servicesAndDates(
                                  x.serviceModel.name, x.employeeModel.name, localList.indexOf(x)),
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
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AyarlaPageNoC(
        child: Row(
          children: <Widget>[
            FloatingTextButton(
              text: 'Geri Dön',
              onPressed: () => Routers.router.pop(context),
              gradient: functions.decideColor(context),
            ),
            Spacer(),
            FloatingTextButton(
              text: 'Onayla',
              onPressed: () {
                Routers.router.navigateTo(context, "/OnaySayfasi");
                Provider.of<AppointmentData>(context, listen: false).dateHandler();
              },
              gradient: functions.decideColor(context),
            )
          ],
        ),
      ),
    );
  }
}

class Dummy extends StatefulWidget {
  bool selected;
  String time;
  String nextTime;
  int index2;

  Dummy({
    this.selected,
    this.index2,
    this.time,
    this.nextTime,
  });

  @override
  _DummyState createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selected = !widget.selected;
        });
        /// TODO - do at local then push to provider.
        ///
        /// fix initial hour.
        if (widget.selected) {
          Provider.of<AppointmentData>(context, listen: false).hoursList.add('00.00');
          Provider.of<AppointmentData>(context, listen: false).hoursList[widget.index2] =
              '${widget.time} - ${widget.nextTime}';
          // widget.time;
          Provider.of<AppointmentData>(context, listen: false).hoursList.length =
              Provider.of<AppointmentData>(context, listen: false).serviceList.length;
        } else if (!widget.selected) {
          Provider.of<AppointmentData>(context, listen: false)
              .hoursList
              .remove('${widget.time} - ${widget.nextTime}');
        }
      },
      child: Container(
        width: size.width < 700 ? 150 : size.width / 5,
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 1),
        decoration: BoxDecoration(
          color: widget.selected ? Colors.green : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0.0, 5), blurRadius: 10)],
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              '${widget.time} - ${widget.nextTime}',
              style: kTextStyle.copyWith(color: widget.selected ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
