import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_deck/app/shared/utils/snackbar/global_scaffold.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Marvel Deck',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("pt", "BR"),
      ],
      theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: GoogleFonts.bebasNeue().fontFamily),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Scaffold(
        key: GlobalScaffold.instance.scafoldKey,
        body: child,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
