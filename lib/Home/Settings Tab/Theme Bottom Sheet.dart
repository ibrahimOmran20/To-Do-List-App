import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/My%20Theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ThemeBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.light,
                  style: Theme.of(context).textTheme.bodySmall),
              Icon(Icons.check,size: 24,color: MythemeData.lightPriamry,)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 19)),
          ),
        ],
      ),
    );
  }
}


