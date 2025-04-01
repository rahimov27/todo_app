import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:todo_app/features/home/widgets/folder_card.dart';
import 'package:todo_app/utils/app_colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: MasonryGridView.builder(
          itemCount: 10,
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemBuilder:
              (context, index) => FolderCard(
                width: double.infinity,
                height: (index % 4 == 0) ? 300 : 200,
                title: "folderProvider.folderModels[index].title",
                subtitle: "folderProvider.folderModels[index].title",
                progress: 35,
                color: AppColors.appGreen,
              ),
          // (context, index) => Container(
          //   height: (index % 4 == 0) ? 300 : 200, // Чередуем размеры
          //   decoration: BoxDecoration(
          //     color: Colors.blueAccent,
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          // ),
        ),
      ),
    );
  }
}
