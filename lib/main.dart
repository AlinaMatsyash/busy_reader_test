import 'package:busy_reader/features/books/presentation/bloc/book_bloc.dart';
import 'package:busy_reader/res/assets/colors.gen.dart';
import 'package:busy_reader/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await di.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.white.withOpacity(1),
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BookBloc>(),
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          colorSchemeSeed: ColorName.white,
          useMaterial3: true,
          scaffoldBackgroundColor: ColorName.white,
        ),
        builder: (_, router) {
          return router!;
        },
        //home: const SplashScreen(),
      ),
    );
  }
}
