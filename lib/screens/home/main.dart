import 'package:flutter/material.dart';
import 'package:test_mepoupe/controllers/home/home_cubit.dart';
import 'package:test_mepoupe/screens/home/widgets/buttonCepsFavorites.dart';
import 'package:test_mepoupe/screens/home/widgets/elipsesComponent.dart';
import 'package:test_mepoupe/shared/styles/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/favorites/favorites_cubit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<HomeCubit>().getNumberCeps();
    context.read<FavoritesCubit>().getListFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 40),
                child: Column(
                  children: const [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Olá,',
                          style: FontsMePoupe.titleBig,
                        )),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Bem-vindo',
                          style: FontsMePoupe.titleNomal,
                        )),
                  ],
                ),
              ),
            ]),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Image(
                image: AssetImage(ImagesMePoupe.homecreen),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: const [ElipsesComponent(), ButtonCepFavorite()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
