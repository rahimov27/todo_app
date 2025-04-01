import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/todoFolder/viewmodel/todo_folder_viewmodel.dart';

class SelectColorWidget extends StatelessWidget {
  final Color color;
  const SelectColorWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final folderProvider = context.watch<TodoFolderViewmodel>();

    bool isSelected = folderProvider.folderColorDefault == color;
    return GestureDetector(
      onTap: () {
        folderProvider.selectColor(color);
      },
      child: CircleAvatar(radius: isSelected ? 16 : 20, backgroundColor: color),
    );
  }
}
