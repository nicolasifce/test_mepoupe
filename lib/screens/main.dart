import 'package:flutter/material.dart';
import 'package:test_mepoupe/controllers/favorites/favorites_cubit.dart';
import 'package:test_mepoupe/controllers/home/home_cubit.dart';
import 'package:test_mepoupe/controllers/menu/menu_cubit.dart';
import 'package:test_mepoupe/controllers/search/search_cubit.dart';
import 'package:test_mepoupe/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/services/db/db.dart';
import 'menu/main.dart';

class TestMePoupe extends StatelessWidget {
  const TestMePoupe({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MenuCubit>(create: (context) => MenuCubit()),
          BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
          BlocProvider<FavoritesCubit>(create: (context) => FavoritesCubit()),
          BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
        ],
        child: MaterialApp(
          title: 'Test MePoupe',
          theme: ThemeData(
            primarySwatch: ColorsMePoupe.primaryColor,
          ),
          home: const MenuPage(),
        ));
  }
}
