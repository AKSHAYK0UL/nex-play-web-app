// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyReq {

@JsonKey(name: "email") String get email;@JsonKey(name: "otp") String get otp;
/// Create a copy of VerifyReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyReqCopyWith<VerifyReq> get copyWith => _$VerifyReqCopyWithImpl<VerifyReq>(this as VerifyReq, _$identity);

  /// Serializes this VerifyReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyReq&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'VerifyReq(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $VerifyReqCopyWith<$Res>  {
  factory $VerifyReqCopyWith(VerifyReq value, $Res Function(VerifyReq) _then) = _$VerifyReqCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "email") String email,@JsonKey(name: "otp") String otp
});




}
/// @nodoc
class _$VerifyReqCopyWithImpl<$Res>
    implements $VerifyReqCopyWith<$Res> {
  _$VerifyReqCopyWithImpl(this._self, this._then);

  final VerifyReq _self;
  final $Res Function(VerifyReq) _then;

/// Create a copy of VerifyReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? otp = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyReq].
extension VerifyReqPatterns on VerifyReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyReq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyReq value)  $default,){
final _that = this;
switch (_that) {
case _VerifyReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyReq value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "email")  String email, @JsonKey(name: "otp")  String otp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyReq() when $default != null:
return $default(_that.email,_that.otp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "email")  String email, @JsonKey(name: "otp")  String otp)  $default,) {final _that = this;
switch (_that) {
case _VerifyReq():
return $default(_that.email,_that.otp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "email")  String email, @JsonKey(name: "otp")  String otp)?  $default,) {final _that = this;
switch (_that) {
case _VerifyReq() when $default != null:
return $default(_that.email,_that.otp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyReq implements VerifyReq {
  const _VerifyReq({@JsonKey(name: "email") required this.email, @JsonKey(name: "otp") required this.otp});
  factory _VerifyReq.fromJson(Map<String, dynamic> json) => _$VerifyReqFromJson(json);

@override@JsonKey(name: "email") final  String email;
@override@JsonKey(name: "otp") final  String otp;

/// Create a copy of VerifyReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyReqCopyWith<_VerifyReq> get copyWith => __$VerifyReqCopyWithImpl<_VerifyReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyReq&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'VerifyReq(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$VerifyReqCopyWith<$Res> implements $VerifyReqCopyWith<$Res> {
  factory _$VerifyReqCopyWith(_VerifyReq value, $Res Function(_VerifyReq) _then) = __$VerifyReqCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "email") String email,@JsonKey(name: "otp") String otp
});




}
/// @nodoc
class __$VerifyReqCopyWithImpl<$Res>
    implements _$VerifyReqCopyWith<$Res> {
  __$VerifyReqCopyWithImpl(this._self, this._then);

  final _VerifyReq _self;
  final $Res Function(_VerifyReq) _then;

/// Create a copy of VerifyReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(_VerifyReq(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
