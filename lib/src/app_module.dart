import 'package:crypto_app/src/modules/dashboard/dashboard_module.dart';
import 'package:crypto_app/src/modules/home/home_module.dart';
import 'package:dependencies_module/dependencies_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/dashboard', module: DashboardModule()),
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
      ];
}
