
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/App%20Config%20Provider/App%20Config%20Provider.dart';
import 'package:to_do_app/Home/Settings%20Tab/Language%20Bottom%20Sheet.dart';
import 'package:to_do_app/Home/Settings%20Tab/Theme%20Bottom%20Sheet.dart';
import 'package:to_do_app/My%20Theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
return Container(
  margin: EdgeInsets.all(12),
  padding: EdgeInsets.all(12),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Language',style: Theme.of(context).textTheme.displayMedium,),
      InkWell(onTap: (){
        return  showLanguageBottomSheet();
      },
        child: Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(12),
decoration:BoxDecoration(color: MythemeData.colorWhite) ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( provider.appLanguage == 'en'
              ? AppLocalizations.of(context)!.english
                : AppLocalizations.of(context)!.arabic,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 14),),
              Icon(Icons.arrow_drop_down_circle_outlined)

            ],
          ),
        ),
      ),
      Text('Theme',style: Theme.of(context).textTheme.displayMedium,),
      InkWell(onTap: (){
        return showThemeBottomSheet();
      },
        child: Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(12),
          decoration:BoxDecoration(color: MythemeData.colorWhite) ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( provider.isDark()
                  ? AppLocalizations.of(context)!.dark
                  : AppLocalizations.of(context)!.light,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 14),),
              Icon(Icons.arrow_drop_down_circle_outlined)

            ],
          ),
        ),
      )
    ],
  ),
);
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder: (context){
      return ThemeBottomSheet();
    });
  }
}
