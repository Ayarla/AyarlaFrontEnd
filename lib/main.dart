import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';
import 'package:ayarla/virtual_data_base/genderSelection.dart';
import 'package:ayarla/virtual_data_base/login.dart';
import 'constants/router.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  Routers.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      highlightColor: Colors.white.withOpacity(0.25),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        splashColor: Colors.white.withOpacity(0.25),
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppointmentData>(
            create: (context) => AppointmentData()),
        ChangeNotifierProvider<GenderSelection>(
            create: (context) => GenderSelection()),
        ChangeNotifierProvider<Login>(create: (context) => Login()),
        ChangeNotifierProvider<BusinessAndUserData>(
            create: (context) => BusinessAndUserData()),
      ],
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routers.router.generator,
        initialRoute: "/",

        /// General route definitions that are defined in "this" MaterialApp.
        // routes: {
        //   LoadingScreen.id: (context) => LoadingScreen(),
        //   WelcomePage.id: (context) => WelcomePage(),
        //   CoiffureDetailPage.id: (context) => CoiffureDetailPage(),
        //   // CalenderPage.id: (context) => CalenderPage(),
        //   ConfirmationPage.id: (context) => ConfirmationPage(),
        //   SearchPage.id: (context) => SearchPage(),
        //   GalleryPage.id: (context) => GalleryPage(),
        //   CommentsPage.id: (context) => CommentsPage(),
        //   UserPage.id: (context) => UserPage(),
        //   ManagerHome.id: (context) => ManagerHome(),
        //   EmployeePage.id: (context) => EmployeePage(),
        //   EmployeeWorkPage.id: (context) => EmployeeWorkPage(),
        //   EmployeeManagement.id: (context) => EmployeeManagement(),
        //   BusinessInfoPage.id: (context) => BusinessInfoPage(),
        //   FavoritesPage.id: (context) => FavoritesPage(),
        //   AppointmentsPage.id: (context) => AppointmentsPage(),
        //   PastAppointmentsPage.id: (context) => PastAppointmentsPage(),
        //   EditProfilePage.id: (context) => EditProfilePage(),
        //   ManagerNotesPage.id: (context) => ManagerNotesPage(),
        //   ManagerNotes.id: (context) => ManagerNotes(),
        //   ManagerSendMessage.id: (context) => ManagerSendMessage(),
        //   GoogleMapSample.id: (context) => GoogleMapSample()
        // },
      ),
    );
  }
}
