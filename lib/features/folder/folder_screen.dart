import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/folder/widgets/folder_screen_static.dart';
import 'package:todo_app/features/home/widgets/folder_card.dart';
import 'package:todo_app/features/home/widgets/home_search.dart';
import 'package:todo_app/features/todoFolder/viewmodel/todo_folder_viewmodel.dart';

class FolderScreen extends StatelessWidget {
  const FolderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final folderProvider = Provider.of<TodoFolderViewmodel>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body:
            folderProvider.folderModels.isNotEmpty
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24),
                        HomeSearch(),
                        SizedBox(height: 24),
                        Text(
                          "Папки",
                          style: TextStyle(
                            letterSpacing: -0.7,
                            fontFamily: "Inter-Bold",
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 14),
                        MasonryGridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          shrinkWrap: true,
                          itemCount: folderProvider.folderModels.length,
                          gridDelegate:
                              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                          itemBuilder:
                              (context, index) => FolderCard(
                                width: double.infinity,
                                height: (index % 3 == 0) ? 300 : 200,
                                title: folderProvider.folderModels[index].title,
                                subtitle:
                                    folderProvider.folderModels[index].subtitle,
                                progress:
                                    folderProvider.folderModels[index].porgress,
                                color:
                                    folderProvider
                                        .folderModels[index]
                                        .backgroundColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                )
                : FolderScreenStatic(),
      ),
    );
  }
}
