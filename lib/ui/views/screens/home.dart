import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../configs/colors.dart';
import '../../../configs/size.dart';
import '../../widgets/rounded_image.dart';
import '../todo/todo_card.dart';
import './todo_detail.dart';
import 'package:my_pet_diary/models/todo.dart';
import 'package:my_pet_diary/models/todo_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ToDoHelper toDoHelper = ToDoHelper();
  List<ToDo> todoList = [];
  bool shouldUpdateToDoList = false;

  @override
  void initState() {
    super.initState();
    loadToDos();
  }

  void loadToDos() async {
    todoList = await toDoHelper.getToDos();
    updateToDoListView(todoList);
  }

  void updateToDoListView(List<ToDo> todoList) {
    setState(() {
      this.todoList = todoList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              Expanded(flex: 3, child: _buildHeader(context)),
              Expanded(flex: 7, child: _buildToDoSection(context)),

            ],
          ),
        ),
        Positioned(
            right: AppSizes.xl,
            bottom: AppSizes.xl,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: AppColors.white,
              onPressed: () async {
                shouldUpdateToDoList = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ToDoDetailScreen(
                          existingTitle: "",
                          detailType: DetailType.create,
                          toDoId: UniqueKey().hashCode,
                        )));

                if (shouldUpdateToDoList) {
                  print("should up");
                  loadToDos();
                }
              },
              child: const Icon(Icons.add),
            ))
      ],
    );

  }

  Widget _buildHeader(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowGray,
            offset: const Offset(0, 4),
            blurRadius: 16,
          )
        ],
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: safePadding,
          ),
          _buildProfileSection(context),
          // _buildWeeklyCalendar(context),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.xl,
        horizontal: AppSizes.md,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedImage(
              radius: 32,
              url:
                  'https://ichef.bbci.co.uk/news/800/cpsprodpb/E172/production/_126241775_getty_cats.png'),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.md,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "초코",
                    style: GoogleFonts.gowunBatang(
                        textStyle:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontWeight: FontWeight.w100,
                                )),
                  ),
                  const SizedBox(height: AppSizes.sm),
                  Text(
                    "고양이",
                    style: GoogleFonts.gowunBatang(
                        textStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.black54,
                                )),
                  ),
                ],
              ),
            ),
          ),
          OutlinedButton(
            onPressed: null,
            style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
            child: const Text(
              "펫 정보 수정",
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWeeklyCalendar(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Text("cal"),
        ],
      ),
    );
  }

  Widget _buildToDoSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "할 일",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: AppSizes.md,
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
                key: UniqueKey(),
                padding: const EdgeInsets.all(0),
                itemCount: todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TodoCard(
                      title: todoList[index].title,
                      onPressed: () async {
                        shouldUpdateToDoList = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ToDoDetailScreen(
                                      existingTitle: todoList[index].title,
                                      detailType: DetailType.edit,
                                      toDoId: todoList[index].id,
                                    )));

                        if (shouldUpdateToDoList) {
                          print("should up");
                          loadToDos();
                        }
                      },
                    ),
                  );
                }),
          ),

        ],
      ),
    );
  }
}
