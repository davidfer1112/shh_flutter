import 'package:flutter/material.dart';
import 'package:app/language/appLocalizations.dart';
import 'package:app/models/setting_list_data.dart';
import 'package:app/providers/theme_provider.dart';
import 'package:app/routes/route_names.dart';
import 'package:app/utils/enum.dart';
import 'package:app/utils/helper.dart';
import 'package:app/utils/text_styles.dart';
import 'package:app/utils/themes.dart';
import 'package:app/widgets/common_appbar_view.dart';
import 'package:app/widgets/common_card.dart';
import 'package:app/widgets/remove_focuse.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with Helper {
  List<SettingsListData> settingsList = SettingsListData.settingsList;
  var country = 'Australia';
  var currency = '\$ AUD';
  int selectedradioTile = 0;
  List<String> data = ["English", "French", "Arabic", "Japanese"];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: RemoveFocuse(
            onClick: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CommonAppbarView(
                  iconData: Icons.arrow_back,
                  onBackClick: () {
                    Navigator.pop(context);
                  },
                  titleText: AppLocalizations(context).of("setting_text"),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 16),
                    itemCount: settingsList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (index == 1) {
                            // MyApp.restartApp(context);
                          } else if (index == 6) {
                            NavigationServices(context)
                                .gotoCurrencyScreen()
                                .then((value) {
                              if (value is String && value != "")
                                setState(() {
                                  currency = value;
                                });
                            });
                          } else if (index == 5) {
                            NavigationServices(context)
                                .gotoCountryScreen()
                                .then((value) {
                              if (value is String && value != "") {
                                setState(() {
                                  country = value;
                                });
                              }
                            });
                          } else if (index == 2) {
                            _getFontPopUI();
                          } else if (index == 3) {
                            _getColorPopUI();
                          } else if (index == 4) {
                            _getLanguageUI();
                          } else if (index == 10) {
                            _gotoSplashScreen();
                          }
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 8, right: 16),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        AppLocalizations(context)
                                            .of(settingsList[index].titleTxt),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  index == 5
                                      ? Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: getTextUi(country))
                                      : index == 6
                                      ? Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: getTextUi(currency),
                                    //   child:
                                  )
                                      : index == 1
                                      ? _themeUI()
                                      : Padding(
                                    padding:
                                    const EdgeInsets.all(16),
                                    child: Container(
                                      child: Icon(
                                          settingsList[index]
                                              .iconData,
                                          color: AppTheme
                                              .secondaryTextColor),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 16, right: 16),
                              child: Divider(
                                height: 1,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _themeUI() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: PopupMenuButton<ThemeModeType>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onSelected: (type) {
          type == ThemeModeType.system
              ? themeProvider.updateThemeMode(ThemeModeType.system)
              : type == ThemeModeType.light
              ? themeProvider.updateThemeMode(ThemeModeType.light)
              : themeProvider.updateThemeMode(ThemeModeType.dark);
          setState(() {});
        },
        icon: Icon(
            themeProvider.themeModeType == ThemeModeType.system
                ? FontAwesomeIcons.adjust
                : themeProvider.themeModeType == ThemeModeType.light
                ? FontAwesomeIcons.cloudSun
                : FontAwesomeIcons.cloudMoon,
            color: AppTheme.secondaryTextColor),
        offset: Offset(10, 18),
        itemBuilder: (context) => [
          ...ThemeModeType.values.toList().map(
                (e) => PopupMenuItem(
              value: e,
              child: _getSelectedUI(
                e == ThemeModeType.system
                    ? FontAwesomeIcons.adjust
                    : e == ThemeModeType.light
                    ? FontAwesomeIcons.cloudSun
                    : FontAwesomeIcons.cloudMoon,
                AppLocalizations(context).of(e.toString().split(".")[1]),
                e == themeProvider.themeModeType,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTextUi(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyles(context).getDescriptionStyle().copyWith(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _getSelectedUI(IconData icon, String text, bool isCurrent) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color:
            isCurrent ? AppTheme.primaryColor : AppTheme.primaryTextColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              text,
              style: TextStyles(context).getRegularStyle().copyWith(
                color: isCurrent
                    ? AppTheme.primaryColor
                    : AppTheme.primaryTextColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  _getFontPopUI() {
    final List<Widget> fontArray = [];
    FontFamilyType.values.toList().forEach(
          (element) {
        fontArray.add(
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                context.read<ThemeProvider>().updateFontType(element);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations(context).of("Hello"),
                      style: AppTheme.getTextStyle(
                        element,
                        TextStyles(context).getRegularStyle().copyWith(
                            color: context.read<ThemeProvider>().fontType ==
                                element
                                ? AppTheme.primaryColor
                                : AppTheme.fontcolor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: FontFamilyType.WorkSans == element ? 3 : 0),
                      child: Text(
                        element.toString().split('.')[1],
                        style: AppTheme.getTextStyle(
                          element,
                          TextStyles(context).getRegularStyle().copyWith(
                              color: context.read<ThemeProvider>().fontType ==
                                  element
                                  ? AppTheme.primaryColor
                                  : AppTheme.fontcolor),
                        ).copyWith(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: CommonCard(
                color: AppTheme.backgroundColor,
                radius: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        AppLocalizations(context).of("selected_fonts"),
                        style: TextStyles(context)
                            .getBoldStyle()
                            .copyWith(fontSize: 22),
                      ),
                    ),
                    Divider(
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              fontArray[0],
                              fontArray[1],
                              fontArray[2],
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              fontArray[3],
                              fontArray[4],
                              fontArray[5],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  _getColorPopUI() {
    final List<Widget> fontArray = [];

    ColorType.values.toList().forEach((element) {
      fontArray.add(
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
            onTap: () {
              context.read<ThemeProvider>().updateColorType(element);
              Navigator.pop(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 48,
                    width: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: context.read<ThemeProvider>().colorType ==
                                element
                                ? AppTheme.getColor(element)
                                : Colors.transparent)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.getColor(element)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: CommonCard(
              color: AppTheme.backgroundColor,
              radius: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      AppLocalizations(context).of("Selected color"),
                      style: TextStyles(context)
                          .getBoldStyle()
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  Divider(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        fontArray[0],
                        fontArray[1],
                        fontArray[2],
                        fontArray[3]
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getLanguageUI() {
    final List<Widget> languageArray = [];
    final list = LanguageType.values.toList();

    list.forEach(
          (element) {
        languageArray.add(
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              context.read<ThemeProvider>().updateLanguage(element);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, bottom: 16, top: 16, right: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  context.read<ThemeProvider>().languageType == element
                      ? Icon(Icons.radio_button_checked)
                      : Icon(Icons.radio_button_off),
                  Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Text(data[element.index]))
                ],
              ),
            ),
          ),
        );
      },
    );
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 240,
            child: CommonCard(
              color: AppTheme.backgroundColor,
              radius: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                    child: Text(
                      AppLocalizations(context).of("Selected language"),
                      style: TextStyles(context)
                          .getBoldStyle()
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  Divider(
                    height: 16,
                  ),
                  for (var item in languageArray) item,
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _gotoSplashScreen() async {
    bool isOk = await showCommonPopup(
      "Are you sure?",
      "You want to Sign Out.",
      context,
      barrierDismissible: true,
      isYesOrNoPopup: true,
    );
    if (isOk) {
      NavigationServices(context).gotoSplashScreen();
    }
  }
}