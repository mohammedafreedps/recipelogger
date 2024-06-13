import 'package:flutter/material.dart';
import 'package:recipelog/precentation/screens/widgets/text_field.dart';
import 'package:recipelog/precentation/style_manager.dart';

Widget fillInCreate() {
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
      textField(hintText: 'Recipe Name'),
      const SizedBox(
        height: 10,
      ),
      Expanded(child: textField(expands: true, hintText: 'Ingredients (seperate each by , coma)')),
      const SizedBox(
        height: 10,
      ),
      Expanded(child: textField(expands: true, hintText: 'Instructions (seperate each by , coma)')),
      const SizedBox(
        height: 10,
      ),
      DropdownButtonFormField(
        iconEnabledColor: AppColor.acsentColor,
        decoration: InputDecoration(
          label: Text('Category',style: TextStyles.primaryBold,),
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
          onChanged: (value) {})
    ],
  );
}
