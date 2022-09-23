import 'package:flutter/material.dart';
import 'package:test_mepoupe/screens/favorites/main.dart';
import 'package:test_mepoupe/screens/search/main.dart';
import 'package:test_mepoupe/shared/styles/icons.dart';

import '../../controllers/favorites/favorites_cubit.dart';
import '../../controllers/home/home_cubit.dart';
import '../../controllers/menu/menu_cubit.dart';
import '../home/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<Widget> _telas = [
    const Home(),
    const SearchPage(),
    const FavoritePage()
  ];
  init() {
    Future.delayed(const Duration(milliseconds: 500), () {
      context.read<HomeCubit>().getNumberCeps();
      context.read<FavoritesCubit>().getListFavorite();
    });
  }

  @override
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: state is LoadedIndex ? _telas[state.index] : _telas[0],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state is LoadedIndex ? state.index : 0,
              onTap: context.read<MenuCubit>().onTabTapped,
              elevation: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(IconsMePoupe.home)),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(IconsMePoupe.search)),
                  label: 'Procurar',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(IconsMePoupe.favorite)),
                  label: 'Favoritos',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
