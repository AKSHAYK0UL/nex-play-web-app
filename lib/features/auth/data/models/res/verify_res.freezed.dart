// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyRes {

@JsonKey(name: "success") bool get success;@JsonKey(name: "data") JwtRes get data;
/// Create a copy of VerifyRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyResCopyWith<VerifyRes> get copyWith => _$VerifyResCopyWithImpl<VerifyRes>(this as VerifyRes, _$identity);

  /// Serializes this VerifyRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyRes&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'VerifyRes(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $VerifyResCopyWith<$Res>  {
  factory $VerifyResCopyWith(VerifyRes value, $Res Function(VerifyRes) _then) = _$VerifyResCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "data") JwtRes data
});


$JwtResCopyWith<$Res> get data;

}
/// @nodoc
class _$VerifyResCopyWithImpl<$Res>
    implements $VerifyResCopyWith<$Res> {
  _$VerifyResCopyWithImpl(this._self, this._then);

  final VerifyRes _self;
  final $Res Function(VerifyRes) _then;

/// Create a copy of VerifyRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as JwtRes,
  ));
}
/// Create a copy of VerifyRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JwtResCopyWith<$Res> get data {
  
  return $JwtResCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VerifyRes].
extension VerifyResPatterns on VerifyRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyRes value)  $default,){
final _that = this;
switch (_that) {
case _VerifyRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyRes value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyRes() when $default != null:
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
case _VerifyRes() when $default != null:
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
case _VerifyRes():
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
case _VerifyRes() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyRes implements VerifyRes {
  const _VerifyRes({@JsonKey(name: "success") required this.success, @JsonKey(name: "data") required this.data});
  factory _VerifyRes.fromJson(Map<String, dynamic> json) => _$VerifyResFromJson(json);

@override@JsonKey(name: "success") final  bool success;
@override@JsonKey(name: "data") final  JwtRes data;

/// Create a copy of VerifyRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyResCopyWith<_VerifyRes> get copyWith => __$VerifyResCopyWithImpl<_VerifyRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyRes&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'VerifyRes(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VerifyResCopyWith<$Res> implements $VerifyResCopyWith<$Res> {
  factory _$VerifyResCopyWith(_VerifyRes value, $Res Function(_VerifyRes) _then) = __$VerifyResCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "data") JwtRes data
});


@override $JwtResCopyWith<$Res> get data;

}
/// @nodoc
class __$VerifyResCopyWithImpl<$Res>
    implements _$VerifyResCopyWith<$Res> {
  __$VerifyResCopyWithImpl(this._self, this._then);

  final _VerifyRes _self;
  final $Res Function(_VerifyRes) _then;

/// Create a copy of VerifyRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_VerifyRes(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as JwtRes,
  ));
}

/// Create a copy of VerifyRes
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
