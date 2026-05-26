// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthSignUp value)?  signUp,TResult Function( _AuthVerify value)?  verify,TResult Function( _AuthSignIn value)?  signIn,TResult Function( _AuthForgotPassword value)?  forgotPassword,TResult Function( _AuthResetPassword value)?  resetPassword,TResult Function( _AuthResentOTP value)?  resentOTP,TResult Function( _AuthLogout value)?  logout,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthSignUp() when signUp != null:
return signUp(_that);case _AuthVerify() when verify != null:
return verify(_that);case _AuthSignIn() when signIn != null:
return signIn(_that);case _AuthForgotPassword() when forgotPassword != null:
return forgotPassword(_that);case _AuthResetPassword() when resetPassword != null:
return resetPassword(_that);case _AuthResentOTP() when resentOTP != null:
return resentOTP(_that);case _AuthLogout() when logout != null:
return logout(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthSignUp value)  signUp,required TResult Function( _AuthVerify value)  verify,required TResult Function( _AuthSignIn value)  signIn,required TResult Function( _AuthForgotPassword value)  forgotPassword,required TResult Function( _AuthResetPassword value)  resetPassword,required TResult Function( _AuthResentOTP value)  resentOTP,required TResult Function( _AuthLogout value)  logout,}){
final _that = this;
switch (_that) {
case _AuthSignUp():
return signUp(_that);case _AuthVerify():
return verify(_that);case _AuthSignIn():
return signIn(_that);case _AuthForgotPassword():
return forgotPassword(_that);case _AuthResetPassword():
return resetPassword(_that);case _AuthResentOTP():
return resentOTP(_that);case _AuthLogout():
return logout(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthSignUp value)?  signUp,TResult? Function( _AuthVerify value)?  verify,TResult? Function( _AuthSignIn value)?  signIn,TResult? Function( _AuthForgotPassword value)?  forgotPassword,TResult? Function( _AuthResetPassword value)?  resetPassword,TResult? Function( _AuthResentOTP value)?  resentOTP,TResult? Function( _AuthLogout value)?  logout,}){
final _that = this;
switch (_that) {
case _AuthSignUp() when signUp != null:
return signUp(_that);case _AuthVerify() when verify != null:
return verify(_that);case _AuthSignIn() when signIn != null:
return signIn(_that);case _AuthForgotPassword() when forgotPassword != null:
return forgotPassword(_that);case _AuthResetPassword() when resetPassword != null:
return resetPassword(_that);case _AuthResentOTP() when resentOTP != null:
return resentOTP(_that);case _AuthLogout() when logout != null:
return logout(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name,  String email,  String password)?  signUp,TResult Function( String email,  String otp)?  verify,TResult Function( String email,  String password)?  signIn,TResult Function( String email)?  forgotPassword,TResult Function( String email,  String otp,  String newPassword)?  resetPassword,TResult Function( String email)?  resentOTP,TResult Function()?  logout,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthSignUp() when signUp != null:
return signUp(_that.name,_that.email,_that.password);case _AuthVerify() when verify != null:
return verify(_that.email,_that.otp);case _AuthSignIn() when signIn != null:
return signIn(_that.email,_that.password);case _AuthForgotPassword() when forgotPassword != null:
return forgotPassword(_that.email);case _AuthResetPassword() when resetPassword != null:
return resetPassword(_that.email,_that.otp,_that.newPassword);case _AuthResentOTP() when resentOTP != null:
return resentOTP(_that.email);case _AuthLogout() when logout != null:
return logout();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name,  String email,  String password)  signUp,required TResult Function( String email,  String otp)  verify,required TResult Function( String email,  String password)  signIn,required TResult Function( String email)  forgotPassword,required TResult Function( String email,  String otp,  String newPassword)  resetPassword,required TResult Function( String email)  resentOTP,required TResult Function()  logout,}) {final _that = this;
switch (_that) {
case _AuthSignUp():
return signUp(_that.name,_that.email,_that.password);case _AuthVerify():
return verify(_that.email,_that.otp);case _AuthSignIn():
return signIn(_that.email,_that.password);case _AuthForgotPassword():
return forgotPassword(_that.email);case _AuthResetPassword():
return resetPassword(_that.email,_that.otp,_that.newPassword);case _AuthResentOTP():
return resentOTP(_that.email);case _AuthLogout():
return logout();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name,  String email,  String password)?  signUp,TResult? Function( String email,  String otp)?  verify,TResult? Function( String email,  String password)?  signIn,TResult? Function( String email)?  forgotPassword,TResult? Function( String email,  String otp,  String newPassword)?  resetPassword,TResult? Function( String email)?  resentOTP,TResult? Function()?  logout,}) {final _that = this;
switch (_that) {
case _AuthSignUp() when signUp != null:
return signUp(_that.name,_that.email,_that.password);case _AuthVerify() when verify != null:
return verify(_that.email,_that.otp);case _AuthSignIn() when signIn != null:
return signIn(_that.email,_that.password);case _AuthForgotPassword() when forgotPassword != null:
return forgotPassword(_that.email);case _AuthResetPassword() when resetPassword != null:
return resetPassword(_that.email,_that.otp,_that.newPassword);case _AuthResentOTP() when resentOTP != null:
return resentOTP(_that.email);case _AuthLogout() when logout != null:
return logout();case _:
  return null;

}
}

}

/// @nodoc


