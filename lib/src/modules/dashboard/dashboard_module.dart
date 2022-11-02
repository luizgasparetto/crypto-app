import 'package:crypto_app/src/modules/dashboard/presentation/dashboard_page.dart';
import 'package:dependencies_module/dependencies_module.dart';

class DashboardModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const DashboardPage()),
      ];
}
