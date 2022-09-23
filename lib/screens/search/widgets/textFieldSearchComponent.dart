import 'package:flutter/material.dart';

import '../../../controllers/search/search_cubit.dart';
import '../../../shared/styles/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TetFieldSearch extends StatelessWidget {
  final TextEditingController controller;
  const TetFieldSearch({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputDecoration _decorationTextFormField() {
      return InputDecoration(
        prefixIcon: const ImageIcon(
          AssetImage(
            IconsMePoupe.searching,
          ),
          color: ColorsMePoupe.greyDark,
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: ColorsMePoupe.borderGrayLigth),
            borderRadius: BorderRadius.circular(100) //<-- SEE HERE
            ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: ColorsMePoupe.borderGrayLigth),
            borderRadius: BorderRadius.circular(100) //<-- SEE HERE
            //<-- SEE HERE
            ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(100) //<-- SEE HERE
            //<-- SEE HERE
            ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(100) //<-- SEE HERE
//<-- SEE HERE
            ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        decoration: _decorationTextFormField(),
        onChanged: (value) {
          context.read<SearchCubit>().searchCep(cep: value);
        },
        controller: controller,
      ),
    );
  }
}
