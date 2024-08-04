import 'package:app_todo/app_color.dart';
import 'package:app_todo/home/settings/theme_button_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/app_config_provider.dart';
import 'lanuage_button_sheet.dart';

class SettingTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.primaryColor
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {

              showLanguageButtonSheet(context);
            },
            child: Container(

              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color:
                provider.isDarkMode()?
                AppColors.whiteColor :
                AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Icon(Icons.arrow_drop_down, size: 35,
                 color: provider.isDarkMode()?
                 AppColors.primaryColor :
                 AppColors.primaryColor,
                 ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.primaryColor
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              showThemeButtonSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color:  provider.isDarkMode()?
                AppColors.whiteColor :
                AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDarkMode()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Icon(Icons.arrow_drop_down, size: 35, color: provider.isDarkMode()?
                  AppColors.primaryColor :
                  AppColors.primaryColor,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageButtonSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Launguagebuttonsheet(),
    );
  }

  void showThemeButtonSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Themebuttonsheet(),
    );
  }
}
