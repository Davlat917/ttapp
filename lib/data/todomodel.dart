
import 'dart:convert';

List<TodoModel> todoModelFromJson(String str) => List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));

String todoModelToJson(List<TodoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
    final int id;
    final String text;
    final bool isDone;

    TodoModel({
        required this.id,
        required this.text,
        required this.isDone,
    });

    TodoModel copyWith({
        int? id,
        String? text,
        bool? isDone,
    }) => 
        TodoModel(
            id: id ?? this.id,
            text: text ?? this.text,
            isDone: isDone ?? this.isDone,
        );

    factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["id"],
        text: json["text"],
        isDone: json["is_done"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "is_done": isDone,
    };
}
