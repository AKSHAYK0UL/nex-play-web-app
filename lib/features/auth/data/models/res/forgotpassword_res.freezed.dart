// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgotpassword_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgotpasswordRes {

@JsonKey(name: "success") bool get success;@JsonKey(name: "message") String get message;
/// Create a copy of ForgotpasswordRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotpasswordResCopyWith<ForgotpasswordRes> get copyWith => _$ForgotpasswordResCopyWithImpl<ForgotpasswordRes>(this as ForgotpasswordRes, _$identity);

  /// Serializes this ForgotpasswordRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotpasswordRes&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'ForgotpasswordRes(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $ForgotpasswordResCopyWith<$Res>  {
  factory $ForgotpasswordResCopyWith(ForgotpasswordRes value, $Res Function(ForgotpasswordRes) _then) = _$ForgotpasswordResCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "message") String message
});




}
/// @nodoc
class _$ForgotpasswordResCopyWithImpl<$Res>
    implements $ForgotpasswordResCopyWith<$Res> {
  _$ForgotpasswordResCopyWithImpl(this._self, this._then);

  final ForgotpasswordRes _self;
  final $Res Function(ForgotpasswordRes) _then;

/// Create a copy of ForgotpasswordRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotpasswordRes].
extension ForgotpasswordResPatterns on ForgotpasswordRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotpasswordRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotpasswordRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotpasswordRes value)  $default,){
final _that = this;
switch (_that) {
case _ForgotpasswordRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotpasswordRes value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotpasswordRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool success, @JsonKey(name: "message")  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotpasswordRes() when $default != null:
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool success, @JsonKey(name: "message")  String message)  $default,) {final _that = this;
switch (_that) {
case _ForgotpasswordRes():
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool success, @JsonKey(name: "message")  String message)?  $default,) {final _that = this;
switch (_that) {
case _ForgotpasswordRes() when $default != null:
return $default(_that.success,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForgotpasswordRes implements ForgotpasswordRes {
  const _ForgotpasswordRes({@JsonKey(name: "success") required this.success, @JsonKey(name: "message") required this.message});
  factory _ForgotpasswordRes.fromJson(Map<String, dynamic> json) => _$ForgotpasswordResFromJson(json);

@override@JsonKey(name: "success") final  bool success;
@override@JsonKey(name: "message") final  String message;

/// Create a copy of ForgotpasswordRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotpasswordResCopyWith<_ForgotpasswordRes> get copyWith => __$ForgotpasswordResCopyWithImpl<_ForgotpasswordRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForgotpasswordResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotpasswordRes&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'ForgotpasswordRes(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ForgotpasswordResCopyWith<$Res> implements $ForgotpasswordResCopyWith<$Res> {
  factory _$ForgotpasswordResCopyWith(_ForgotpasswordRes value, $Res Function(_ForgotpasswordRes) _then) = __$ForgotpasswordResCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "message") String message
});




}
/// @nodoc
class __$ForgotpasswordResCopyWithImpl<$Res>
    implements _$ForgotpasswordResCopyWith<$Res> {
  __$ForgotpasswordResCopyWithImpl(this._self, this._then);

  final _ForgotpasswordRes _self;
  final $Res Function(_ForgotpasswordRes) _then;

/// Create a copy of ForgotpasswordRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_ForgotpasswordRes(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
