import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:busy_reader/features/books/presentation/bloc/bloc.dart';
import 'package:busy_reader/res/assets/assets.gen.dart';
import 'package:busy_reader/res/assets/colors.gen.dart';
import 'package:busy_reader/router/router.dart';
import 'package:busy_reader/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    BlocProvider.of<BookBloc>(context).add(GetBookEvent());
    Timer(const Duration(seconds: 3),
        () => context.router.push(const NavigationRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              'Busy Reader',
              style: AppTypography.mulishBold32
                  .copyWith(color: ColorName.blackApp),
            ),
            const SizedBox(height: 8),
            Assets.images.bysuReader.image(),
          ],
        ),
      ),
    );
  }
}
