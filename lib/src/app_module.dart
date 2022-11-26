import 'package:dependencies_module/dependencies_module.dart';

import 'modules/home/home_module.dart';
import 'modules/user/user_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
        ModuleRoute('/user', module: UserModule()),
      ];
}
