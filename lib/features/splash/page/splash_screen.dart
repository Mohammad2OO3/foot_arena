import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/design/src/theme/assets.gen.dart';
import '../../../common/extensions/src/context_extensions.dart';
import '../../../core/di/injection.dart';
import '../../../router/app_router.dart';
import 'cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashCubit splashCubit;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    super.initState();
    splashCubit = getIt<SplashCubit>();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      splashCubit.checkNavigator();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashCubit, SplashState>(
          bloc: splashCubit,
          listenWhen: (previous, current) =>
              previous.splashStatus != current.splashStatus,
          listener: (context, state) {
            if (state.splashStatus == SplashStatus.isAuth) {
              context.pushReplacementNamed(RouteName.home);
            } else if (state.splashStatus == SplashStatus.unauthorized) {
              context.pushReplacementNamed(RouteName.onBoard);
            }
          },
        ),
      ],

      child: Scaffold(
        body: Container(
          width: context.width,
          height: context.height,
           color: Colors.white,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(
                child: Assets.images.logo.image(
                  width: context.width,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
