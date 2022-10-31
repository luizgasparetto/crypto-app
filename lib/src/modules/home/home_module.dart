import 'package:crypto_app/src/modules/home/presentation/home_page.dart';
import 'package:dependencies_module/dependencies_module.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const HomePage()),
      ];
}
