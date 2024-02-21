// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booky/authentication/presentation/screens/microsoft_login_scree.dart';
import 'package:booky/book/presentation/controller/book_cubit.dart';
import 'package:booky/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding();
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72, 781.09),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<BookCubit>()..getBooks()),
        ],
        child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          home: const MicrosoftLoginScreen(),
          navigatorKey: navigatorKey,
        ),
      ),
    );
  }
}
