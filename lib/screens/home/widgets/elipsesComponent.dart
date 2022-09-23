import 'package:flutter/material.dart';
import 'package:test_mepoupe/controllers/home/home_cubit.dart';

import '../../../shared/styles/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElipsesComponent extends StatelessWidget {
  const ElipsesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadedCep) {
          return Container(
            margin: const EdgeInsets.only(top: 410),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ImageIcon(
                  AssetImage(IconsMePoupe.homePost),
                  size: 52,
                  color: ColorsMePoupe.purpleLigth,
                ),
                Text(
                  '${state.ceps}',
                  style: FontsMePoupe.titleBigX.copyWith(color: Colors.white),
                ),
                Text(
                  'CEPs pesquisados',
                  style: FontsMePoupe.textSmall.copyWith(color: Colors.white),
                ),
              ],
            ),
            width: 202.0,
            height: 202.0,
            decoration: const BoxDecoration(
              color: ColorsMePoupe.primary,
              borderRadius: BorderRadius.all(Radius.elliptical(400, 400)),
            ),
          );
        }
        if (state is HomeErrorCep) {
          return Text(
            state.message,
            style: FontsMePoupe.textNormal,
          );
        }
        return const SizedBox();
      },
    );
  }
}
