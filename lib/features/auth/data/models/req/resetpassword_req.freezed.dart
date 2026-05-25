// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resetpassword_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResetpasswordReq {

@JsonKey(name: "email") String get email;@JsonKey(name: "otp") String get otp;@JsonKey(name: "new_password") String get newPassword;
/// Create a copy of ResetpasswordReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetpasswordReqCopyWith<ResetpasswordReq> get copyWith => _$ResetpasswordReqCopyWithImpl<ResetpasswordReq>(this as ResetpasswordReq, _$identity);

  /// Serializes this ResetpasswordReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetpasswordReq&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otp,newPassword);

@override
String toString() {
  return 'ResetpasswordReq(email: $email, otp: $otp, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $ResetpasswordReqCopyWith<$Res>  {
  factory $ResetpasswordReqCopyWith(ResetpasswordReq value, $Res Function(ResetpasswordReq) _then) = _$ResetpasswordReqCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "email") String email,@JsonKey(name: "otp") String otp,@JsonKey(name: "new_password") String newPassword
});




}
/// @nodoc
class _$ResetpasswordReqCopyWithImpl<$Res>
    implements $ResetpasswordReqCopyWith<$Res> {
  _$ResetpasswordReqCopyWithImpl(this._self, this._then);

  final ResetpasswordReq _self;
  final $Res Function(ResetpasswordReq) _then;

/// Create a copy of ResetpasswordReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? otp = null,Object? newPassword = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetpasswordReq].
extension ResetpasswordReqPatterns on ResetpasswordReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetpasswordReq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetpasswordReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetpasswordReq value)  $default,){
final _that = this;
switch (_that) {
case _ResetpasswordReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetpasswordReq value)?  $default,){
final _that = this;
switch (_that) {
case _ResetpasswordReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "email")  String email, @JsonKey(name: "otp")  String otp, @JsonKey(name: "new_password")  String newPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetpasswordReq() when $default != null:
return $default(_that.email,_that.otp,_that.newPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "email")  String email, @JsonKey(name: "otp")  String otp, @JsonKey(name: "new_password")  String newPassword)  $default,) {final _that = this;
switch (_that) {
case _ResetpasswordReq():
return $default(_that.email,_that.otp,_that.newPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "email")  String email, @JsonKey(name: "otp")  String otp, @JsonKey(name: "new_password")  String newPassword)?  $default,) {final _that = this;
switch (_that) {
case _ResetpasswordReq() when $default != null:
return $default(_that.email,_that.otp,_that.newPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResetpasswordReq implements ResetpasswordReq {
  const _ResetpasswordReq({@JsonKey(name: "email") required this.email, @JsonKey(name: "otp") required this.otp, @JsonKey(name: "new_password") required this.newPassword});
  factory _ResetpasswordReq.fromJson(Map<String, dynamic> json) => _$ResetpasswordReqFromJson(json);

@override@JsonKey(name: "email") final  String email;
@override@JsonKey(name: "otp") final  String otp;
@override@JsonKey(name: "new_password") final  String newPassword;

/// Create a copy of ResetpasswordReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetpasswordReqCopyWith<_ResetpasswordReq> get copyWith => __$ResetpasswordReqCopyWithImpl<_ResetpasswordReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetpasswordReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetpasswordReq&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otp,newPassword);

@override
String toString() {
  return 'ResetpasswordReq(email: $email, otp: $otp, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ResetpasswordReqCopyWith<$Res> implements $ResetpasswordReqCopyWith<$Res> {
  factory _$ResetpasswordReqCopyWith(_ResetpasswordReq value, $Res Function(_ResetpasswordReq) _then) = __$ResetpasswordReqCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "email") String email,@JsonKey(name: "otp") String otp,@JsonKey(name: "new_password") String newPassword
});




}
/// @nodoc
class __$ResetpasswordReqCopyWithImpl<$Res>
    implements _$ResetpasswordReqCopyWith<$Res> {
  __$ResetpasswordReqCopyWithImpl(this._self, this._then);

  final _ResetpasswordReq _self;
  final $Res Function(_ResetpasswordReq) _then;

/// Create a copy of ResetpasswordReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,Object? newPassword = null,}) {
  return _then(_ResetpasswordReq(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
