import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pet_diary/configs/colors.dart';
import 'package:my_pet_diary/configs/size.dart';
import 'package:my_pet_diary/models/todo.dart';
import 'package:my_pet_diary/models/todo_helper.dart';
import 'package:my_pet_diary/ui/widgets/rounded_textfield.dart';

enum DetailType { create, edit }

class ToDoDetailScreen extends StatefulWidget {
  String existingTitle;
  int toDoId;
  DetailType detailType;

  ToDoDetailScreen(
      {Key? key,
      required this.existingTitle,
      required this.toDoId,
      required this.detailType})
      : super(key: key);

  @override
  State<ToDoDetailScreen> createState() => _ToDoDetailScreenState();
}

class _ToDoDetailScreenState extends State<ToDoDetailScreen> {
  bool shouldPop = true;
  late String title;
  ToDoHelper toDoHelper = ToDoHelper();
  TextEditingController titleController = TextEditingController();
  bool didUpdateToDo = false;

  @override
  void initState() {
    super.initState();
    title = widget.existingTitle;
    titleController.text = widget.existingTitle;
  }

  Future<bool> onWillPop() async {
    if (title == "") {
      Navigator.pop(context, didUpdateToDo);
      return shouldPop;
    }

    switch (widget.detailType) {
      case DetailType.create:
        ToDo itemToAdd = ToDo(id: widget.toDoId, title: this.title);
        await toDoHelper.insertToDo(itemToAdd);
        break;
      case DetailType.edit:
        ToDo itemToUpdate = ToDo(id: widget.toDoId, title: title);
        await toDoHelper.updateToDo(itemToUpdate);
        break;
    }

    if (context.mounted) {
      didUpdateToDo = true;
      Navigator.pop(context, didUpdateToDo);
    }

    return shouldPop;
  }

  void onDeleteButtonPressed() async {
    await toDoHelper.deleteToDo(widget.toDoId);
    didUpdateToDo = true;

    if (context.mounted) {
      Navigator.pop(context, didUpdateToDo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSizes.xl,
              horizontal: AppSizes.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('제목', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: AppSizes.sm),
                RoundedTextField(
                  controller: titleController,
                  onChanged: (text) => setState(() {
                    title = text;
                  }),
                  hintText: '할 일을 입력하세요',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        if (widget.detailType != DetailType.create)
          IconButton.outlined(
              onPressed: onDeleteButtonPressed,
              icon: Icon(
                CupertinoIcons.trash,
                color: Theme.of(context).colorScheme.error,
              )),
      ],
      iconTheme: const IconThemeData(
        color: AppColors.black,
      ),
      title: Text(
        "To Do",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      backgroundColor: AppColors.white,
      elevation: 0,
    );
  }
}
