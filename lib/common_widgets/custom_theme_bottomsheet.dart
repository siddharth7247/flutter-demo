import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo/theme/theme_priview_screen.dart';

enum Themes { light, dark }

enum Colors1 { deepPurple, green, orange }

enum AppbarColor { deepPurple, green, orange }

enum TextColor { black, orange }

class CustomThemeData {
  bool? isLightTheme;
  Color? primaryColor;
  bool? isCenterTitle;
  Color? appbarColor;
  Color? textColor;
  double? contrastLevel;
}

StreamController<bool> isLightTheme = StreamController();
StreamController<CustomThemeData> customThemeData = StreamController();

class CustomThemeBottomsheet extends StatefulWidget {
  const CustomThemeBottomsheet({super.key});

  @override
  State<CustomThemeBottomsheet> createState() => _CustomThemeBottomsheetState();
}

class _CustomThemeBottomsheetState extends State<CustomThemeBottomsheet> {
  Themes selectedTheme = Themes.light;
  Colors1 selectedColor = Colors1.deepPurple;
  AppbarColor appbarColor = AppbarColor.deepPurple;
  TextColor _textColor = TextColor.black;
  double _value = 0.5;
  bool centerTitle = false;
  Color? _primaryColor;
  Color? _appBarColor;
  double? _contrastLevel;
  Color? textColor;
  bool? isDarkTheme = false;
  bool? isCenterTitle = false;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (BuildContext content) {
          return Container(
            height: 700,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    ' --------- Costmize Your Theme --------',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Select Primary Color'),
                  ListTile(
                    title: const Text('Purple'),
                    leading: Radio(
                        value: Colors1.deepPurple,
                        groupValue: selectedColor,
                        onChanged: (Colors1? value) {
                          setState(() {
                            selectedColor = value!;
                            _primaryColor = Colors.deepPurple;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text('Green'),
                    leading: Radio(
                        value: Colors1.green,
                        groupValue: selectedColor,
                        onChanged: (Colors1? value) {
                          setState(() {
                            selectedColor = value!;
                            _primaryColor = Colors.green;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text('Orange'),
                    leading: Radio(
                        value: Colors1.orange,
                        groupValue: selectedColor,
                        onChanged: (Colors1? value) {
                          setState(() {
                            selectedColor = value!;
                            _primaryColor = Colors.orange;
                          });
                        }),
                  ),
                  const Text('Select Theme Mode'),
                  ListTile(
                    title: const Text('Light'),
                    leading: Radio(
                        value: Themes.light,
                        groupValue: selectedTheme,
                        onChanged: (Themes? value) {
                          setState(() {
                            selectedTheme = value!;
                            isDarkTheme = false;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text('Dark'),
                    leading: Radio(
                        value: Themes.dark,
                        groupValue: selectedTheme,
                        onChanged: (Themes? value) {
                          setState(() {
                            selectedTheme = value!;
                            isDarkTheme = true;
                          });
                        }),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: centerTitle,
                          onChanged: (bool? value) {
                            setState(() {
                              centerTitle = value!;
                              isCenterTitle = true;
                            });
                          }),
                      const Text('Center Appbar Title')
                    ],
                  ),
                  const Text('Select Appbar Color'),
                   ListTile(
                    title: const Text('Purple'),
                    leading: Radio(
                        value: AppbarColor.deepPurple,
                        groupValue: appbarColor,
                        onChanged: (AppbarColor? value) {
                          setState(() {
                            appbarColor = value!;
                            _appBarColor = Colors.deepPurple;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text('Green'),
                    leading: Radio(
                        value: AppbarColor.green,
                        groupValue: appbarColor,
                        onChanged: (AppbarColor? value) {
                          setState(() {
                            appbarColor = value!;
                            _appBarColor = Colors.green;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text('Orange'),
                    leading: Radio(
                        value: AppbarColor.orange,
                        groupValue: appbarColor,
                        onChanged: (AppbarColor? value) {
                          setState(() {
                            appbarColor = value!;
                            _appBarColor = Colors.deepOrange;
                          });
                        }),
                  ),
                  const Text('Select Appbar Text Color'),
                  ListTile(
                    title: const Text('Black'),
                    leading: Radio(
                        value: TextColor.black,
                        groupValue: _textColor,
                        onChanged: (TextColor? value) {
                          setState(() {
                            _textColor = value!;
                            textColor = Colors.black;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text('Orange'),
                    leading: Radio(
                        value: TextColor.orange,
                        groupValue: _textColor,
                        onChanged: (TextColor? value) {
                          setState(() {
                            _textColor = value!;
                            textColor = Colors.orange;
                          });
                        }),
                  ),
                  const Text('Selecet App Contrast'),
                  Slider(
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          _contrastLevel = value;
                        });
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            var themeData = ThemeData(
                              useMaterial3: true,
                              colorScheme: ColorScheme.fromSeed(
                                seedColor: _primaryColor ?? Colors.deepPurple,
                                brightness: (isDarkTheme!) ? Brightness.dark : Brightness.light,
                              ),
                              primaryColor: _primaryColor,
                              appBarTheme: AppBarTheme(
                                backgroundColor: _appBarColor,
                                centerTitle: isCenterTitle,
                                titleTextStyle: TextStyle(color: textColor,fontSize: 25)
                              ),
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ThemePriviewScreen(
                                    themeData: themeData,
                                    onTap: () {
                                      CustomThemeData t1 = CustomThemeData();
                                      t1.isLightTheme = isDarkTheme;
                                      t1.primaryColor = _primaryColor;
                                      t1.isCenterTitle = isCenterTitle;
                                      t1.appbarColor = _appBarColor;
                                      t1.textColor = textColor;
                                      t1.contrastLevel = _contrastLevel;
                                      customThemeData.add(t1);
                                      Navigator.of(context)..pop()..pop();
                                    },
                                  ),
                                ));
                          },
                          child: const Text('Preiview')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Apply')),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
