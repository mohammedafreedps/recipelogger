import 'package:flutter/material.dart';
import 'package:recipelog/precentation/style_manager.dart';

Widget userAddedTile() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration:
            BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.acsentColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('13 - 5 -2004',style: TextStyles.primaryNormal,),
                    const SizedBox(width: 10,),
                    Text('By user 343',style: TextStyles.primaryNormal,),
                  ],
                ),
                SizedBox(width: 300, child: Text('Tomato Fry',style: TextStyles.primaryBold.copyWith(fontSize: 20),overflow: TextOverflow.clip,))
              ],
            ),
            Text('Category',style: TextStyles.primaryNormal,)
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
