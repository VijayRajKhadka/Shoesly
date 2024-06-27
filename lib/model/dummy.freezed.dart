// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dummy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Dummy _$DummyFromJson(Map<String, dynamic> json) {
  return _Dummy.fromJson(json);
}

/// @nodoc
mixin _$Dummy {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DummyCopyWith<Dummy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DummyCopyWith<$Res> {
  factory $DummyCopyWith(Dummy value, $Res Function(Dummy) then) =
      _$DummyCopyWithImpl<$Res, Dummy>;
  @useResult
  $Res call({int? id, String? name, String? location, int? age});
}

/// @nodoc
class _$DummyCopyWithImpl<$Res, $Val extends Dummy>
    implements $DummyCopyWith<$Res> {
  _$DummyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? age = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DummyImplCopyWith<$Res> implements $DummyCopyWith<$Res> {
  factory _$$DummyImplCopyWith(
          _$DummyImpl value, $Res Function(_$DummyImpl) then) =
      __$$DummyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? location, int? age});
}

/// @nodoc
class __$$DummyImplCopyWithImpl<$Res>
    extends _$DummyCopyWithImpl<$Res, _$DummyImpl>
    implements _$$DummyImplCopyWith<$Res> {
  __$$DummyImplCopyWithImpl(
      _$DummyImpl _value, $Res Function(_$DummyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? age = freezed,
  }) {
    return _then(_$DummyImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$DummyImpl implements _Dummy {
  const _$DummyImpl({this.id, this.name, this.location, this.age});

  factory _$DummyImpl.fromJson(Map<String, dynamic> json) =>
      _$$DummyImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? location;
  @override
  final int? age;

  @override
  String toString() {
    return 'Dummy(id: $id, name: $name, location: $location, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DummyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, location, age);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DummyImplCopyWith<_$DummyImpl> get copyWith =>
      __$$DummyImplCopyWithImpl<_$DummyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DummyImplToJson(
      this,
    );
  }
}

abstract class _Dummy implements Dummy {
  const factory _Dummy(
      {final int? id,
      final String? name,
      final String? location,
      final int? age}) = _$DummyImpl;

  factory _Dummy.fromJson(Map<String, dynamic> json) = _$DummyImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get location;
  @override
  int? get age;
  @override
  @JsonKey(ignore: true)
  _$$DummyImplCopyWith<_$DummyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
