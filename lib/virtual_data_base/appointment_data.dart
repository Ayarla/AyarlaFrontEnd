import 'dart:math';
import 'package:ayarla/models/userModel.dart';
import 'package:ayarla/screens/search_page.dart';
import 'package:ayarla/webService/user_functions.dart';
// import 'package:firebase/firebase.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:mailer2/mailer.dart';
import 'package:ayarla/models/Appointment.dart';
import 'package:ayarla/models/coiffeurModel.dart';
import 'package:ayarla/models/employeeAndService.dart';
import 'package:ayarla/screens/manager_screens/manager_send_message_page.dart';

class Availability {
  String time;
  bool selected;
  Availability({this.selected, this.time});
}

class AppointmentData extends ChangeNotifier {
  /// called in coiffure_detail_card initState
  String coiffureName = '';
  // setName(String name) {
  //   coiffureName = name;
  // }

  List<ServiceModel> newServiceList = [
    ServiceModel(name: 'Saç Kesimi', price: 20, selected: false),
    ServiceModel(name: 'Sakal Kesimi', price: 10, selected: false),
    ServiceModel(name: 'Saç Boyama', price: 100, selected: false),
    ServiceModel(name: 'Manikür', price: 30, selected: false),
    ServiceModel(name: 'Pedikür', price: 30, selected: false),
    ServiceModel(name: 'Perma', price: 100, selected: false),
    ServiceModel(name: 'Saç Bakımı', price: 50, selected: false),
  ];

  //used in coiffure_detail card
  List<EmployeeModel> employeesList = [
    EmployeeModel(
      name: 'Nilsu Öz',
      image: 'assets/worker_3.png',
      gender: 'female',
      selected: false,
    ),
    EmployeeModel(
        image: 'assets/worker_1.png',
        name: 'Fatih Özkan',
        selected: false,
        gender: 'male'),
    EmployeeModel(
        image: 'assets/worker_2.jpg',
        name: 'Bahadır İren',
        selected: false,
        gender: 'male'),
    EmployeeModel(
        image: 'assets/worker_1.png',
        name: 'Semih Gümüş',
        selected: false,
        gender: 'male'),
    EmployeeModel(
        image: 'assets/worker_2.jpg',
        name: 'Ahmed Akif Kaya',
        selected: false,
        gender: 'male'),
  ];