class _AuthSignUp implements AuthEvent {
  const _AuthSignUp({required this.name, required this.email, required this.password});
  

 final  String name;
 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSignUpCopyWith<_AuthSignUp> get copyWith => __$AuthSignUpCopyWithImpl<_AuthSignUp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSignUp&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,password);

@override
String toString() {
  return 'AuthEvent.signUp(name: $name, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$AuthSignUpCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$AuthSignUpCopyWith(_AuthSignUp value, $Res Function(_AuthSignUp) _then) = __$AuthSignUpCopyWithImpl;
@useResult
$Res call({
 String name, String email, String password
});




}
/// @nodoc
class __$AuthSignUpCopyWithImpl<$Res>
    implements _$AuthSignUpCopyWith<$Res> {
  __$AuthSignUpCopyWithImpl(this._self, this._then);

  final _AuthSignUp _self;
  final $Res Function(_AuthSignUp) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? password = null,}) {
  return _then(_AuthSignUp(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AuthVerify implements AuthEvent {
  const _AuthVerify({required this.email, required this.otp});
  

 final  String email;
 final  String otp;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthVerifyCopyWith<_AuthVerify> get copyWith => __$AuthVerifyCopyWithImpl<_AuthVerify>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthVerify&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'AuthEvent.verify(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$AuthVerifyCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$AuthVerifyCopyWith(_AuthVerify value, $Res Function(_AuthVerify) _then) = __$AuthVerifyCopyWithImpl;
@useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class __$AuthVerifyCopyWithImpl<$Res>
    implements _$AuthVerifyCopyWith<$Res> {
  __$AuthVerifyCopyWithImpl(this._self, this._then);

  final _AuthVerify _self;
  final $Res Function(_AuthVerify) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(_AuthVerify(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AuthSignIn implements AuthEvent {
  const _AuthSignIn({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSignInCopyWith<_AuthSignIn> get copyWith => __$AuthSignInCopyWithImpl<_AuthSignIn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSignIn&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.signIn(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$AuthSignInCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$AuthSignInCopyWith(_AuthSignIn value, $Res Function(_AuthSignIn) _then) = __$AuthSignInCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$AuthSignInCopyWithImpl<$Res>
    implements _$AuthSignInCopyWith<$Res> {
  __$AuthSignInCopyWithImpl(this._self, this._then);

  final _AuthSignIn _self;
  final $Res Function(_AuthSignIn) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_AuthSignIn(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AuthForgotPassword implements AuthEvent {
  const _AuthForgotPassword({required this.email});
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthForgotPasswordCopyWith<_AuthForgotPassword> get copyWith => __$AuthForgotPasswordCopyWithImpl<_AuthForgotPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthForgotPassword&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.forgotPassword(email: $email)';
}


}

/// @nodoc
abstract mixin class _$AuthForgotPasswordCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$AuthForgotPasswordCopyWith(_AuthForgotPassword value, $Res Function(_AuthForgotPassword) _then) = __$AuthForgotPasswordCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$AuthForgotPasswordCopyWithImpl<$Res>
    implements _$AuthForgotPasswordCopyWith<$Res> {
  __$AuthForgotPasswordCopyWithImpl(this._self, this._then);

  final _AuthForgotPassword _self;
  final $Res Function(_AuthForgotPassword) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_AuthForgotPassword(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AuthResetPassword implements AuthEvent {
  const _AuthResetPassword({required this.email, required this.otp, required this.newPassword});
  

 final  String email;
 final  String otp;
 final  String newPassword;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResetPasswordCopyWith<_AuthResetPassword> get copyWith => __$AuthResetPasswordCopyWithImpl<_AuthResetPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResetPassword&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp,newPassword);

@override
String toString() {
  return 'AuthEvent.resetPassword(email: $email, otp: $otp, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$AuthResetPasswordCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$AuthResetPasswordCopyWith(_AuthResetPassword value, $Res Function(_AuthResetPassword) _then) = __$AuthResetPasswordCopyWithImpl;
@useResult
$Res call({
 String email, String otp, String newPassword
});




}
/// @nodoc
class __$AuthResetPasswordCopyWithImpl<$Res>
    implements _$AuthResetPasswordCopyWith<$Res> {
  __$AuthResetPasswordCopyWithImpl(this._self, this._then);

  final _AuthResetPassword _self;
  final $Res Function(_AuthResetPassword) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,Object? newPassword = null,}) {
  return _then(_AuthResetPassword(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AuthResentOTP implements AuthEvent {
  const _AuthResentOTP({required this.email});
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResentOTPCopyWith<_AuthResentOTP> get copyWith => __$AuthResentOTPCopyWithImpl<_AuthResentOTP>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResentOTP&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.resentOTP(email: $email)';
}


}

/// @nodoc
abstract mixin class _$AuthResentOTPCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$AuthResentOTPCopyWith(_AuthResentOTP value, $Res Function(_AuthResentOTP) _then) = __$AuthResentOTPCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$AuthResentOTPCopyWithImpl<$Res>
    implements _$AuthResentOTPCopyWith<$Res> {
  __$AuthResentOTPCopyWithImpl(this._self, this._then);

  final _AuthResentOTP _self;
  final $Res Function(_AuthResentOTP) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_AuthResentOTP(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AuthLogout implements AuthEvent {
  const _AuthLogout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLogout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logout()';
}


}




// dart format on
