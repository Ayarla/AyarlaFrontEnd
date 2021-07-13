import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/screens/manager_screens/employee_management_page/employee_manage_row.dart';
import 'package:flutter/material.dart';


class EmployeeManage extends StatelessWidget {
  const EmployeeManage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Functions functions = Functions();

    return Scaffold(
      appBar: DefaultAppBar(
        gradient: functions.decideColor(context),
        title: Center(
          child: Text(
            'Çalışan Yönetim Sayfası',
            style: kSmallTitleStyle.copyWith(color: Colors.white),
          ),
        ),
      ).build(context),
      body: AyarlaPage(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                  children: [
                    Text("10 kişi", style: kTextStyle,),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.green
                      ),
                      child: Padding(
                        padding:EdgeInsets.all(8.0),
                        child: Row(children: [
                          Text("Çalışan Ekle", style: kSmallTextStyle.copyWith(color: Colors.white),),
                          Icon(Icons.add, color: Colors.white,)
                        ]),
                      ),
                    )
                  ]),
            ),
            Divider(),
            EmployeeManageRow(),
            EmployeeManageRow()
          ],
        ),
      ),
    );
  }
}
