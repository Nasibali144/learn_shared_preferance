
import 'package:hive_flutter/hive_flutter.dart';

class Post {
  late String title;
  late String content;

  Post(this.title, this.content);

  Post.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() => {
    "title" : title,
    "content" : content,
  };

  @override
  toString() {
    return "Title: $title\nContent: $content";
  }
}

class PostAdapter extends TypeAdapter<Post> {
  @override
  final typeId = 0;

  @override
  Post read(BinaryReader reader) {
    return Post.fromJson(reader.read(typeId) ?? {"title": "No title", "content": "No content"});
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer.write(obj.toJson());
  }
}