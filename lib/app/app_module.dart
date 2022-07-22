import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_deck/app/modules/details/details_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute,
        module: HomeModule(), transition: TransitionType.fadeIn),
    ModuleRoute("/details",
        module: DetailsModule(), transition: TransitionType.fadeIn),
  ];
}
