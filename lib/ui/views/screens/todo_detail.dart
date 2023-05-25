import 'package:flutter/material.dart';
import 'package:my_pet_diary/configs/colors.dart';
import 'package:my_pet_diary/models/todo.dart';
import 'package:my_pet_diary/models/todo_helper.dart';

enum DetailType {
  create, edit
}

class ToDoDetailScreen extends StatefulWidget {
  String existingTitle;
  int toDoId;
  DetailType detailType;

  ToDoDetailScreen(
      {Key? key, required this.existingTitle,
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
    this.title = widget.existingTitle;
    titleController.text = widget.existingTitle;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {


        if (title == "") {
          Navigator.pop(context, didUpdateToDo);
          return shouldPop;
        }


        if (widget.detailType == DetailType.create) {
          ToDo itemToAdd = ToDo(id: widget.toDoId,title: this.title);
          await toDoHelper.insertToDo(itemToAdd);

        } else if (widget.detailType == DetailType.edit) {
          ToDo itemToUpdate = ToDo(id: widget.toDoId, title: title);
          await toDoHelper.updateToDo(itemToUpdate);
          print("updated!");
        }

        if (context.mounted) {
          didUpdateToDo = true;
          Navigator.pop(context, didUpdateToDo);
        }

        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton.outlined(onPressed: () async {
              toDoHelper.deleteToDo(widget.toDoId);
              didUpdateToDo = true;
              Navigator.pop(context, didUpdateToDo);
            }, icon: const Icon(Icons.delete)
            ),

          ],
          iconTheme: IconThemeData(
            color: AppColors.black,
          ),
          title: Text(
            "할 일",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: TextField(
              controller: titleController,
              onChanged: (text) {
                setState(() {
                  title = text;
                });
              },
              decoration: const InputDecoration(
                  labelText: "제목", hintText: "할 일을 입력하세요"),
            ),
          ),
        ),
      ),
    );
  }
}
