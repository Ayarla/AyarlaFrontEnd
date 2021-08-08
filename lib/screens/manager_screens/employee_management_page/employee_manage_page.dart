import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/screens/manager_screens/employee_management_page/employee_manage_row.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EmployeeManage extends StatelessWidget {
  const EmployeeManage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Functions functions = Functions();
    String _typedMail;
    String _typedPassword;
    String _typedPasswordCheck;
    String _name;
    String _surname;
    String _phoneNumber;
    bool isValidEmail() {
      return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(_typedMail);
    }

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
              child: GestureDetector(
                onTap: (){
                  showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder:
                      (BuildContext context){
                  return AlertDialog(
                    backgroundColor: Color(0xFFE5EBEE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    title: Text(
                      'Çalışan Ekle',
                      style: kSmallTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                    content: SingleChildScrollView(
                      child: Form(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  'Çalışanınızı uygulamaya kaydediniz.',
                                  textAlign: TextAlign.start,
                                  style: kSmallTextStyle.copyWith(),
                                ),
                              ),
                              TextFormField(
                                validator: (_typedValue) {
                                  return (_typedValue.isEmpty)
                                      ? 'Boş Bırakılamaz'
                                      : isValidEmail()
                                      ? null
                                      : "Lütfen geçerli bir mail adresi giriniz";
                                },
                                autocorrect: false,
                                onChanged: (typed) {
                                  _typedMail = typed;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: Icon(
                                      Icons.mail_outline,
                                      size: 20.0,
                                    ),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    maxHeight: 20.0,
                                    maxWidth: 30.0,
                                  ),
                                  hintText: 'Mail Adresinizi Giriniz',
                                  hintStyle: kSmallTextStyle.copyWith(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              /// Name Field
                              TextFormField(
                                validator: (_typed) {
                                  if (_typed.isEmpty) {
                                    return 'Boş Bırakılamaz';
                                  } else
                                    return null;
                                },
                                onChanged: (typed) {
                                  _name = typed;
                                },
                                autocorrect: false,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: Icon(
                                      Icons.person_outline,
                                      size: 20.0,
                                    ),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    maxHeight: 20.0,
                                    maxWidth: 30.0,
                                  ),
                                  hintText: 'İsminizi Giriniz',
                                  hintStyle: kSmallTextStyle.copyWith(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),

                              /// Surname Field
                              TextFormField(
                                validator: (_typed) {
                                  if (_typed.isEmpty) {
                                    return 'Boş Bırakılamaz';
                                  } else
                                    return null;
                                },
                                onChanged: (typed) {
                                  _surname = typed;
                                },
                                autocorrect: false,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: Icon(
                                      Icons.person_outline,
                                      size: 20.0,
                                    ),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    maxHeight: 20.0,
                                    maxWidth: 30.0,
                                  ),
                                  hintText: 'Soy İsminizi Giriniz',
                                  hintStyle: kSmallTextStyle.copyWith(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),

                              /// Password Field
                              TextFormField(
                                validator: (_typed) {
                                  if (_typed.isEmpty) {
                                    return 'Boş Bırakılamaz';
                                  } else if (_typed.length < 6) {
                                    return 'Şifre en az 6 karakter içermelidir';
                                  } else if (_typedPasswordCheck != _typed && _typedPasswordCheck != '') {
                                    return 'Şifreler birbiri ile uyuşmuyor';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (typed) {
                                  _typedPassword = typed;
                                },
                                autocorrect: false,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Icon(
                                      Icons.vpn_key_outlined,
                                      size: 20.0,
                                    ),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    maxHeight: 20.0,
                                    maxWidth: 30.0,
                                  ),
                                  hintText: 'Şifrenizi Giriniz',
                                  hintStyle: kSmallTextStyle.copyWith(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),

                              /// Password Check Field
                              TextFormField(
                                validator: (_typed) {
                                  if (_typed.isEmpty) {
                                    return 'Boş Bırakılamaz';
                                  } else if (_typed.length < 6) {
                                    return 'Şifre en az 6 karakter içermelidir';
                                  } else if (_typedPassword != _typed && _typedPassword != '') {
                                    return 'Şifreler birbiri ile uyuşmuyor';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (typed) {
                                  _typedPasswordCheck = typed;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: Icon(
                                      Icons.vpn_key_outlined,
                                      size: 20.0,
                                    ),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    maxHeight: 20.0,
                                    maxWidth: 30.0,
                                  ),
                                  hintText: 'Şifrenizi Tekrar Giriniz',
                                  hintStyle: kSmallTextStyle.copyWith(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'İptal',
                            style: kSmallTextStyle.copyWith(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            _typedMail = '';
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text(
                            'Onayla',
                            style: kSmallTextStyle.copyWith(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: ()  {
                            Provider.of<AppointmentData>(context,listen: false).addEmployee(_name+' '+_surname);
                            Navigator.pop(context);
                          },
                        ),
                      ]
                  );
                });
                },
                child: Row(
                    children: [
                      Text(Provider.of<AppointmentData>(context, listen: false).employeesList.length.toString(), style: kTextStyle,),
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
            ),
            Divider(),
            for (EmployeeModel x in Provider.of<AppointmentData>(context, listen: true).employeesList)
            EmployeeManageRow(name: x.name,index: Provider.of<AppointmentData>(context, listen: false).employeesList.indexOf(x),),
          ],
        ),
      ),
    );
  }
}
