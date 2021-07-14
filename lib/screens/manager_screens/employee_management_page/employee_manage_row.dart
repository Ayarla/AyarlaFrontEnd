import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmployeeManageRow extends StatelessWidget {
  const EmployeeManageRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SizedBox(
      width: size.width > 900 ? size.width / 1.3 : size.width,
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 0, top: 8, bottom: 8, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: size.width / 7,
                        child: Image.asset('assets/worker_1.png',
                            fit: BoxFit.contain)),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          /// name

                          Text(
                            "Nilsu Öz",
                            style: kTextStyle.copyWith(fontSize: 20),
                          ),
                          SizedBox(height: 5),

                          /// First line
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade700,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Padding(
                                padding: EdgeInsets.only(top: 4.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '4.5',
                                        style: kSmallTextStyle.copyWith(
                                          color: Colors.grey
                                              .withOpacity(0.8),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),

                          /// Second Line
                          Row(
                            children: <Widget>[
                              SizedBox(width: 1),
                              Icon(
                                Icons.circle,
                                size: 13,
                                color: Colors.red,
                              ),
                              SizedBox(width: 7),
                              Padding(
                                padding: EdgeInsets.only(top: 1.0),
                                child: Text(
                                  'Dolu',
                                  style: kSmallTextStyle.copyWith(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CircularParent(
                radius: 20,
                direction: Directions.all,
                color: Colors.indigo,
                child: IconSlideAction(
                  caption: 'Detay',
                  color: Colors.transparent,
                  icon: FontAwesomeIcons.userEdit,
                  // onTap: () => _showSnackBar('More'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: CircularParent(
                radius: 20,
                direction: Directions.all,
                color: Colors.red,
                child: IconSlideAction(
                    caption: 'Kaldır',
                    color: Colors.transparent,
                    icon: Icons.delete,
                    onTap: () {}),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
