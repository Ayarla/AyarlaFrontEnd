import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';
import '../user_page/user_page.dart';

class EmployeeWorkPage extends StatefulWidget {
  static const String id = 'EmployeeWorkPage';

  @override
  _EmployeeWorkPageState createState() => _EmployeeWorkPageState();
}

class _EmployeeWorkPageState extends State<EmployeeWorkPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 10),
          icon: BackButton(),
          onPressed: () {
            // Navigator.popUntil(context, ModalRoute.withName(SearchPage.id));
          },
        ),
        title: Center(
          child: Text(
            "ayarla",
            style: kTitleStyle.copyWith(
                color: Colors.white, letterSpacing: 2, fontSize: 30),
          ),
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 10),
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              //color: Color(0xFF2d3b4a),
              size: 40.0,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UserPage()));
            },
          ),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(height: 10),
              /// bunu detay sayfasındakiyle değiştir.
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    width: size.width,
                    child: Text(
                      'Çalışanlar',
                      style: kTitleStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _getRow(
                size,
                'Çalışan İsmi',
                FlatButton(
                  onPressed: null,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Randevular',
                          style: kTextStyle,
                        ),
                      ),
                    ),
                  ),
                )
              ),
              _getRow(
                size,
                'Çalışan İsmi',
                FlatButton(
                  onPressed: null,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Randevular',
                          style: kTextStyle,
                        ),
                      ),
                    ),
                  ),
                )
              ),
              _getRow(
                size,
                'Çalışan İsmi',
                FlatButton(
                  onPressed: null,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Randevular',
                          style: kTextStyle,
                        ),
                      ),
                    ),
                  ),
                )
              ),
              _getRow(
                size,
                'Çalışan İsmi',
                FlatButton(
                  onPressed: null,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Randevular',
                          style: kTextStyle,
                        ),
                      ),
                    ),
                  ),
                )
              ),
              SizedBox(height: 50,),
              Row(
                children: [
                  Spacer(),
                  FlatButton(
                    onPressed: null,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Kaydet',
                            style: kTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Padding _getRow(Size size, String text, FlatButton flatButton) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(width: 30,),
            Center(
              child: Text(
                text,
                style: kTextStyle,
              ),
            ),
            Spacer(),
            flatButton
          ],
        ),
      ),
    ),
  );
}
