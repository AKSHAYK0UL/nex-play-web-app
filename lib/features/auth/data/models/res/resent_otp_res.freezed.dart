// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resent_otp_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ResentOTPRes _$ResentOTPResFromJson(
  Map<String, dynamic> json
) {
    return RresentOTPRes.fromJson(
      json
    );
}

/// @nodoc
mixin _$ResentOTPRes {

@JsonKey(name: "success") bool get success;@JsonKey(name: "message") String get message;
/// Create a copy of ResentOTPRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResentOTPResCopyWith<ResentOTPRes> get copyWith => _$ResentOTPResCopyWithImpl<ResentOTPRes>(this as ResentOTPRes, _$identity);

  /// Serializes this ResentOTPRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResentOTPRes&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'ResentOTPRes(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $ResentOTPResCopyWith<$Res>  {
  factory $ResentOTPResCopyWith(ResentOTPRes value, $Res Function(ResentOTPRes) _then) = _$ResentOTPResCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "message") String message
});




}
/// @nodoc
class _$ResentOTPResCopyWithImpl<$Res>
    implements $ResentOTPResCopyWith<$Res> {
  _$ResentOTPResCopyWithImpl(this._self, this._then);

  final ResentOTPRes _self;
  final $Res Function(ResentOTPRes) _then;

/// Create a copy of ResentOTPRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResentOTPRes].
extension ResentOTPResPatterns on ResentOTPRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( RresentOTPRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case RresentOTPRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( RresentOTPRes value)  $default,){
final _that = this;
switch (_that) {
case RresentOTPRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( RresentOTPRes value)?  $default,){
final _that = this;
switch (_that) {
case RresentOTPRes() when $default != null:
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
case RresentOTPRes() when $default != null:
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
case RresentOTPRes():
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
case RresentOTPRes() when $default != null:
return $default(_that.success,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class RresentOTPRes implements ResentOTPRes {
  const RresentOTPRes({@JsonKey(name: "success") required this.success, @JsonKey(name: "message") required this.message});
  factory RresentOTPRes.fromJson(Map<String, dynamic> json) => _$RresentOTPResFromJson(json);

@override@JsonKey(name: "success") final  bool success;
@override@JsonKey(name: "message") final  String message;

/// Create a copy of ResentOTPRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RresentOTPResCopyWith<RresentOTPRes> get copyWith => _$RresentOTPResCopyWithImpl<RresentOTPRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RresentOTPResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RresentOTPRes&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'ResentOTPRes(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $RresentOTPResCopyWith<$Res> implements $ResentOTPResCopyWith<$Res> {
  factory $RresentOTPResCopyWith(RresentOTPRes value, $Res Function(RresentOTPRes) _then) = _$RresentOTPResCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "message") String message
});




}
/// @nodoc
class _$RresentOTPResCopyWithImpl<$Res>
    implements $RresentOTPResCopyWith<$Res> {
  _$RresentOTPResCopyWithImpl(this._self, this._then);

  final RresentOTPRes _self;
  final $Res Function(RresentOTPRes) _then;

/// Create a copy of ResentOTPRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(RresentOTPRes(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
