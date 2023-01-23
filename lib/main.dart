import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:odc_workshop/business_logic/auth/login/login_cubit.dart';
import 'package:odc_workshop/business_logic/auth/register/register_cubit.dart';
import 'package:odc_workshop/business_logic/notes/notes_cubit.dart';
import 'package:odc_workshop/data/data_provider/local/cache_helper.dart';
import 'package:odc_workshop/data/data_provider/remote/dio_helper.dart';
import 'package:odc_workshop/presentation/screens/splash_screen/splash_screen.dart';
import 'package:odc_workshop/presentation/styles/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => NotesCubit(),
            ),
            BlocProvider(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sizer',
            theme: ThemeData(
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                AppColors.primaryColor,
              ),
            ))),
            home: Splash(),
            debugShowMaterialGrid: false,
          ),
        );
      },
    );
  }
}
