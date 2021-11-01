import 'package:flutter/material.dart';

import 'package:todo_firebase/model/todo_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TodoModel.todomodel.isEmpty
        ? Container(
            child: Text('No Todos'),
          )
        : Container(
            child: ListView.separated(
                separatorBuilder: (context, index) => Container(
                      height: 10,
                    ),
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(16),
                itemCount: TodoModel.todomodel.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      key: Key("${TodoModel.todomodel[index].id}"),
                      actions: <Widget>[
                        IconSlideAction(
                          caption: 'EDIT',
                          color: Colors.green,
                          icon: Icons.edit,
                          onTap: () {},
                        ),
                      ],
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {},
                        ),
                      ],
                      child: Row(
                        children: [
                          Checkbox(
                              activeColor: Colors.blue,
                              checkColor: Colors.white,
                              value: TodoModel.todomodel[index].isDone,
                              onChanged: (_) {}),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(TodoModel.todomodel[index].title),
                                if (TodoModel
                                    .todomodel[index].descrioption.isNotEmpty)
                                  Container(
                                    child: Text(TodoModel
                                        .todomodel[index].descrioption),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
  }
}
