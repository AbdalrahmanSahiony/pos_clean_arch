import 'package:clean_archicture/features/posts/domain/entities/posts.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Post {
  int? userId;
  PostModel({
    this.userId,
    super.id,
    required super.body,
    required super.title,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
