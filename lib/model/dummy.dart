import 'package:freezed_annotation/freezed_annotation.dart';

part 'dummy.freezed.dart';
part 'dummy.g.dart';
@freezed

class Dummy with _$Dummy{
  @JsonSerializable(fieldRename:FieldRename.snake,explicitToJson:true)
  const factory Dummy({
    int? id,
    @JsonKey(name: "first_name") String? name,
    String? location,
    int? age,
})=_Dummy;
  factory Dummy.fromJson(Map<String,dynamic> json)=>_$DummyFromJson(json);



}
