import 'package:flutter/material.dart';
import 'package:test_mepoupe/controllers/favorites/favorites_cubit.dart';
import 'package:test_mepoupe/models/cep.model.dart';

import '../../../shared/styles/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdressComponent extends StatelessWidget {
  final CepModel cep;
  final Function() onTap;
  const AdressComponent({Key? key, required this.cep, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Endereço',
            style: FontsMePoupe.titleLillte2
                .copyWith(color: ColorsMePoupe.primary),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              cep.adreesText(),
              style: FontsMePoupe.textNormal,
            )),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return Column(
              children: [
                MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(72.0),
                  ),
                  color: state is FavoriteLoaded
                      ? ColorsMePoupe.whiteMedium
                      : ColorsMePoupe.purpleGray,
                  onPressed: onTap,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageIcon(
                          const AssetImage(IconsMePoupe.favorite),
                          color: state is FavoriteLoaded
                              ? ColorsMePoupe.yellow
                              : ColorsMePoupe.purpleLigth,
                        ),
                        Text(
                          'Adicionar aos Favoritos',
                          style: FontsMePoupe.textNormal.copyWith(
                              color: state is FavoriteLoaded
                                  ? ColorsMePoupe.primary
                                  : Colors.white),
                        ),
                        const SizedBox(),
                      ]),
                ),
                if (state is FavoriteError)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      state.message,
                      style:
                          FontsMePoupe.textNormal.copyWith(color: Colors.red),
                    ),
                  )
              ],
            );
          },
        )
      ],
    );
  }
}
