import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/App%20Config%20Provider/App%20Config%20Provider.dart';
import 'package:to_do_app/My%20Theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () { print(provider.appLanguage);
              provider.changeLanguage('en');

            },
            child: provider.appLanguage == 'en'
                ? selectedItemWidget(
                    AppLocalizations.of(context)!.english, context)
                : unSelectedItemWidget(
                    AppLocalizations.of(context)!.english, context),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                provider.changeLanguage('ar');
                print(provider.appLanguage);
              },
              child: provider.appLanguage == 'ar'
                  ? selectedItemWidget(
                      AppLocalizations.of(context)!.arabic, context)
                  : unSelectedItemWidget(
                      AppLocalizations.of(context)!.arabic, context),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectedItemWidget(String text, BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(text, style: Theme.of(context).textTheme.bodySmall),
      Icon(
        Icons.check,
        size: 24,
        color: MythemeData.lightPriamry,
      ),
    ]);
  }

  Widget unSelectedItemWidget(String text, BuildContext context) {
    return Row(
      children: [
        Text(text,
            style:
                Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 19)),
      ],
    );
  }
}
