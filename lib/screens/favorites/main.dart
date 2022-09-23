import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mepoupe/controllers/favorites/favorites_cubit.dart';

import '../../shared/styles/styles.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    context.read<FavoritesCubit>().getListFavorite();
    super.initState();
  }

  Widget screenBody(
      {required FavoritesState state, required BuildContext context}) {
    if (state is FavoriteLoadingList) {
      return Column(
        children: const [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Carregando...",
              style: FontsMePoupe.textNormal,
            ),
          ),
        ],
      );
    }
    if (state is FavoriteErrorList) {
      return Column(
        children: [
          Align(
              alignment: Alignment.center,
              child: Text(state.message, style: FontsMePoupe.textNormal)),
        ],
      );
    }
    if (state is FavoriteLoadedList) {
      return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.cepModelList.length,
            itemBuilder: (context, index) {
              return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${state.cepModelList[index].cep}',
                              style: FontsMePoupe.textNormal,
                            ),
                            GestureDetector(
                              onTap: () async {
                                context
                                    .read<FavoritesCubit>()
                                    .removeFavorite(index: index);
                                context
                                    .read<FavoritesCubit>()
                                    .getListFavorite();
                              },
                              child: const ImageIcon(
                                AssetImage(IconsMePoupe.remove),
                                color: ColorsMePoupe.primary,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          state.cepModelList[index].adreesText(),
                          style: FontsMePoupe.textSmall,
                        )
                      ],
                    ),
                  ));
            }),
      );
    }

    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: <Color>[
            ColorsMePoupe.purpleLigth.withOpacity(0.6),
            Colors.white
          ])),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(top: 45, bottom: 10),
          child: ImageIcon(
            AssetImage(
              IconsMePoupe.star1,
            ),
            color: ColorsMePoupe.primary,
          ),
        ),
        Text(
          'Meus Favoritos',
          style: FontsMePoupe.titleNomal.copyWith(color: ColorsMePoupe.primary),
        ),
        const SizedBox(
          height: 30,
        ),
        BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return screenBody(state: state, context: context);
          },
        )
      ]),
    );
  }
}