  ///fullTimeService List
  ///=> used in coiffure_detail card
  ///TODO halfTime services should be added.
  List<ServiceModel> fullTimeServices = [
    ServiceModel(name: 'Saç Kesimi', price: 20, selected: false, employees: [
      EmployeeModel(
        image: 'assets/worker_3.png',
        name: 'Nilsu Öz',
        selected: false,
        gender: "female",
      ),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Fatih Özkan',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Bahadır İren',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Semih Gümüş',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Ahmed Akif Kaya',
          selected: false,
          gender: "male"),
    ]),
    ServiceModel(name: 'Sakal Kesimi', price: 10, selected: false, employees: [
      EmployeeModel(
        image: 'assets/worker_3.png',
        name: 'Nilsu Öz',
        selected: false,
        gender: "female",
      ),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Fatih Özkan',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Bahadır İren',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Semih Gümüş',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Ahmed Akif Kaya',
          selected: false,
          gender: "male"),
    ]),
    ServiceModel(name: 'Saç Boyama', price: 100, selected: false, employees: [
      EmployeeModel(
        image: 'assets/worker_3.png',
        name: 'Nilsu Öz',
        selected: false,
        gender: "female",
      ),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Fatih Özkan',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Bahadır İren',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Semih Gümüş',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Ahmed Akif Kaya',
          selected: false,
          gender: "male"),
    ]),
    ServiceModel(name: 'Manikür', price: 30, selected: false, employees: [
      EmployeeModel(
        image: 'assets/worker_3.png',
        name: 'Nilsu Öz',
        selected: false,
        gender: "female",
      ),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Fatih Özkan',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Bahadır İren',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Semih Gümüş',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Ahmed Akif Kaya',
          selected: false,
          gender: "male"),
    ]),
    ServiceModel(name: 'Pedikür', price: 30, selected: false, employees: [
      EmployeeModel(
        image: 'assets/worker_3.png',
        name: 'Nilsu Öz',
        selected: false,
        gender: "female",
      ),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Fatih Özkan',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Bahadır İren',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Semih Gümüş',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Ahmed Akif Kaya',
          selected: false,
          gender: "male"),
    ]),
    ServiceModel(name: 'Perma', price: 100, selected: false, employees: [
      EmployeeModel(
        image: 'assets/worker_3.png',
        name: 'Nilsu Öz',
        selected: false,
        gender: "female",
      ),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Fatih Özkan',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Bahadır İren',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Semih Gümüş',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Ahmed Akif Kaya',
          selected: false,
          gender: "male"),
    ]),
    ServiceModel(name: 'Saç Bakımı', price: 50, selected: false, employees: [
      EmployeeModel(
        image: 'assets/worker_3.png',
        name: 'Nilsu Öz',
        selected: false,
        gender: "female",
      ),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Fatih Özkan',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Bahadır İren',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_1.png',
          name: 'Semih Gümüş',
          selected: false,
          gender: "male"),
      EmployeeModel(
          image: 'assets/worker_2.jpg',
          name: 'Ahmed Akif Kaya',
          selected: false,
          gender: "male"),
    ]),
  ];

  ///Opens the employee selection row if selected
  ///=> used in coiffure_detail card
  ///=> Hizmetler Card
  bool serviceSelected = false;
  changeSelectedService(int index) {
    fullTimeServices[index].selected = !fullTimeServices[index].selected;
    calculateTotalPrice();
    notifyListeners();
  }

  ServiceModel defaultService =
      ServiceModel(name: 'Hizmet Adı', price: 20, selected: false, employees: [
    EmployeeModel(
      image: 'assets/worker_3.png',
      name: 'Nilsu Öz',
      selected: false,
      gender: "female",
    ),
    EmployeeModel(
        image: 'assets/worker_1.png',
        name: 'Fatih Özkan',
        selected: false,
        gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg',
        name: 'Bahadır İren',
        selected: false,
        gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png',
        name: 'Semih Gümüş',
        selected: false,
        gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg',
        name: 'Ahmed Akif Kaya',
        selected: false,
        gender: "male"),
  ]);

  EmployeeModel defaultEmployee = EmployeeModel(
    image: 'assets/default_employee.jpg',
    name: 'Çalışan Ekle',
    selected: false,
    gender: "female",
  );

  removeEmployeeFromService(int serviceIndex, int employeeIndex) {
    fullTimeServices[serviceIndex].employees.removeAt(employeeIndex);
    notifyListeners();
  }

  ///Calculates the total price everytime we change something
  ///=> used in coiffure_detail card
  ///=> Hizmetler Card
  int total = 0;
  calculateTotalPrice() {
    total = 0;
    for (ServiceModel x in fullTimeServices) {
      if (x.selected == true) {
        total += x.price;
      }
    }
    notifyListeners();
  }

  calculateTotalPrice2(int price) {
    total += price;
    print(total);
    notifyListeners();
  }

  ///Chooses the selected employee and discards the others
  ///=> used in coiffure_detail card
  changeSelectedEmployee(int serviceIndex, int index) {
    for (EmployeeModel y in fullTimeServices[serviceIndex].employees) {
      if (y == fullTimeServices[serviceIndex].employees[index]) {
        y.selected = !y.selected;
      } else {
        y.selected = false;
      }
    }
    notifyListeners();
  }

  addService() {
    fullTimeServices.add(ServiceModel(
        name: 'Hizmeti Giriniz',
        price: 20,
        selected: false,
        employees: [
          EmployeeModel(
            image: 'assets/worker_3.png',
            name: 'Nilsu Öz',
            selected: false,
            gender: "female",
          ),
          EmployeeModel(
              image: 'assets/worker_1.png',
              name: 'Fatih Özkan',
              selected: false,
              gender: "male"),
          EmployeeModel(
              image: 'assets/worker_2.jpg',
              name: 'Bahadır İren',
              selected: false,
              gender: "male"),
          EmployeeModel(
              image: 'assets/worker_1.png',
              name: 'Semih Gümüş',
              selected: false,
              gender: "male"),
          EmployeeModel(
              image: 'assets/worker_2.jpg',
              name: 'Ahmed Akif Kaya',
              selected: false,
              gender: "male"),
        ]));
    notifyListeners();
  }

  deleteService(int index) {
    fullTimeServices.remove(fullTimeServices[index]);
    notifyListeners();
  }

  setEmployee(int serviceIndex, int employeeIndex) {
    fullTimeServices[serviceIndex]
        .employees
        .insert(0, employeesList[employeeIndex]);
    notifyListeners();
  }

  ///Stores selected information about appointment
  ///=> screens.coiffure_detail_page
  ///=> 'Saati Belirle' button

  List<AppointmentInfo> servicesAndEmployees = [];
  getServicesWithEmployee() {
    servicesAndEmployees.clear();
    for (ServiceModel x in fullTimeServices) {
      int index = fullTimeServices.indexOf(x);
      if (x.selected == true) {
        int counter = 0;
        for (EmployeeModel y in fullTimeServices[index].employees) {
          if (y.selected == true) {
            counter--;
            bool isNew = true;
            for (AppointmentInfo z in servicesAndEmployees) {
              if (z.service == x.name) {
                z.employee = y.name;
                isNew = false;
              }
            }
            if (isNew) {
              servicesAndEmployees.add(
                AppointmentInfo(
                  service: x.name,
                  employee: y.name,
                  availability: [
                    Availability(time: '10:00 - 10:30', selected: false),
                    Availability(time: '10:30 - 11:00', selected: false),
                    Availability(time: '11:30 - 12:00', selected: false),
                    Availability(time: '12:00 - 12:30', selected: false),
                    Availability(time: '12:30 - 13:00', selected: false),
                    Availability(time: '13:30 - 14:00', selected: false),
                    Availability(time: '14:00 - 14:30', selected: false),
                    Availability(time: '15:00 - 15:30', selected: false)
                  ],
                  time: '',
                  dateTime: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day),
                ),
              );
            }
          } else if (y.selected == false) {
            counter++;
          }

          /// Assigning random employees.
          if (counter == fullTimeServices[index].employees.length) {
            // print(fullTimeServices[index].employees.length);
            var random = Random();
            String y = employeesList[random.nextInt(employeesList.length)].name;
            servicesAndEmployees.add(
              AppointmentInfo(
                service: x.name,
                employee: y,
                availability: [
                  Availability(time: '10:00 - 10:30', selected: false),
                  Availability(time: '10:30 - 11:00', selected: false),
                  Availability(time: '11:30 - 12:00', selected: false),
                  Availability(time: '12:00 - 12:30', selected: false),
                  Availability(time: '12:30 - 13:00', selected: false),
                  Availability(time: '13:30 - 14:00', selected: false),
                  Availability(time: '14:00 - 14:30', selected: false),
                  Availability(time: '15:00 - 15:30', selected: false)
                ],
                time: '',
                dateTime: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day),
              ),
            );
          }
        }
      }
    }
    setInitialTime();
  }

  setInitialTime() {
    int lastI = 0;
    for (AppointmentInfo x in servicesAndEmployees) {
      bool checked = false;

      for (int i = (lastI % 8); i < 8; i++) {
        if (checked == false) {
          if (x.availability[i].selected == false) {
            x.availability[i].selected = true;
            lastI = i + 1;
            checked = true;
          } else {
            lastI = i + 1;
            checked = true;
          }
        } else {
          x.availability[i].selected = false;
        }
      }
    }

    /// Saat secmeden ilerlmeyi sagliyor
    getAvailableData(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
    );
  }

  ///calendar_page
  List<AvailabilityData> availableDataList = [];
  AvailabilityData availability;
  getAvailableData(DateTime date) {
    bool check = false;
    for (AvailabilityData x in availableDataList) {
      if (x.dateTime.day == date.day) {
        for (AppointmentInfo y in servicesAndEmployees) {
          if (x.service == y.service) {
            y.availability = x.availability;
            check = true;
          }
        }
      }
    }
    if (check == false) {
      for (AppointmentInfo y in servicesAndEmployees) {
        if (y.dateTime.day == DateTime.now().day) {
          availability = AvailabilityData(
              dateTime: y.dateTime,
              service: y.service,
              availability: y.availability);
          availableDataList.add(availability);
        }
        availability = AvailabilityData(
          dateTime: date,
          service: y.service,
          availability: [
            Availability(time: '10:00 - 10:30', selected: false),
            Availability(time: '10:30 - 11:00', selected: false),
            Availability(time: '11:30 - 12:00', selected: false),
            Availability(time: '12:00 - 12:30', selected: false),
            Availability(time: '12:30 - 13:00', selected: false),
            Availability(time: '13:30 - 14:00', selected: false),
            Availability(time: '14:00 - 14:30', selected: false),
            Availability(time: '15:00 - 15:30', selected: false)
          ],
        );

        availableDataList.add(availability);
        y.availability = availability.availability;
      }
      setInitialTime();
    }
    for (AppointmentInfo x in servicesAndEmployees) {
      for (int i = 0; i < 8; i++) {
        if (x.availability[i].selected == true) {
          x.time = x.availability[i].time;
        }
      }
    }
    notifyListeners();
  }

  List<Appointment> appointments = [];

  ///add the final appointment to the appointments list
  setFinalAppointment() {
    appointments.add(Appointment(
        appointment: List.from(servicesAndEmployees),
        name: coiffureName,
        price: total));
    print(servicesAndEmployees.length);
    notifyListeners();
  }

  List favorites = [];

  ///adds or deletes the coiffure from favorites
  setOrChangeFav(coiffureModel) {
    if (favorites.contains(coiffureModel)) {
      favorites.remove(coiffureModel);
    } else {
      favorites.add(coiffureModel);
    }
    notifyListeners();
  }

  ///Gets coiffure information from Firebase
  ///=> used in loading_page
  List<CoiffureModel> coiffureList = [
    CoiffureModel.fromJson({
      "Adres": "Bağdat Cad. No:157/1 Selamiçeşme Köşemiz Apt.",
      "Cinsiyet": "Kadın",
      "Değerl": 591,
      "Hakkında":
          "Mesleğine 1985 yılında Nişantaşı Mehmet Hüseyin Salonlarında başlayan Bekir Özdemir, kariyerini en iyi yıllarını bu salonlarında sürdürdü. Bu süreçte önde gelen modacıların defilelerinde, çekimlerinde ve şovlarında saç, makyaj ve kostüm üzerine stil danışmanlığı ve uygulamacılığı yaptı.1999 Loreal tropy ulusal renk kupasını en güzel kızılı ile bu başarı hak etti. Aynı sene içerinde paristeki bir çok kuaför dergisinde sergilenen kızılı Paris'te büyük beğeni topladı.Bu büyük başarıdan sonra pariste 1 sene en iyi kuaförlerle çalışarak bir çok yenilik ve tecrübe kazandı. 2008 yılında dünyada 1 numaralı kesim eğitimi uzmanı olan Toni&Guy Academy de 6 aylık zorlu maratonunu üstün başarıyla tamamlayarak Toni&Guy Academy sertifikasını almaya hak kazAndı. Çeşitli tarihlerde İzmir, Denizli ve Ege Bölgesi nde kalabalık kuaför topluluklarına eğitimlere katıldı. Her sene sonunda paris e giderek büyük fuarlara katıldı, yeni saç ve makyaj stillerini inceleyerek, kendini sürekli geliştirdi. Eğitimci, uygulamacı, girişimci ve yenilikçi kimliği ile Bekir Özdemir ve bu doğrultuda, kendi oluşturup eğittiği ekibi ile yeni markaları SİLVER Kuaför ile hizmete devam ediyor. Bunun yanı sıra farklı makas tekniklerini kullanararak yıkanmış,taranamayan,yıpranmış,röfle ve ombreli saçları özel tekniklerle temizleyen bir saç teknolojisini Türkiye'de ilk ve tek kullanan saç akademisidir. Bu teknik sonrasında saçlarınızda dökülme duruyor,kırıklar yok oluyor,parlaklığı ve hacimlenmesi artıyor,güçsüz saçlarınızın yüksek derecede volumlendiğini hissediyorsunuz. Resimlerimizi incelediğinizde güçsüz ve taranamayan saçlarınızın uygulanan teknik sonrasında nasıl canlandığını net olarak göreceksiniz. Sizi Bekir Özdemir'in tecrübelerinden faydalanmanız için Bağdat Caddesi'ndeki salonumuza davet ediyoruz. Emre Barış Çakır baba mesleği olan kuaförlüğe erken yaşlarda başladı,küçükken en büyük hayali yaratıcı ve başarılı bir kuaför olmaktı,bir taraftan eğitim hayatına devam ederken diğer taraftan da hayalinin peşinden koşmaya başladı,askerlik sürecine kadar 5 yıl Bağdat Caddesinde Burhan Kuaför'de çalışmaya devam etti.Askerlik sonrasında hayallerini mesleki deneyimi ile birleştiren Emre yönünü yükseklere doğru çevirdi,Sırasıyla Toprak Şeker,Creative 216 gibi sektörün önemli lokomotiflerinden olan işletmelerde çalıştı.Bu süreçte yurt içi ve yurt dışında önemli kesim ve renklendirme eğitimlerine katılıp dünya yeni saç modasını yakından takip etti,Şimdi ise sektörün duayen isimlerinden olan Bekir Özdemir'le yeni bir birlikteliğe imza atan Emre Barış Çakır büyük aşkı olan renklendirme tekniklerini siz değerli müşterilerini yeni salonunda ağırlamaktan büyük bir gurur ve mutluluk duyuyor. Siz değerli hanımlar işini aşk ile yapan bu iki önemli sanatçının koltuğuna oturmak için salonumuza davetlisiniz.",
      "Ort Fiyat": 100,
      "Saatler": "09:00-19:00",
      "Telefon": "(0850) 303 61 86",
      "UniqueId": "15222",
      "Yıldız": 4.9,
      "İl": "İstanbul",
      "İlçe": "Kadıköy",
      "İsim": "Silver Hair Studio Bekir Özdemir & Emre Barış Çakır"
    }, 0),
    CoiffureModel.fromJson({
      "Adres": "Bağdat Cad. No:157/1 Selamiçeşme Köşemiz Apt.",
      "Cinsiyet": "Kadın",
      "Değerl": 591,
      "Hakkında":
          "Mesleğine 1985 yılında Nişantaşı Mehmet Hüseyin Salonlarında başlayan Bekir Özdemir, kariyerini en iyi yıllarını bu salonlarında sürdürdü. Bu süreçte önde gelen modacıların defilelerinde, çekimlerinde ve şovlarında saç, makyaj ve kostüm üzerine stil danışmanlığı ve uygulamacılığı yaptı.1999 Loreal tropy ulusal renk kupasını en güzel kızılı ile bu başarı hak etti. Aynı sene içerinde paristeki bir çok kuaför dergisinde sergilenen kızılı Paris'te büyük beğeni topladı.Bu büyük başarıdan sonra pariste 1 sene en iyi kuaförlerle çalışarak bir çok yenilik ve tecrübe kazandı. 2008 yılında dünyada 1 numaralı kesim eğitimi uzmanı olan Toni&Guy Academy de 6 aylık zorlu maratonunu üstün başarıyla tamamlayarak Toni&Guy Academy sertifikasını almaya hak kazAndı. Çeşitli tarihlerde İzmir, Denizli ve Ege Bölgesi nde kalabalık kuaför topluluklarına eğitimlere katıldı. Her sene sonunda paris e giderek büyük fuarlara katıldı, yeni saç ve makyaj stillerini inceleyerek, kendini sürekli geliştirdi. Eğitimci, uygulamacı, girişimci ve yenilikçi kimliği ile Bekir Özdemir ve bu doğrultuda, kendi oluşturup eğittiği ekibi ile yeni markaları SİLVER Kuaför ile hizmete devam ediyor. Bunun yanı sıra farklı makas tekniklerini kullanararak yıkanmış,taranamayan,yıpranmış,röfle ve ombreli saçları özel tekniklerle temizleyen bir saç teknolojisini Türkiye'de ilk ve tek kullanan saç akademisidir. Bu teknik sonrasında saçlarınızda dökülme duruyor,kırıklar yok oluyor,parlaklığı ve hacimlenmesi artıyor,güçsüz saçlarınızın yüksek derecede volumlendiğini hissediyorsunuz. Resimlerimizi incelediğinizde güçsüz ve taranamayan saçlarınızın uygulanan teknik sonrasında nasıl canlandığını net olarak göreceksiniz. Sizi Bekir Özdemir'in tecrübelerinden faydalanmanız için Bağdat Caddesi'ndeki salonumuza davet ediyoruz. Emre Barış Çakır baba mesleği olan kuaförlüğe erken yaşlarda başladı,küçükken en büyük hayali yaratıcı ve başarılı bir kuaför olmaktı,bir taraftan eğitim hayatına devam ederken diğer taraftan da hayalinin peşinden koşmaya başladı,askerlik sürecine kadar 5 yıl Bağdat Caddesinde Burhan Kuaför'de çalışmaya devam etti.Askerlik sonrasında hayallerini mesleki deneyimi ile birleştiren Emre yönünü yükseklere doğru çevirdi,Sırasıyla Toprak Şeker,Creative 216 gibi sektörün önemli lokomotiflerinden olan işletmelerde çalıştı.Bu süreçte yurt içi ve yurt dışında önemli kesim ve renklendirme eğitimlerine katılıp dünya yeni saç modasını yakından takip etti,Şimdi ise sektörün duayen isimlerinden olan Bekir Özdemir'le yeni bir birlikteliğe imza atan Emre Barış Çakır büyük aşkı olan renklendirme tekniklerini siz değerli müşterilerini yeni salonunda ağırlamaktan büyük bir gurur ve mutluluk duyuyor. Siz değerli hanımlar işini aşk ile yapan bu iki önemli sanatçının koltuğuna oturmak için salonumuza davetlisiniz.",
      "Ort Fiyat": 100,
      "Saatler": "09:00-19:00",
      "Telefon": "(0850) 303 61 86",
      "UniqueId": "15222",
      "Yıldız": 4.9,
      "İl": "İstanbul",
      "İlçe": "Kadıköy",
      "İsim": "Silver Hair Studio Bekir Özdemir & Emre Barış Çakır"
    }, 0),
    CoiffureModel.fromJson({
      "Adres": "Bağdat Cad. No:157/1 Selamiçeşme Köşemiz Apt.",
      "Cinsiyet": "Kadın",
      "Değerl": 591,
      "Hakkında":
          "Mesleğine 1985 yılında Nişantaşı Mehmet Hüseyin Salonlarında başlayan Bekir Özdemir, kariyerini en iyi yıllarını bu salonlarında sürdürdü. Bu süreçte önde gelen modacıların defilelerinde, çekimlerinde ve şovlarında saç, makyaj ve kostüm üzerine stil danışmanlığı ve uygulamacılığı yaptı.1999 Loreal tropy ulusal renk kupasını en güzel kızılı ile bu başarı hak etti. Aynı sene içerinde paristeki bir çok kuaför dergisinde sergilenen kızılı Paris'te büyük beğeni topladı.Bu büyük başarıdan sonra pariste 1 sene en iyi kuaförlerle çalışarak bir çok yenilik ve tecrübe kazandı. 2008 yılında dünyada 1 numaralı kesim eğitimi uzmanı olan Toni&Guy Academy de 6 aylık zorlu maratonunu üstün başarıyla tamamlayarak Toni&Guy Academy sertifikasını almaya hak kazAndı. Çeşitli tarihlerde İzmir, Denizli ve Ege Bölgesi nde kalabalık kuaför topluluklarına eğitimlere katıldı. Her sene sonunda paris e giderek büyük fuarlara katıldı, yeni saç ve makyaj stillerini inceleyerek, kendini sürekli geliştirdi. Eğitimci, uygulamacı, girişimci ve yenilikçi kimliği ile Bekir Özdemir ve bu doğrultuda, kendi oluşturup eğittiği ekibi ile yeni markaları SİLVER Kuaför ile hizmete devam ediyor. Bunun yanı sıra farklı makas tekniklerini kullanararak yıkanmış,taranamayan,yıpranmış,röfle ve ombreli saçları özel tekniklerle temizleyen bir saç teknolojisini Türkiye'de ilk ve tek kullanan saç akademisidir. Bu teknik sonrasında saçlarınızda dökülme duruyor,kırıklar yok oluyor,parlaklığı ve hacimlenmesi artıyor,güçsüz saçlarınızın yüksek derecede volumlendiğini hissediyorsunuz. Resimlerimizi incelediğinizde güçsüz ve taranamayan saçlarınızın uygulanan teknik sonrasında nasıl canlandığını net olarak göreceksiniz. Sizi Bekir Özdemir'in tecrübelerinden faydalanmanız için Bağdat Caddesi'ndeki salonumuza davet ediyoruz. Emre Barış Çakır baba mesleği olan kuaförlüğe erken yaşlarda başladı,küçükken en büyük hayali yaratıcı ve başarılı bir kuaför olmaktı,bir taraftan eğitim hayatına devam ederken diğer taraftan da hayalinin peşinden koşmaya başladı,askerlik sürecine kadar 5 yıl Bağdat Caddesinde Burhan Kuaför'de çalışmaya devam etti.Askerlik sonrasında hayallerini mesleki deneyimi ile birleştiren Emre yönünü yükseklere doğru çevirdi,Sırasıyla Toprak Şeker,Creative 216 gibi sektörün önemli lokomotiflerinden olan işletmelerde çalıştı.Bu süreçte yurt içi ve yurt dışında önemli kesim ve renklendirme eğitimlerine katılıp dünya yeni saç modasını yakından takip etti,Şimdi ise sektörün duayen isimlerinden olan Bekir Özdemir'le yeni bir birlikteliğe imza atan Emre Barış Çakır büyük aşkı olan renklendirme tekniklerini siz değerli müşterilerini yeni salonunda ağırlamaktan büyük bir gurur ve mutluluk duyuyor. Siz değerli hanımlar işini aşk ile yapan bu iki önemli sanatçının koltuğuna oturmak için salonumuza davetlisiniz.",
      "Ort Fiyat": 100,
      "Saatler": "09:00-19:00",
      "Telefon": "(0850) 303 61 86",
      "UniqueId": "15222",
      "Yıldız": 4.9,
      "İl": "İstanbul",
      "İlçe": "Kadıköy",
      "İsim": "Silver Hair Studio Bekir Özdemir & Emre Barış Çakır"
    }, 0),
    CoiffureModel.fromJson({
      "Adres": "Bağdat Cad. No:157/1 Selamiçeşme Köşemiz Apt.",
      "Cinsiyet": "Kadın",
      "Değerl": 591,
      "Hakkında":
          "Mesleğine 1985 yılında Nişantaşı Mehmet Hüseyin Salonlarında başlayan Bekir Özdemir, kariyerini en iyi yıllarını bu salonlarında sürdürdü. Bu süreçte önde gelen modacıların defilelerinde, çekimlerinde ve şovlarında saç, makyaj ve kostüm üzerine stil danışmanlığı ve uygulamacılığı yaptı.1999 Loreal tropy ulusal renk kupasını en güzel kızılı ile bu başarı hak etti. Aynı sene içerinde paristeki bir çok kuaför dergisinde sergilenen kızılı Paris'te büyük beğeni topladı.Bu büyük başarıdan sonra pariste 1 sene en iyi kuaförlerle çalışarak bir çok yenilik ve tecrübe kazandı. 2008 yılında dünyada 1 numaralı kesim eğitimi uzmanı olan Toni&Guy Academy de 6 aylık zorlu maratonunu üstün başarıyla tamamlayarak Toni&Guy Academy sertifikasını almaya hak kazAndı. Çeşitli tarihlerde İzmir, Denizli ve Ege Bölgesi nde kalabalık kuaför topluluklarına eğitimlere katıldı. Her sene sonunda paris e giderek büyük fuarlara katıldı, yeni saç ve makyaj stillerini inceleyerek, kendini sürekli geliştirdi. Eğitimci, uygulamacı, girişimci ve yenilikçi kimliği ile Bekir Özdemir ve bu doğrultuda, kendi oluşturup eğittiği ekibi ile yeni markaları SİLVER Kuaför ile hizmete devam ediyor. Bunun yanı sıra farklı makas tekniklerini kullanararak yıkanmış,taranamayan,yıpranmış,röfle ve ombreli saçları özel tekniklerle temizleyen bir saç teknolojisini Türkiye'de ilk ve tek kullanan saç akademisidir. Bu teknik sonrasında saçlarınızda dökülme duruyor,kırıklar yok oluyor,parlaklığı ve hacimlenmesi artıyor,güçsüz saçlarınızın yüksek derecede volumlendiğini hissediyorsunuz. Resimlerimizi incelediğinizde güçsüz ve taranamayan saçlarınızın uygulanan teknik sonrasında nasıl canlandığını net olarak göreceksiniz. Sizi Bekir Özdemir'in tecrübelerinden faydalanmanız için Bağdat Caddesi'ndeki salonumuza davet ediyoruz. Emre Barış Çakır baba mesleği olan kuaförlüğe erken yaşlarda başladı,küçükken en büyük hayali yaratıcı ve başarılı bir kuaför olmaktı,bir taraftan eğitim hayatına devam ederken diğer taraftan da hayalinin peşinden koşmaya başladı,askerlik sürecine kadar 5 yıl Bağdat Caddesinde Burhan Kuaför'de çalışmaya devam etti.Askerlik sonrasında hayallerini mesleki deneyimi ile birleştiren Emre yönünü yükseklere doğru çevirdi,Sırasıyla Toprak Şeker,Creative 216 gibi sektörün önemli lokomotiflerinden olan işletmelerde çalıştı.Bu süreçte yurt içi ve yurt dışında önemli kesim ve renklendirme eğitimlerine katılıp dünya yeni saç modasını yakından takip etti,Şimdi ise sektörün duayen isimlerinden olan Bekir Özdemir'le yeni bir birlikteliğe imza atan Emre Barış Çakır büyük aşkı olan renklendirme tekniklerini siz değerli müşterilerini yeni salonunda ağırlamaktan büyük bir gurur ve mutluluk duyuyor. Siz değerli hanımlar işini aşk ile yapan bu iki önemli sanatçının koltuğuna oturmak için salonumuza davetlisiniz.",
      "Ort Fiyat": 100,
      "Saatler": "09:00-19:00",
      "Telefon": "(0850) 303 61 86",
      "UniqueId": "15222",
      "Yıldız": 4.9,
      "İl": "İstanbul",
      "İlçe": "Kadıköy",
      "İsim": "Silver Hair Studio Bekir Özdemir & Emre Barış Çakır"
    }, 0),
  ];
  // DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  Future<List> getAllCoiffures() async {
    //   //TODO - dataSnapShot is not used
    //   DataSnapshot dataSnapshot = await databaseReference.once();
    //   for (int i = 0; i <= 10; i++) {
    //     databaseReference.child('$i').onValue.listen((event) {
    //       coiffureList.add(CoiffureModel.fromJson(event.snapshot.value, i));
    //       print('Data received successfully!');
    //     });
    //   }
      return coiffureList;
  }
  HttpUserFunctions httpUserFunctions = HttpUserFunctions();
  List userList = [];
  Future<List> getAllUsers() async {
    userList.clear();
    var getAllReturnList = await httpUserFunctions.getAllUser();
    for (int i = 0; i < getAllReturnList.length; i++) {
      userList.add(UserModel.fromJson(getAllReturnList[i], i));
    }

    for (UserModel x in userList) {
      print('${x.fullName} : ${x.id}');
    }
    return userList;
  }

  finalDate() {
    notifyListeners();
  }

  String lastDate;

  /// Send mail v2
  sendMail2(String recipients) {
    var options = new YandexSmtpOptions()
      ..username = 'ozet@ayarla.app'
      ..password = 'aa112233';

    var emailTransport = new SmtpTransport(options);

    // Create our mail/envelope.
    var envelope = new Envelope()
      ..from = 'ozet@ayarla.app'
      ..recipients.add(recipients)
      // ..bccRecipients.add('hidden@recipient.com')
      ..subject = 'Testing the Dart Mailer library'
      // ..attachments.add(null)
      ..text = 'This is a cool email message. Whats up?'
      ..html = getHTML();

    // Email it.
    emailTransport
        .send(envelope)
        .then((envelope) => print('Email sent!'))
        .catchError((e) => print('Error occurred: $e'));
  }

  getHTML() {
    List returnList = createSummaryBody();
    String summaryFinal = '';
    for (int i = 0; i < returnList.length; i++) {
      summaryFinal = '$summaryFinal' + '${returnList[i]}';
    }

    String context = '<html>'
        '<body>'
        '</div>'
        '<img src="https://bcm.ist/images/png.png" width="350px">'
        '<div align="center" style="border-style: outset; width: 350px; position: fixed; left: 30%; padding-left:10px; padding-right:10px; padding-top:10px;">'
        '<div>$coiffureName</div>'
        '<div>Randevu Talebiniz Alınmıştır.</div>'
        '<div>İşletmeden Onay Bekleniyor.</div>'
        '<div><b>Gün: $lastDate</b></div>'
        '<div><b>Saat: ${servicesAndEmployees[0].time}<b/></div>'
        '<hr>'
        '<div align="left"> $summaryFinal</div>'
        '<table style="width:100%">'
        '<tr>'
        '<td align="left">Toplam:</td>'
        '<td> </td>'
        '<td align="right"> $total TL</td>'
        ' </tr>'
        '</table>'
        '<div>AYARLA her gün genişleyen işletme ağı ile ve çok yakında randevu gerektiren diğer sektörlerde de benzer kullanıcı deneyimi ile hizmetinizde.</div>'
        '</div>'
        '</body>'
        '</html>';
    return context;
  }

  createSummaryBody() {
    List holder = [];
    List priceList = [];
    for (int i = 0; i < servicesAndEmployees.length; i++) {
      for (int j = 0; j < fullTimeServices.length; j++) {
        if (fullTimeServices[j]
            .name
            .contains(servicesAndEmployees[i].service)) {
          priceList.add(fullTimeServices[j].price);
          // print(priceList);
        }
      }
    }

    for (int i = 0; i < servicesAndEmployees.length; i++) {
      holder.add('<table style="width:100%">'
          '<tr>'
          '<td>Saat:</td>'
          '<td align="center">${servicesAndEmployees[i].time}</td>'
          '</tr>'
          '<tr>'
          '<td>Hizmet:</td>'
          '<td align="center">${servicesAndEmployees[i].service}</td>'
          '<td align="end">${priceList[i]} TL</td>'
          '</tr>'
          '<tr>'
          '<td>Çalışan:</td>'
          '<td align="center">${servicesAndEmployees[i].employee}</td>'
          '</tr>'
          '</table>'
          '<hr>');
    }
    return holder;
  }

  bool isConfirmed = false;
  confirmation() {
    isConfirmed = !isConfirmed;
    setFinalAppointment();
    notifyListeners();
  }

  List<Notes> managerNotes = [];
  List<MessageBubble> messages = [];

  /// for manager pages & trial vers.
  List currentList;
  setList(List list) {
    currentList = list;
    notifyListeners();
  }

  List currentList2;
  setList2(List list) {
    currentList2 = list;
    notifyListeners();
  }

  State myState = SearchPage().createState();
}

class Notes {
  String notes;
  final int index;

  Notes({this.notes, this.index});
}
