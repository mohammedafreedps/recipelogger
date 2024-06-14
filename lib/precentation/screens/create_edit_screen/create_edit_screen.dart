import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/create_edit_screen/bloc/create_edit_bloc.dart';
import 'package:recipelog/precentation/screens/create_edit_screen/bloc/local_variable.dart';
import 'package:recipelog/precentation/screens/create_edit_screen/widgets/appbar.dart';
import 'package:recipelog/precentation/screens/create_edit_screen/widgets/create_edit_button.dart';
import 'package:recipelog/precentation/screens/create_edit_screen/widgets/fill_in_create.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/home_bloc.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/local_variable.dart';
import 'package:recipelog/precentation/screens/widgets/bottom_snack_bar.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';
import 'package:recipelog/precentation/utils/navigators.dart';

class CreateEditScreen extends StatefulWidget {
  final int? index;
  final bool isEdit;
  const CreateEditScreen({super.key, this.isEdit = false,this.index});

  @override
  State<CreateEditScreen> createState() => _CreateEditScreenState();
}

class _CreateEditScreenState extends State<CreateEditScreen> {
  final recipeTitleController = TextEditingController();
  @override
  void initState() {
    if(widget.isEdit && widget.index != null){
      recipeTitleController.text = recipes[widget.index!].recipeName;
      selectedCategory = recipes[widget.index!].category;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: apBar(),
      backgroundColor: AppColor.primaryColor,
      body: BlocListener<CreateEditBloc, CreateEditState>(
        listener: (context, state) {
          if(state is RecipeCreatedUnsuccesState){
            bottomSnakBar(context: context, message: state.message);
          }
          if(state is RecipeCreatedSuccusfullyState){
            context.read<HomeBloc>().add(FechDateEvent());
            Navigators.popNavigate(context: context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                widget.isEdit ? 'Edit' : 'Create',
                style: TextStyles.primaryBold.copyWith(fontSize: 30),
              ),
              Expanded(child: fillInCreate(recipeTitleController: recipeTitleController,lable: widget.isEdit ? selectedCategory : 'Category')),
              const SizedBox(
                height: 30,
              ),
              createEditButton(index: widget.index, context: context, isEdit: widget.isEdit, title: recipeTitleController),
            ],
          ),
        ),
      ),
    );
  }
}
