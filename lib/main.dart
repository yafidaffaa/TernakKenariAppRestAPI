import 'package:canary/data/repository/auth_repository.dart';
import 'package:canary/data/repository/get_all_burung_tersedia_repository.dart';
import 'package:canary/data/repository/profile_buyer_repository.dart';
import 'package:canary/presentation/auth/bloc/login/login_bloc.dart';
import 'package:canary/presentation/auth/bloc/register/register_bloc.dart';
import 'package:canary/presentation/auth/register_screen.dart';
import 'package:canary/presentation/bloc/get_burung_tersedia/get_all_burung_tersedia_bloc.dart';
import 'package:canary/presentation/buyer/profile/bloc/profile_buyer_bloc.dart';
import 'package:canary/service/service_http_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => LoginBloc(
                authRepository: AuthRepository(ServiceHttpClient()),
              ),
        ),
        BlocProvider(
          create:
              (context) => RegisterBloc(
                authRepository: AuthRepository(ServiceHttpClient()),
              ),
        ),
        BlocProvider(
          create:
              (context) => ProfileBuyerBloc(
                profileBuyerRepository: ProfileBuyerRepository(
                  ServiceHttpClient(),
                ),
              ),
        ),
        BlocProvider(
          create:
              (context) => GetBurungTersediaBloc(
                GetAllBurungTersediaRepository(ServiceHttpClient()),
              ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const RegisterScreen(),
      ),
    );
  }
}
