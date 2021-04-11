import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/floatingButton.dart';
import 'package:ayarla/components/googleMap.dart';
import 'package:ayarla/components/imageListItem.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/components/rating_row.dart';
import 'package:ayarla/components/timeDropdown.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/employeeAndService.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';

class BusinessInfoPage extends StatefulWidget {
  static const id = 'BusinessInfoScreen';
  @override
  _BusinessInfoPageState createState() => _BusinessInfoPageState();
}

class _BusinessInfoPageState extends State<BusinessInfoPage> {
  bool pressed = false;
  int _currentPage = 0;
  int autoChangeSeconds = 6;
  String firstHalf;
  String secondHalf;
  bool flag = true;
  bool leftArrow = false;
  String text;

  final ScrollController _scrollControllerEmployee = ScrollController();
  final ScrollController _scrollControllerServices = ScrollController();

  final ScrollController _photoController = ScrollController();
  Functions functions = Functions();
  String selectedStart = '00:00';
  String selectedEnd = '00:00';
  @override
  initState() {
    super.initState();

    /// checking whether the arrow of the employee row of employee section
    /// reaches the max scroll extent.
    _scrollControllerEmployee.addListener(() {
      if (_scrollControllerEmployee.position.pixels ==
          _scrollControllerEmployee.position.maxScrollExtent) {
        setState(() {
          leftArrow = true;
        });
      } else if (_scrollControllerEmployee.position.pixels ==
          _scrollControllerEmployee.position.minScrollExtent) {
        setState(() {
          leftArrow = false;
        });
      }
    });
  }

  bool editService = false;
  bool editEmployee = false;

  /// returns the index of the service
  int findIndex(ServiceModel x) {
    return Provider.of<AppointmentData>(context, listen: false)
        .fullTimeServices
        .indexOf(x);
  }

  int findIndexOfEmployee(int employeeIndex, EmployeeModel y) {
    return Provider.of<AppointmentData>(context, listen: false)
        .fullTimeServices[employeeIndex]
        .employees
        .indexOf(y);
  }

  int findIndexEmployee(EmployeeModel y) {
    return Provider.of<AppointmentData>(context, listen: false)
        .employeesList
        .indexOf(y);
  }

  bool isChanged = false;

