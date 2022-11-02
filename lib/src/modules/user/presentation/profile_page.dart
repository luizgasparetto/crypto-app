import 'package:design_system_module/design_system_module.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CryptoColors.darkColor,
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 90,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CryptoColors.lightGrey,
                        ),
                        child: const Center(child: Icon(IconlyBold.profile, color: Colors.white, size: 34)),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Luiz Eduardo Gasparetto',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          '+55 (47) 99246-3380',
                          style: TextStyle(color: CryptoColors.dialogColor, fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        const SizedBox(height: 12),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: const [
                              Text(
                                'Editar meus dados',
                                style: TextStyle(color: Color.fromARGB(255, 79, 230, 129)),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                IconlyLight.arrow_right_2,
                                size: 11,
                                color: Color.fromARGB(255, 79, 230, 129),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Divider(height: 1, color: Colors.white.withOpacity(0.1)),
              const SizedBox(height: 40),
              const Text(
                'Configurações da conta',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
