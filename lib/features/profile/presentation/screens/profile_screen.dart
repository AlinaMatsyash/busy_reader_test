import 'package:busy_reader/features/profile/presentation/widgets/feild_app.dart';
import 'package:busy_reader/res/assets/assets.gen.dart';
import 'package:busy_reader/res/assets/colors.gen.dart';
import 'package:busy_reader/theme/app_typography.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48),
                Text(
                  'Профиль',
                  style: AppTypography.mulishBold20
                      .copyWith(color: ColorName.blackApp),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Assets.images.avatar.image(),
                    const SizedBox(width: 24),
                    SizedBox(
                      width: 167,
                      child: Text(
                        'Введите своё имя и при делании добавьте фото профиля',
                        style: AppTypography.montserratMedium12
                            .copyWith(color: ColorName.lightGray),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                FieldApp(
                  labelText: 'Имя',
                  controller: nameController,
                ),
                const SizedBox(height: 12),
                FieldApp(
                  labelText: 'Фамилия',
                  controller: surnameController,
                ),
                const SizedBox(height: 16),
                FieldApp(
                  labelText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 16),
                FieldApp(
                  labelText: 'Номер телефона',
                  controller: phoneController,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
