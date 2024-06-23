import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saidoffapp/core/router/name_routes.dart';
import 'package:saidoffapp/core/services/todo/todo.dart';
import 'package:saidoffapp/data/todomodel.dart';
import 'package:saidoffapp/features/home/controller/home_ctr.dart';
import 'package:saidoffapp/setup.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    var ctr = ref.read(homeController);
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  debugPrint('oldin');
                  debugPrint(box.get('access'));
                  context.goNamed(Routes.login);
                 await box.clear();
                                   debugPrint('keyin');

                  debugPrint(box.get('access'));
                },
                icon: const Icon(Icons.logout))
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: TodoService.list.length,
          itemBuilder: (contex, index) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(TodoService.list[index].text),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(
                          Icons.call,
                          color: Colors.green,
                        )),
                    IconButton(
                      onPressed: () async {
                        ctr.deleteTodo(TodoService.list[index].id.toString());
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (contex) {
              return Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    controller: ctr.massage,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text('close')),
                      ElevatedButton(
                          onPressed: () async {
                            ctr.postTodo(TodoModel(id: 1, text: ctr.massage.text, isDone: false));
                            context.pop();
                            ctr.massage.clear();
                          },
                          child: const Text('save'))
                    ],
                  )
                ],
              );
            });
      }),
    );
  }
}
