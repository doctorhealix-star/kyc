import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/constant/color.dart';
import '/utils/routes.dart';
import 'core/constant/string.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'data/dbStore/kycbloc/database_helper.dart';
import 'data/dbStore/kycbloc/kyc_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
void main() {
  Gemini.init(apiKey: "AIzaSyC9D7wKtt1RritOvEAocVj8Z93vwKaS3gw");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<KycBloc>(
          create: (context) => KycBloc(),
        ),


      ],
      child: MaterialApp(
        supportedLocales: [
          const Locale('en'),
          const Locale('ar'),
          const Locale('es'),
          const Locale('de'),
          const Locale('fr'),
          const Locale('el'),
          const Locale('et'),
          const Locale('nb'),
          const Locale('nn'),
          const Locale('pl'),
          const Locale('pt'),
          const Locale('ru'),
          const Locale('hi'),
          const Locale('ne'),
          const Locale('uk'),
          const Locale('hr'),
          const Locale('tr'),
          const Locale('lv'),
          const Locale('lt'),
          const Locale('ku'),
          const Locale('nl'),
          const Locale('it'),
          const Locale('ko'),
          const Locale('ja'),
          const Locale('id'),
          const Locale('cs'),
          const Locale('ht'),
          const Locale('sk'),
          const Locale('ro'),
          const Locale('bg'),
          const Locale('ca'),
          const Locale('he'),
          const Locale('fa'),
          const Locale('da'),
          const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
          const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
        ],
        localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'KYC APP',
        initialRoute: splash,
        onGenerateRoute: Routes.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: white,
          appBarTheme: AppBarTheme(backgroundColor: white,),

          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
        ),

      ),
    );
  }
}

