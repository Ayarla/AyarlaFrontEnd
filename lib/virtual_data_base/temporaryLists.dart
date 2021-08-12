import 'package:ayarla/components/image/imageListItem.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';

List<ImageListItem> images = [
  ImageListItem(image: "assets/kuafor_0.png", covered: true),
  ImageListItem(image: "assets/kuafor_1.jpg", covered: true),
  ImageListItem(image: "assets/kuafor_2.jpg", covered: true),
];

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
  EmployeeModel(name: 'Nilsu Öz', image: 'assets/worker_3.png', gender: 'female', selected: false),
  EmployeeModel(image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: 'male'),
  EmployeeModel(
      image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: 'male'),
  EmployeeModel(image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: 'male'),
  EmployeeModel(
      image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: 'male'),
];

///fullTimeService List
///=> used in coiffure_detail card
///TODO halfTime services should be added.
List<ServiceModel> fullTimeServices = [
  ServiceModel(name: 'Saç Kesimi', price: 20, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
  ServiceModel(name: 'Sakal Kesimi', price: 10, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
  ServiceModel(name: 'Saç Boyama', price: 100, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
  ServiceModel(name: 'Manikür', price: 30, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
  ServiceModel(name: 'Pedikür', price: 30, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
  ServiceModel(name: 'Perma', price: 100, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
  ServiceModel(name: 'Saç Bakımı', price: 50, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
];

ServiceModel defaultService =
    ServiceModel(name: 'Hizmet Adı', price: 20, selected: false, employees: [
  EmployeeModel(
    image: 'assets/worker_3.png',
    name: 'Nilsu Öz',
    selected: false,
    gender: "female",
  ),
  EmployeeModel(image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
  EmployeeModel(
      image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
  EmployeeModel(image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
  EmployeeModel(
      image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
]);

EmployeeModel defaultEmployee = EmployeeModel(
  image: 'assets/default_employee.jpg',
  name: 'Çalışan Ekle',
  selected: false,
  gender: "female",
);

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
