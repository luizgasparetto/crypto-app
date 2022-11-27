import 'package:dependencies_module/dependencies_module.dart';

import 'presentation/pages/login_page.dart';

class AuthModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const LoginPage()),
      ];
}