  ///popup to add employee
  openAlertBox(int serviceIndex) {
    List boolList = [];
    for (int i = 0;
        i <
            Provider.of<AppointmentData>(context, listen: false)
                .employeesList
                .length;
        i++) {
      boolList.add(false);
    }
    bool isValid(String name) {
      for (EmployeeModel x
          in Provider.of<AppointmentData>(context, listen: false)
              .fullTimeServices[serviceIndex]
              .employees) {
        if (x.name == name) {
          return true;
        }
      }
      return false;
    }

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState1) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                width: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Personel Seçiniz",
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 4.0,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Column(
                          children: [
                            for (EmployeeModel x
                                in Provider.of<AppointmentData>(context,
                                        listen: true)
                                    .employeesList)
                              (isValid(x.name)
                                  ? SizedBox(width: 0, height: 0)
                                  : Row(
                                      children: [
                                        Text(x.name, style: kTextStyle),
                                        Checkbox(
                                            value: boolList[
                                                Provider.of<AppointmentData>(
                                                        context,
                                                        listen: false)
                                                    .employeesList
                                                    .indexOf(x)],
                                            onChanged: (value) {
                                              setState1(() {
                                                boolList[Provider.of<
                                                            AppointmentData>(
                                                        context,
                                                        listen: false)
                                                    .employeesList
                                                    .indexOf(
                                                        x)] = !boolList[
                                                    Provider.of<AppointmentData>(
                                                            context,
                                                            listen: false)
                                                        .employeesList
                                                        .indexOf(x)];
                                              });
                                            })
                                      ],
                                    )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    int index = 0;
                                    for (bool x in boolList) {
                                      if (x == true) {
                                        Provider.of<AppointmentData>(context,
                                                listen: false)
                                            .setEmployee(serviceIndex, index);
                                      }
                                      index++;
                                    }
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.grey)),
                                  child: Text(
                                    "Onayla",
                                    style: kTextStyle.copyWith(
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<ImageListItem> _pages =
        Provider.of<BusinessAndUserData>(context, listen: true).pages;
    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: isChanged
            ? FloatingButton(
                text: 'Kaydet',
                onPressed: () {
                  setState(() {
                    // isSaved = true;
                    isChanged = false;
                  });
                },
                // isGradient: true,
        )
            : null,
        appBar: DefaultAppBar(
                title: Text("Kuaför Adı",
                    style: kTitleStyle.copyWith(color: Colors.white)),
                gradient: functions.decideColor(context),
                backButtonFunction: !isChanged
                    ? null
                    : () {
                        return showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Color(0xFFE5EBEE),
                                title: Center(
                                  child: Text(
                                    "Değişiklikleri kaydetmek istiyor musunuz?",
                                    style: kSmallTitleStyle,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                ),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        child: Text(
                                          'Hayır',
                                          style: kSmallTextStyle.copyWith(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }),
                                    SizedBox(width: 30),
                                    TextButton(
                                        child: Text(
                                          'Evet',
                                          style: kSmallTextStyle.copyWith(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ),
                              );
                            });
                      })
            .build(context),
        body: Container(
          child: OverScroll(
            child: ListView(
              controller: _photoController,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 16.0, left: 10.0, right: 10.0, top: 16.0),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: <Widget>[
                      Column(
                        children: [
                          GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: kCardShadow,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8.0)),
                                    child: _pages.length == 0
                                        ? Container(
                                            height: size.height * 0.35,
                                            width: size.width,
                                            child: IconButton(
                                              icon: Icon(Icons.add_a_photo),
                                              onPressed: () {
                                                functions.showPicker(context);
                                                setState(() {
                                                  isChanged = true;
                                                });
                                              },
                                            ),
                                          )
                                        : CarouselSlider(
                                            items: _pages,
                                            options: CarouselOptions(
                                                viewportFraction: 1,
                                                autoPlayInterval: Duration(
                                                    seconds: autoChangeSeconds),
                                                autoPlay: true,
                                                enableInfiniteScroll: false,
                                                aspectRatio: 1.6,
                                                onPageChanged: (index, reason) {
                                                  setState(() {
                                                    _currentPage = index;
                                                  });
                                                }),
                                          ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: GestureDetector(
                                      child: Icon(
                                        Icons.add_circle,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                      onTap: () {
                                        functions.showPicker(context);
                                        setState(() {
                                          isChanged = true;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            ///stops passing the pages automatically
                            onLongPress: () {
                              setState(() {
                                pressed = true;
                              });
                            },
                            onLongPressUp: () {
                              setState(() {
                                pressed = false;
                              });
                            },
                          ),

                          /// dot indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _pages.map((url) {
                              int index = _pages.indexOf(url);
                              return Container(
                                width: 8.0,
                                height: 20.0,
                                margin:
                                    EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 0.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentPage == index
                                      ? Color.fromRGBO(0, 0, 0, 0.9)
                                      : Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),

                      /// Ratings
                      Text(
                        "Hakkında",
                        style: kTitleStyle,
                      ),
                      // RatingRow(
                      //   number: 3,
                      //   comment: 150,
                      // ),

                      /// Location
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mapMarkerAlt,
                            size: 12,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'İstanbul, Sarıyer',
                            style: kSmallTextStyle.copyWith(
                              color: Colors.grey.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),

                      /// TODO - fix
                      TextButton(
                          child: Text('Randevu aralığı belirleyiniz',
                              style: kSmallTextStyle.copyWith(
                                  color: Colors.grey.withOpacity(0.8))),
                          onPressed: () {}),

                      /// Working hours
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.access_time,
                              color: Colors.grey.withOpacity(0.8), size: 20),
                          SizedBox(width: 10),
                          TimeDropdown(
                            selected: "00:00",
                          ),
                          Text(
                            "-",
                            style: kSmallTextStyle.copyWith(
                              color: Colors.grey.withOpacity(0.8),
                            ),
                          ),
                          TimeDropdown(
                            selected: "00:00",
                          ),
                        ],
                      ),

                      /// About text
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: Container(
                              width: size.width * 0.83,
                              child: TextFormField(
                                  onTap: () {
                                    setState(() {
                                      isChanged = true;
                                    });
                                  },
                                  keyboardType: TextInputType.multiline,
                                  autofocus: false,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Kuaför hakkındaki bilgileri giriniz',
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                      borderSide: new BorderSide(),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),

                      ///Hizmetler
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text('Hizmetler', style: kTitleStyle),
                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: GestureDetector(
                                    child: Icon(Icons.add_circle,
                                        color: Colors.green)),
                              ),
                              onTap: () {
                                // Provider.of<AppointmentData>(context, listen: false).addService();
                                setState(() {
                                  editService = !editService;
                                  isChanged = true;
                                });
                              },
                            ),
                          ]),
                          for (ServiceModel x in Provider.of<AppointmentData>(
                                  context,
                                  listen: false)
                              .fullTimeServices)
                            Row(
                              children: [
                                Container(
                                  width: !editService
                                      ? size.width * .9
                                      : size.width * 4 / 5,
                                  child: Card(
                                    elevation: 10,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: size.width / 3,
                                                child: x.name.length >= 17
                                                    ? FittedBox(
                                                        fit: BoxFit.cover,
                                                        child: Text(x.name,
                                                            style: kTextStyle
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal)),
                                                      )
                                                    : Text(x.name,
                                                        style:
                                                            kTextStyle.copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal)),
                                              ),
                                              Spacer(),
                                              Container(
                                                width: size.width / 6,
                                                child:
                                                    "${x.price} TL".length >= 9
                                                        ? FittedBox(
                                                            fit: BoxFit.cover,
                                                            child: Text(
                                                              "${x.price} TL",
                                                              style: kTextStyle.copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                              textAlign:
                                                                  TextAlign.end,
                                                            ),
                                                          )
                                                        : Text(
                                                            "${x.price} TL",
                                                            style: kTextStyle
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                            textAlign:
                                                                TextAlign.end,
                                                          ),
                                              ),
                                              SizedBox(
                                                width: size.width / 7,
                                                height: size.width / 7,
                                                child: FlatButton(
                                                  padding: EdgeInsets.all(0),
                                                  color: Colors.white,
                                                  shape: CircleBorder(),
                                                  onPressed: () {
                                                    /// Add or subtract Service and calculate
                                                    /// price
                                                    Provider.of<AppointmentData>(
                                                            context,
                                                            listen: false)
                                                        .changeSelectedService(
                                                            findIndex(x));
                                                  },
                                                  child: Icon(
                                                    Provider.of<AppointmentData>(
                                                                context,
                                                                listen: true)
                                                            .fullTimeServices[
                                                                findIndex(x)]
                                                            .selected
                                                        ? Icons.remove
                                                        : Icons.add,
                                                    size: 25,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          /// opens the employee row if service selected
                                          if (x.selected)
                                            Stack(children: [
                                              Container(
                                                height: size.width / 5.3,
                                                child: ListView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0,
                                                                  vertical:
                                                                      4.0),
                                                          child: Container(
                                                            width: 90,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  child: Icon(
                                                                      Icons
                                                                          .person,
                                                                      size: size
                                                                              .height /
                                                                          15,
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                                FittedBox(
                                                                    child: Text(
                                                                      Provider.of<AppointmentData>(
                                                                              context,
                                                                              listen: true)
                                                                          .defaultEmployee
                                                                          .name,
                                                                      style: kSmallTextStyle
                                                                          .copyWith(
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            top: -12,
                                                            right: 5,
                                                            child: IconButton(
                                                              icon: Icon(
                                                                  Icons
                                                                      .add_circle,
                                                                  color: Colors
                                                                      .green),
                                                              onPressed: () {
                                                                ///opens the popup to add employee
                                                                openAlertBox(
                                                                    findIndex(
                                                                        x));
                                                              },
                                                            ))
                                                      ],
                                                    ),
                                                    for (EmployeeModel y in Provider
                                                            .of<AppointmentData>(
                                                                context,
                                                                listen: true)
                                                        .fullTimeServices[
                                                            findIndex(x)]
                                                        .employees)
                                                      Stack(
                                                        children: [
                                                          Container(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      12.0,
                                                                  vertical:
                                                                      4.0),
                                                              child: Container(
                                                                width: 90,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          bottom:
                                                                              8.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        child:
                                                                            Image(
                                                                          height:
                                                                              size.height / 20,
                                                                          image:
                                                                              AssetImage(
                                                                            y.image,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    FittedBox(
                                                                        child:
                                                                            Text(
                                                                          y.name,
                                                                          style:
                                                                              kSmallTextStyle.copyWith(
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        ),
                                                                        fit: BoxFit
                                                                            .cover)
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                              top: -12,
                                                              right: 5,
                                                              child: IconButton(
                                                                icon: Icon(
                                                                    Icons
                                                                        .remove_circle,
                                                                    color: Colors
                                                                        .red),
                                                                onPressed: () {
                                                                  Provider.of<AppointmentData>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .removeEmployeeFromService(
                                                                          findIndex(
                                                                              x),
                                                                          findIndexOfEmployee(
                                                                              findIndex(x),
                                                                              y));
                                                                },
                                                              ))
                                                        ],
                                                      )
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                right: 0,
                                                top: 10,
                                                child: Icon(!leftArrow
                                                    ? Icons.keyboard_arrow_right
                                                    : Icons
                                                        .keyboard_arrow_left),
                                              )
                                            ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if (editService)
                                  IconButton(
                                    icon: Icon(Icons.remove_circle,
                                        color: Colors.red),
                                    onPressed: () {
                                      Provider.of<AppointmentData>(context,
                                              listen: false)
                                          .deleteService(findIndex(x));
                                    },
                                  )
                              ],
                            ),
                          if (editService)
                            Row(
                              children: [
                                Container(
                                  width: size.width * 4 / 5,
                                  child: Card(
                                    elevation: 10,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  width: size.width / 3,
                                                  child: Text("Hizmet Adı",
                                                      style: kTextStyle.copyWith(
                                                          fontWeight: FontWeight
                                                              .normal))),
                                              Spacer(),
                                              Container(
                                                  width: size.width / 6,
                                                  child: Text(
                                                    "10 TL",
                                                    style: kTextStyle.copyWith(
                                                        fontWeight:
                                                            FontWeight.normal),
                                                    textAlign: TextAlign.end,
                                                  )),
                                              SizedBox(
                                                width: size.width / 7,
                                                height: size.width / 7,
                                                child: FlatButton(
                                                  padding: EdgeInsets.all(0),
                                                  color: Colors.white,
                                                  shape: CircleBorder(),
                                                  onPressed: () {
                                                    /// Add or subtract Service and calculate
                                                    /// price
                                                    // Provider.of<AppointmentData>(context, listen: false).changeSelectedService(findIndex(x));
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    size: 25,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          /// opens the employee row if service selected
                                          Stack(children: [
                                            Container(
                                              height: size.width / 5.3,
                                              child: ListView.builder(
                                                  itemCount: Provider.of<
                                                              AppointmentData>(
                                                          context,
                                                          listen: true)
                                                      .employeesList
                                                      .length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  controller:
                                                      _scrollControllerServices,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Stack(
                                                      children: [
                                                        Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        12.0,
                                                                    vertical:
                                                                        4.0),
                                                            child: Container(
                                                              width: 90,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    child:
                                                                        Image(
                                                                      height:
                                                                          size.height /
                                                                              20,
                                                                      image:
                                                                          AssetImage(
                                                                        Provider.of<AppointmentData>(context,
                                                                                listen: true)
                                                                            .employeesList[index]
                                                                            .image,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  FittedBox(
                                                                      child:
                                                                          Text(
                                                                        Provider.of<AppointmentData>(context,
                                                                                listen: true)
                                                                            .employeesList[index]
                                                                            .name,
                                                                        style: kSmallTextStyle
                                                                            .copyWith(
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover)
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            top: -12,
                                                            right: 5,
                                                            child: IconButton(
                                                              icon: Icon(
                                                                  Icons
                                                                      .remove_circle,
                                                                  color: Colors
                                                                      .red),
                                                            ))
                                                      ],
                                                    );
                                                  }),
                                            ),
                                            Positioned(
                                              right: 0,
                                              top: 10,
                                              child: Icon(!leftArrow
                                                  ? Icons.keyboard_arrow_right
                                                  : Icons.keyboard_arrow_left),
                                            )
                                          ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if (editService)
                                  IconButton(
                                    icon: Icon(Icons.add_circle,
                                        color: Colors.green),
                                    onPressed: () {
                                      // Provider.of<AppointmentData>(context, listen: false).deleteService(findIndex(x));
                                    },
                                  )
                              ],
                            ),
                        ],
                      ),

                      ///İletişim - TODO - Need design.
                      /// Wrap maybe ?
                      OverScroll(
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(10),
                          children: [
                            Text('Adres', style: kTextStyle),
                            SizedBox(height: 10),

                            ///MAP
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 60.0),
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, GoogleMapSample.id);
                                },
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(0)),
                                  overlayColor:
                                  MaterialStateProperty.all(Colors.grey[200]),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("Haritadan Bulunuz", style: kTextStyle),
                                ),
                              ),
                            ),
                            //
                            // TextButton(
                            //   style: ButtonStyle(
                            //     alignment: Alignment.topLeft,
                            //     padding: MaterialStateProperty.all(
                            //         EdgeInsets.all(0)),
                            //     overlayColor:
                            //         MaterialStateProperty.all(Colors.grey[200]),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.pushNamed(
                            //         context, GoogleMapSample.id);
                            //   },
                            //   child: Text("Haritada Göster", style: kTextStyle),
                            // ),
                            Text('veya', style: kSmallTextStyle),
                            SizedBox(height: 10),
                            /// TODO
                            Container(
                              width: size.width * 0.83,
                              child: TextFormField(
                                  controller: TextEditingController(
                                      text: Provider.of<BusinessAndUserData>(
                                              context,
                                              listen: true)
                                          .pickedResult
                                          .formattedAddress),
                                  keyboardType: TextInputType.multiline,
                                  autofocus: false,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    hintText: 'Adres giriniz',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  )),
                            ),
                            SizedBox(height: 20),

                            /// Telephone
                            Text(
                              'Telefon',
                              style: kTextStyle,
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: size.width * 0.35,
                              child: TextFormField(
                                  controller: TextEditingController(
                                      text: Provider.of<BusinessAndUserData>(
                                              context,
                                              listen: true)
                                          .pickedResult
                                          .formattedPhoneNumber),
                                  maxLength: 13,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  autofocus: false,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(0),
                                    counter: Offstage(),
                                    hintText: '555-5555555',
                                    hintStyle: kSmallTextStyle,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                      borderSide: new BorderSide(),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
