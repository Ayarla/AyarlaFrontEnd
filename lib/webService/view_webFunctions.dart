import 'package:ayarla/constants/router.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'webFunctions.dart';

class ViewWebFunctions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
            onPressed: () {
              userUpdate();
            },
            child: Text('guncelle')),
        TextButton(
            onPressed: () {
              print(Provider.of<AppointmentData>(context, listen: false)
                  .userList[2]
                  .id);
              deleteUser(Provider.of<AppointmentData>(context, listen: false)
                  .userList[2]
                  .id
                  .toString());
            },
            child: Text('sil')),
        TextButton(onPressed: () => createUser(), child: Text("olustur")),
        TextButton(onPressed: () => getToken(), child: Text("getToken")),
        TextButton(
            // onPressed: () => getAll(),
            onPressed: () {
              Provider.of<AppointmentData>(context, listen: false)
                  .getAllUsers();
            },
            child: Text("getAll")),
        SizedBox(height: 30),
        TextButton(
          child: Text('kayıt popup'),
          onPressed: () => Routers.router.navigateTo(context, "/KayitSayfasi"),
        )
      ],
    );
  }
}
