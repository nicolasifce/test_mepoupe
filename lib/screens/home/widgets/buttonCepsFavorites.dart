import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mepoupe/controllers/favorites/favorites_cubit.dart';
import 'package:test_mepoupe/controllers/menu/menu_cubit.dart';

import '../../../shared/styles/styles.dart';

class ButtonCepFavorite extends StatelessWidget {
  const ButtonCepFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 40),
      child: MaterialButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: ColorsMePoupe.purpleLigthMax,
        onPressed: () {
          context.read<MenuCubit>().onTabTapped(2);
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              const ImageIcon(
                AssetImage(IconsMePoupe.band),
                color: ColorsMePoupe.purpleLigthMedium,
              ),
              Text(
                'CEPs Salvos',
                style: FontsMePoupe.textNormal.copyWith(
                    fontWeight: FontWeight.w600, color: ColorsMePoupe.primary),
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: ColorsMePoupe.primary),
              child: BlocBuilder<FavoritesCubit, FavoritesState>(
                builder: (context, state) {
                  return Text(
                    state is FavoriteLoadedList
                        ? '${state.cepModelList.length}'
                        : '0',
                    style: FontsMePoupe.textSmall
                        .copyWith(fontSize: 13, color: Colors.white),
                  );
                },
              )),
        ]),
      ),
    );
  }
}
