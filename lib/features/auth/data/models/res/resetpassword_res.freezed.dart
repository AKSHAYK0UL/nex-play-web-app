// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resetpassword_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResetpasswordRes {

@JsonKey(name: "success") bool get success;@JsonKey(name: "data") JwtRes get data;
/// Create a copy of ResetpasswordRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetpasswordResCopyWith<ResetpasswordRes> get copyWith => _$ResetpasswordResCopyWithImpl<ResetpasswordRes>(this as ResetpasswordRes, _$identity);

  /// Serializes this ResetpasswordRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetpasswordRes&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'ResetpasswordRes(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $ResetpasswordResCopyWith<$Res>  {
  factory $ResetpasswordResCopyWith(ResetpasswordRes value, $Res Function(ResetpasswordRes) _then) = _$ResetpasswordResCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "data") JwtRes data
});


$JwtResCopyWith<$Res> get data;

}
/// @nodoc
class _$ResetpasswordResCopyWithImpl<$Res>
    implements $ResetpasswordResCopyWith<$Res> {
  _$ResetpasswordResCopyWithImpl(this._self, this._then);

  final ResetpasswordRes _self;
  final $Res Function(ResetpasswordRes) _then;

/// Create a copy of ResetpasswordRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as JwtRes,
  ));
}
/// Create a copy of ResetpasswordRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JwtResCopyWith<$Res> get data {
  
  return $JwtResCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResetpasswordRes].
extension ResetpasswordResPatterns on ResetpasswordRes {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetpasswordRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetpasswordRes() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetpasswordRes value)  $default,){
final _that = this;
switch (_that) {
case _ResetpasswordRes():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetpasswordRes value)?  $default,){
final _that = this;
switch (_that) {
case _ResetpasswordRes() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool success, @JsonKey(name: "data")  JwtRes data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetpasswordRes() when $default != null:
return $default(_that.success,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool success, @JsonKey(name: "data")  JwtRes data)  $default,) {final _that = this;
switch (_that) {
case _ResetpasswordRes():
return $default(_that.success,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool success, @JsonKey(name: "data")  JwtRes data)?  $default,) {final _that = this;
switch (_that) {
case _ResetpasswordRes() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResetpasswordRes implements ResetpasswordRes {
  const _ResetpasswordRes({@JsonKey(name: "success") required this.success, @JsonKey(name: "data") required this.data});
  factory _ResetpasswordRes.fromJson(Map<String, dynamic> json) => _$ResetpasswordResFromJson(json);

@override@JsonKey(name: "success") final  bool success;
@override@JsonKey(name: "data") final  JwtRes data;

/// Create a copy of ResetpasswordRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetpasswordResCopyWith<_ResetpasswordRes> get copyWith => __$ResetpasswordResCopyWithImpl<_ResetpasswordRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetpasswordResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetpasswordRes&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'ResetpasswordRes(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ResetpasswordResCopyWith<$Res> implements $ResetpasswordResCopyWith<$Res> {
  factory _$ResetpasswordResCopyWith(_ResetpasswordRes value, $Res Function(_ResetpasswordRes) _then) = __$ResetpasswordResCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "data") JwtRes data
});


@override $JwtResCopyWith<$Res> get data;

}
/// @nodoc
class __$ResetpasswordResCopyWithImpl<$Res>
    implements _$ResetpasswordResCopyWith<$Res> {
  __$ResetpasswordResCopyWithImpl(this._self, this._then);

  final _ResetpasswordRes _self;
  final $Res Function(_ResetpasswordRes) _then;

/// Create a copy of ResetpasswordRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_ResetpasswordRes(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as JwtRes,
  ));
}

/// Create a copy of ResetpasswordRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JwtResCopyWith<$Res> get data {
  
  return $JwtResCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
