// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resent_otp_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResentOTPReq {

@JsonKey(name: "email") String get email;@JsonKey(name: "purpose") String get purpose;
/// Create a copy of ResentOTPReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResentOTPReqCopyWith<ResentOTPReq> get copyWith => _$ResentOTPReqCopyWithImpl<ResentOTPReq>(this as ResentOTPReq, _$identity);

  /// Serializes this ResentOTPReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResentOTPReq&&(identical(other.email, email) || other.email == email)&&(identical(other.purpose, purpose) || other.purpose == purpose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,purpose);

@override
String toString() {
  return 'ResentOTPReq(email: $email, purpose: $purpose)';
}


}

/// @nodoc
abstract mixin class $ResentOTPReqCopyWith<$Res>  {
  factory $ResentOTPReqCopyWith(ResentOTPReq value, $Res Function(ResentOTPReq) _then) = _$ResentOTPReqCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "email") String email,@JsonKey(name: "purpose") String purpose
});




}
/// @nodoc
class _$ResentOTPReqCopyWithImpl<$Res>
    implements $ResentOTPReqCopyWith<$Res> {
  _$ResentOTPReqCopyWithImpl(this._self, this._then);

  final ResentOTPReq _self;
  final $Res Function(ResentOTPReq) _then;

/// Create a copy of ResentOTPReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? purpose = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResentOTPReq].
extension ResentOTPReqPatterns on ResentOTPReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResentOTPReq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResentOTPReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResentOTPReq value)  $default,){
final _that = this;
switch (_that) {
case _ResentOTPReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResentOTPReq value)?  $default,){
final _that = this;
switch (_that) {
case _ResentOTPReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "email")  String email, @JsonKey(name: "purpose")  String purpose)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResentOTPReq() when $default != null:
return $default(_that.email,_that.purpose);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "email")  String email, @JsonKey(name: "purpose")  String purpose)  $default,) {final _that = this;
switch (_that) {
case _ResentOTPReq():
return $default(_that.email,_that.purpose);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "email")  String email, @JsonKey(name: "purpose")  String purpose)?  $default,) {final _that = this;
switch (_that) {
case _ResentOTPReq() when $default != null:
return $default(_that.email,_that.purpose);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResentOTPReq implements ResentOTPReq {
  const _ResentOTPReq({@JsonKey(name: "email") required this.email, @JsonKey(name: "purpose") required this.purpose});
  factory _ResentOTPReq.fromJson(Map<String, dynamic> json) => _$ResentOTPReqFromJson(json);

@override@JsonKey(name: "email") final  String email;
@override@JsonKey(name: "purpose") final  String purpose;

/// Create a copy of ResentOTPReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResentOTPReqCopyWith<_ResentOTPReq> get copyWith => __$ResentOTPReqCopyWithImpl<_ResentOTPReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResentOTPReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResentOTPReq&&(identical(other.email, email) || other.email == email)&&(identical(other.purpose, purpose) || other.purpose == purpose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,purpose);

@override
String toString() {
  return 'ResentOTPReq(email: $email, purpose: $purpose)';
}


}

/// @nodoc
abstract mixin class _$ResentOTPReqCopyWith<$Res> implements $ResentOTPReqCopyWith<$Res> {
  factory _$ResentOTPReqCopyWith(_ResentOTPReq value, $Res Function(_ResentOTPReq) _then) = __$ResentOTPReqCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "email") String email,@JsonKey(name: "purpose") String purpose
});




}
/// @nodoc
class __$ResentOTPReqCopyWithImpl<$Res>
    implements _$ResentOTPReqCopyWith<$Res> {
  __$ResentOTPReqCopyWithImpl(this._self, this._then);

  final _ResentOTPReq _self;
  final $Res Function(_ResentOTPReq) _then;

/// Create a copy of ResentOTPReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? purpose = null,}) {
  return _then(_ResentOTPReq(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
