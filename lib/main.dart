import 'package:flutter/material.dart';
import 'package:flutter_demo/api/api_demo.dart';
import 'package:flutter_demo/dio-http/dio_demo_screen.dart';
import 'package:flutter_demo/dio-http/image_upload_demo.dart';
import 'package:flutter_demo/hive/hive_demo_screen.dart';
import 'package:flutter_demo/models/userModel.dart';
import 'package:flutter_demo/show_student_screen.dart';
import 'package:flutter_demo/sql-light/add_employee_screen.dart';
import 'package:flutter_demo/theme/custom_theme_bottomsheet.dart';
import 'package:flutter_demo/cutom-widget_demo.dart';
import 'package:flutter_demo/home_screen.dart';
import 'package:flutter_demo/isolate/isolate_demo.dart';
import 'package:flutter_demo/listview-gridview/listview_demo.dart';
import 'package:flutter_demo/streams/stream_builder_demo.dart';
import 'package:flutter_demo/tabbar_demo.dart';
import 'package:flutter_demo/theme/theme_demo.dart';
import 'package:flutter_demo/widgets_demo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(documentDir.path);
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CustomThemeData themeData;
  Color? appbarColor;
  Color? primarycolor;
  bool isDarkTheme =  false;
  bool isContinsAppbarColor = false;
  Color? textColor;
  double? contrastLevel;
  @override
  void initState() {
    getTheme();
    super.initState();
  }
  void getTheme()async{
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appbarColor = Color(prefs.getInt('AppbarColor')??Colors.deepPurple.value);
    primarycolor = Color(prefs.getInt('PrimaryColor')??Colors.deepPurple.value);
    isDarkTheme = prefs.getBool('IsLightTheme')??false;
    textColor = Color(prefs.getInt('TextColor')??Colors.deepPurple.value);
    contrastLevel = prefs.getDouble('ContrastLevel')??0.5;
  
    CustomThemeData t1 = CustomThemeData();
    t1.appbarColor = appbarColor;
    t1.primaryColor = primarycolor;
    t1.isDarkTheme = isDarkTheme;
    t1.textColor = textColor;
    t1.contrastLevel = contrastLevel;
    customThemeData.add(t1);
  
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CustomThemeData>(
        stream: customThemeData.stream,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(  
                primaryColor: snapshot.data?.primaryColor ?? Colors.deepPurple,
                colorScheme: ColorScheme.fromSeed(
                  brightness: (snapshot.data?.isDarkTheme??false) ?Brightness.dark : Brightness.light,
                  seedColor: snapshot.data?.primaryColor ?? Colors.deepPurple,
                  secondary: Colors.cyan,
                  onPrimary: snapshot.data?.primaryColor ?? Colors.deepPurple,
                  onSecondary: Colors.blue,
                  error: Colors.red,
                  onError: Colors.red,
                  contrastLevel: snapshot.data?.contrastLevel ?? 1.0
                ),
                textTheme: const TextTheme(
                    displayLarge:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    titleLarge:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                    bodyMedium:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                appBarTheme: AppBarTheme(
                  backgroundColor: snapshot.data?.appbarColor,
                  centerTitle:
                      (snapshot.data?.isCenterTitle ?? false) ? true : false,
                  titleTextStyle: TextStyle(
                    color: snapshot.data?.textColor ?? Colors.white,
                    fontSize: 25,
                  ),
                )),
            themeMode: ThemeMode.system,
            initialRoute: '/',
            routes: {
              '/': (context) => const Homescreen(),
              '/widgetsDemoScreen': (context) => const Widgetsdemo(),
              '/tabBarDemoScree': (context) => const TabbarDemo(),
              '/customWidgetDemoScreen': (context) => const CustomWidgetDemo(),
              '/listviewDemoScreen': (context) => const ListViewDemo(),
              '/streamBuilderDemoScreen': (context) => const StreamBuilderDemo(),
              '/themeDemoScreen': (context) => const ThemeDemo(),
              '/isolateDemoScreen': (context) => const IsolateDemoScreen(),
              '/apiDemoScreen' : (context) => const ApiDemoScreen(),
              '/showStudentScreen' : (context) => const ShowStudentScreen(),
              '/addEmployeeScreen' : (context) => const AddEmployeeScreen(),
              '/hiveDemoScreen' : (context) => const HiveDemoScreen(),
              '/httpdioDemoScreen' : (context) => const ImageUploadDemo(),
          },
        );
      }
    );
  }
}
