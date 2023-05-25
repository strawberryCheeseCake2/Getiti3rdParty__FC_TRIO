import 'package:flutter/material.dart';
import 'package:my_pet_diary/configs/size.dart';

class TodoCard extends StatefulWidget {
  String title;
  VoidCallback onPressed;

  TodoCard({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  late String title;

  @override
  void initState() {
    super.initState();
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: widget.onPressed,
        child: SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.bodyLarge)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
