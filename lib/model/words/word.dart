import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

@JsonSerializable()
class Word extends Equatable {

  final String en;
  final String tr;

  const Word({required this.en, required this.tr});

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);
  Map<String, dynamic> toJson( instance) => _$WordToJson(this);

  @override
  String toString() {
    return 'Word{en: $en, tr: $tr}';
  }

  @override
  List<Object> get props => [en, tr];
}
