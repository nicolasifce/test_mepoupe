import 'package:flutter/material.dart';
import 'package:test_mepoupe/controllers/favorites/favorites_cubit.dart';
import 'package:test_mepoupe/controllers/home/home_cubit.dart';
import 'package:test_mepoupe/controllers/search/search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mepoupe/screens/search/widgets/adressComponent.dart';
import 'package:test_mepoupe/shared/styles/styles.dart';

import 'widgets/textFieldSearchComponent.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

Widget screenBody({required SearchState state, required BuildContext context}) {
  if (_cep.text.isEmpty) {
    return const Text(
      'Digite um Cep',
      style: FontsMePoupe.textNormal,
    );
  } else {
    if (state is SearchLoaded) {
      return AdressComponent(
        onTap: () {
          context.read<FavoritesCubit>().setFavorite(cep: state.cep);
        },
        cep: state.cep,
      );
    }
    if (state is SearchError) {
      return Text(
        state.message,
        style: FontsMePoupe.textNormal,
      );
    }
    if (state is SearchLoading) {
      return const Text(
        'Procurando...',
        style: FontsMePoupe.textNormal,
      );
    }
  }

  return const SizedBox();
}

TextEditingController _cep = TextEditingController();

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 50, bottom: 20),
            color: ColorsMePoupe.primary,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Procurar Cep",
                      style:
                          FontsMePoupe.titleNomal.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Text(
                  "Digite o CEP que você deseja procurar",
                  textAlign: TextAlign.center,
                  style: FontsMePoupe.titleLillte.copyWith(color: Colors.white),
                ),
                TetFieldSearch(
                  controller: _cep,
                )
              ],
            ),
          ),
          const Spacer(),
          BlocBuilder<SearchCubit, SearchState>(
            buildWhen: (previous, current) {
              if (current is SearchLoaded) {
                context.read<HomeCubit>().setNumerCeps();
              }
              return true;
            },
            builder: (context, state) {
              return Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: screenBody(state: state, context: context));
            },
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
