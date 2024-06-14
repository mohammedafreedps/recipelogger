import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/create_edit_screen/bloc/create_edit_bloc.dart';
import 'package:recipelog/precentation/screens/create_edit_screen/bloc/local_variable.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/local_variable.dart';
import 'package:recipelog/precentation/screens/widgets/cus_button.dart';
import 'package:recipelog/precentation/screens/widgets/loading_circle.dart';

Widget createEditButton({
  required int? index,
  required BuildContext context,
  required bool isEdit,
  required TextEditingController title,
}) {
  return BlocBuilder<CreateEditBloc, CreateEditState>(
    builder: (context, state) {
      if (state is RecipeCreatingState) {
        return loadingCircle();
      } else {
        return cusButton(
            text: isEdit ? 'Edit' : 'Create',
            function: () {
              if (isEdit && index != null) {
                context.read<CreateEditBloc>().add(RecipeEditButtonClicked(docId: recipes[index].docId,
                    recipeName: title.text, category: selectedCategory));
              }else{
                context.read<CreateEditBloc>().add(RecipeCreateButtonClicked(
                    recipeName: title.text, category: selectedCategory));
              }
            });
      }
    },
  );
}
