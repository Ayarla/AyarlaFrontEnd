import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';
import 'package:ayarla/models/model_appointment.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:ayarla/webService/ayarla_account_functions.dart';
import 'package:ayarla/webService/http_service.dart';
import 'package:flutter/material.dart';

class AppointmentService extends ChangeNotifier {
  Appointment currentAppointment = Appointment(
    coiffureName: '',
    date: '',
    hour: '',
    totalPrice: 0,
    appointmentDetails: [],
    isConfirmedByUser: false,
    isConfirmedByCoiffure: false,
  );

  List<ServiceModel> serviceList = [];
  List<EmployeeModel> employeeList = [];
  List<String> hoursList = [];

  appointmentAddHandler() {
    currentAppointment.appointmentDetails.clear();
    for (int i = 0; i < serviceList.length; i++) {
      currentAppointment.appointmentDetails.add(
        AppointmentModel(serviceModel: serviceList[i], employeeModel: employeeList[i]),
      );
    }
    priceHandler();
  }

  priceHandler() {
    currentAppointment.totalPrice = 0;
    for (ServiceModel x in serviceList) {
      currentAppointment.totalPrice += x.price;
    }
    notifyListeners();
  }

  dateHandler() {
    currentAppointment.appointmentDetails.clear();
    for (int i = 0; i < hoursList.length; i++) {
      currentAppointment.appointmentDetails.add(
        AppointmentModel(
          serviceModel: serviceList[i],
          employeeModel: employeeList[i],
          hour: hoursList[i],
        ),
      );
    }
    currentAppointment.appointmentDetails.sort((a, b) => a.hour.compareTo(b.hour));
    currentAppointment.hour = currentAppointment.appointmentDetails[0].hour.substring(0, 5);
  }

  resetCurrentAppointment() {
    currentAppointment = Appointment(
      coiffureName: '',
      totalPrice: 0,
      isConfirmedByUser: false,
      isConfirmedByCoiffure: false,
      date: '',
      hour: '',
      appointmentDetails: [],
    );
  }

  /// mail
  // /// Send mail v2
  // sendMail2(String recipients) {
  //   var options = new YandexSmtpOptions()
  //     ..username = 'ozet@ayarla.app'
  //     ..password = 'aa112233';
  //
  //   var emailTransport = new SmtpTransport(options);
  //
  //   // Create our mail/envelope.
  //   var envelope = new Envelope()
  //     ..from = 'ozet@ayarla.app'
  //     ..recipients.add(recipients)
  //     // ..bccRecipients.add('hidden@recipient.com')
  //     ..subject = 'Testing the Dart Mailer library'
  //     // ..attachments.add(null)
  //     ..text = 'This is a cool email message. Whats up?'
  //     ..html = getHTML();
  //
  //   // Email it.
  //   emailTransport
  //       .send(envelope)
  //       .then((envelope) => print('Email sent!'))
  //       .catchError((e) => print('Error occurred: $e'));
  // }
  //
  // getHTML() {
  //   List returnList = createSummaryBody();
  //   String summaryFinal = '';
  //   for (int i = 0; i < returnList.length; i++) {
  //     summaryFinal = '$summaryFinal' + '${returnList[i]}';
  //   }
  //
  //   String context = '<html>'
  //       '<body>'
  //       '</div>'
  //       '<img src="https://bcm.ist/images/png.png" width="350px">'
  //       '<div align="center" style="border-style: outset; width: 350px; position: fixed; left: 30%; padding-left:10px; padding-right:10px; padding-top:10px;">'
  //       '<div>coiffureName</div>'
  //       '<div>Randevu Talebiniz Alınmıştır.</div>'
  //       '<div>İşletmeden Onay Bekleniyor.</div>'
  //       '<div><b>Gün: $lastDate</b></div>'
  //       '<div><b>Saat: ${servicesAndEmployees[0].time}<b/></div>'
  //       '<hr>'
  //       '<div align="left"> $summaryFinal</div>'
  //       '<table style="width:100%">'
  //       '<tr>'
  //       '<td align="left">Toplam:</td>'
  //       '<td> </td>'
  //       '<td align="right">total TL</td>'
  //       ' </tr>'
  //       '</table>'
  //       '<div>AYARLA her gün genişleyen işletme ağı ile ve çok yakında randevu gerektiren diğer sektörlerde de benzer kullanıcı deneyimi ile hizmetinizde.</div>'
  //       '</div>'
  //       '</body>'
  //       '</html>';
  //   return context;
  // }
  //
  // createSummaryBody() {
  //   List holder = [];
  //   List priceList = [];
  //   for (int i = 0; i < servicesAndEmployees.length; i++) {
  //     for (int j = 0; j < fullTimeServices.length; j++) {
  //       if (fullTimeServices[j].name.contains(servicesAndEmployees[i].service)) {
  //         priceList.add(fullTimeServices[j].price);
  //         // print(priceList);
  //       }
  //     }
  //   }
  //
  //   for (int i = 0; i < servicesAndEmployees.length; i++) {
  //     holder.add('<table style="width:100%">'
  //         '<tr>'
  //         '<td>Saat:</td>'
  //         '<td align="center">${servicesAndEmployees[i].time}</td>'
  //         '</tr>'
  //         '<tr>'
  //         '<td>Hizmet:</td>'
  //         '<td align="center">${servicesAndEmployees[i].service}</td>'
  //         '<td align="end">${priceList[i]} TL</td>'
  //         '</tr>'
  //         '<tr>'
  //         '<td>Çalışan:</td>'
  //         '<td align="center">${servicesAndEmployees[i].employee}</td>'
  //         '</tr>'
  //         '</table>'
  //         '<hr>');
  //   }
  //   return holder;
  // }

  /// • Main coiffure list that is fetched at the start.
  List<CoiffureModel> mainCoiffureList = [];

  Future<List<CoiffureModel>> getAllCoiffures() async {
    List localList;

    localList = await HttpAyarlaAccountFunctions().getAllAyarlaAccount();
    // print(localList.length);

    for (int i = 0; i < localList.length; i++) {
      mainCoiffureList.add(CoiffureModel.fromJson({
        "address": localList[i]['address'],
        "gender": localList[i]['gender'],
        "commentNumber": localList[i]['commentNumber'],
        "accountNotes": localList[i]['accountNotes'],
        "openCloseTimes": localList[i]['openCloseTimes'],
        "phone1": localList[i]['phone1'],
        "id": localList[i]['id'],
        "meanRating": localList[i]['meanRating'],
        "city": localList[i]['city'],
        "district": localList[i]['district'],
        "accountName": localList[i]['accountName']
      }, i));
    }
    notifyListeners();
    // coiffureList = mainCoiffureList;
    return mainCoiffureList;
  }
}
