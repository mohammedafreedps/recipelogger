import 'package:flutter/material.dart';
import 'package:recipelog/precentation/screens/create_edit_screen/bloc/local_variable.dart';
import 'package:recipelog/precentation/screens/widgets/text_field.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';

Widget fillInCreate({required TextEditingController recipeTitleController, String lable = 'Category'}) {
  List<String> categories = [
    'Appetizer',
    'Main Course',
    'Dessert',
    'Salad',
    'Soup',
    'Beverage',
    'Snack'
  ];
  return Column(
    children: [
      textField(hintText: 'Recipe Name',controller: recipeTitleController),
      const SizedBox(
        height: 10,
      ),
      const SizedBox(
        height: 10,
      ),
      const SizedBox(
        height: 10,
      ),
      DropdownButtonFormField(
        iconEnabledColor: AppColor.acsentColor,
        decoration: InputDecoration(
          label: Text(lable,style: TextStyles.primaryBold,),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.acsentColor)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.acsentColor)),
        ),
        style: TextStyles.primaryNormal,
        dropdownColor: AppColor.primaryColor,
          items: categories.map((String category) {
            return DropdownMenuItem(
              value: category,
              child: Text(category));
          }).toList(),
          onChanged: (value) {
            selectedCategory = value!;
          })
    ],
  );
}
