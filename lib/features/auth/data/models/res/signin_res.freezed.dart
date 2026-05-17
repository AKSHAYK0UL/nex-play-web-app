// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SigninRes {

@JsonKey(name: "success") bool get success;@JsonKey(name: "data") JwtRes get data;
/// Create a copy of SigninRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SigninResCopyWith<SigninRes> get copyWith => _$SigninResCopyWithImpl<SigninRes>(this as SigninRes, _$identity);

  /// Serializes this SigninRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SigninRes&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'SigninRes(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $SigninResCopyWith<$Res>  {
  factory $SigninResCopyWith(SigninRes value, $Res Function(SigninRes) _then) = _$SigninResCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "data") JwtRes data
});


$JwtResCopyWith<$Res> get data;

}
/// @nodoc
class _$SigninResCopyWithImpl<$Res>
    implements $SigninResCopyWith<$Res> {
  _$SigninResCopyWithImpl(this._self, this._then);

  final SigninRes _self;
  final $Res Function(SigninRes) _then;

/// Create a copy of SigninRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as JwtRes,
  ));
}
/// Create a copy of SigninRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JwtResCopyWith<$Res> get data {
  
  return $JwtResCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SigninRes].
extension SigninResPatterns on SigninRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SigninRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SigninRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SigninRes value)  $default,){
final _that = this;
switch (_that) {
case _SigninRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SigninRes value)?  $default,){
final _that = this;
switch (_that) {
case _SigninRes() when $default != null:
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
case _SigninRes() when $default != null:
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
case _SigninRes():
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
case _SigninRes() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SigninRes implements SigninRes {
  const _SigninRes({@JsonKey(name: "success") required this.success, @JsonKey(name: "data") required this.data});
  factory _SigninRes.fromJson(Map<String, dynamic> json) => _$SigninResFromJson(json);

@override@JsonKey(name: "success") final  bool success;
@override@JsonKey(name: "data") final  JwtRes data;

/// Create a copy of SigninRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SigninResCopyWith<_SigninRes> get copyWith => __$SigninResCopyWithImpl<_SigninRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SigninResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SigninRes&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'SigninRes(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SigninResCopyWith<$Res> implements $SigninResCopyWith<$Res> {
  factory _$SigninResCopyWith(_SigninRes value, $Res Function(_SigninRes) _then) = __$SigninResCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "data") JwtRes data
});


@override $JwtResCopyWith<$Res> get data;

}
/// @nodoc
class __$SigninResCopyWithImpl<$Res>
    implements _$SigninResCopyWith<$Res> {
  __$SigninResCopyWithImpl(this._self, this._then);

  final _SigninRes _self;
  final $Res Function(_SigninRes) _then;

/// Create a copy of SigninRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_SigninRes(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as JwtRes,
  ));
}

/// Create a copy of SigninRes
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
