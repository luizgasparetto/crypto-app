import 'package:crypto_app/src/modules/user/presentation/profile_page.dart';
import 'package:dependencies_module/dependencies_module.dart';

class UserModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/profile', child: (_, __) => const ProfilePage()),
      ];
}
