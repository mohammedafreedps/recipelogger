import 'package:flutter/material.dart';
import 'package:recipelog/precentation/screens/create_edit_screen/create_edit_screen.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/local_variable.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/alert_box.dart';
import 'package:recipelog/precentation/style_manager.dart';
import 'package:recipelog/precentation/utils/navigators.dart';

Widget userAddedTile({required BuildContext context, required int index}) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.acsentColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: 300,
                    child: Text(
                      'by . ${recipes[index].userEmail.replaceAll('@gmail.com', '')}',
                      style: TextStyles.primaryNormal,
                    )),
                SizedBox(
                    width: 300,
                    child: Text(
                      recipes[index].recipeName,
                      style: TextStyles.primaryBold.copyWith(fontSize: 20),
                      overflow: TextOverflow.clip,
                    ))
              ],
            ),
            Column(
              children: [
                Text(
                  recipes[index].category,
                  style: TextStyles.primaryNormal,
                ),
                currentUser!.email == recipes[index].userEmail
                    ? Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigators.pushNavigate(
                                    context: context,
                                    page: CreateEditScreen(
                                      isEdit: true,
                                      index: index,
                                    ));
                              },
                              icon: Icon(
                                Icons.edit,
                                color: AppColor.acsentColor,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          IconButton(
                              onPressed: () {
                                alertBox(context: context,index: index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: AppColor.acsentColor,
                              )),
                        ],
                      )
                    : const Text(''),
              ],
            )
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
