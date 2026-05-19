// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthInitial value)?  initial,TResult Function( _AuthLoading value)?  loading,TResult Function( _AuthVerify value)?  verify,TResult Function( _AuthSuccess value)?  success,TResult Function( _AuthError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial(_that);case _AuthLoading() when loading != null:
return loading(_that);case _AuthVerify() when verify != null:
return verify(_that);case _AuthSuccess() when success != null:
return success(_that);case _AuthError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthInitial value)  initial,required TResult Function( _AuthLoading value)  loading,required TResult Function( _AuthVerify value)  verify,required TResult Function( _AuthSuccess value)  success,required TResult Function( _AuthError value)  error,}){
final _that = this;
switch (_that) {
case _AuthInitial():
return initial(_that);case _AuthLoading():
return loading(_that);case _AuthVerify():
return verify(_that);case _AuthSuccess():
return success(_that);case _AuthError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthInitial value)?  initial,TResult? Function( _AuthLoading value)?  loading,TResult? Function( _AuthVerify value)?  verify,TResult? Function( _AuthSuccess value)?  success,TResult? Function( _AuthError value)?  error,}){
final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial(_that);case _AuthLoading() when loading != null:
return loading(_that);case _AuthVerify() when verify != null:
return verify(_that);case _AuthSuccess() when success != null:
return success(_that);case _AuthError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  verify,TResult Function( AuthTokens tokens)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial();case _AuthLoading() when loading != null:
return loading();case _AuthVerify() when verify != null:
return verify();case _AuthSuccess() when success != null:
return success(_that.tokens);case _AuthError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  verify,required TResult Function( AuthTokens tokens)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _AuthInitial():
return initial();case _AuthLoading():
return loading();case _AuthVerify():
return verify();case _AuthSuccess():
return success(_that.tokens);case _AuthError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  verify,TResult? Function( AuthTokens tokens)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial();case _AuthLoading() when loading != null:
return loading();case _AuthVerify() when verify != null:
return verify();case _AuthSuccess() when success != null:
return success(_that.tokens);case _AuthError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AuthInitial implements AuthState {
  const _AuthInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _AuthLoading implements AuthState {
  const _AuthLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class _AuthVerify implements AuthState {
  const _AuthVerify();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthVerify);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.verify()';
}


}




/// @nodoc


class _AuthSuccess implements AuthState {
  const _AuthSuccess({required this.tokens});
  

 final  AuthTokens tokens;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSuccessCopyWith<_AuthSuccess> get copyWith => __$AuthSuccessCopyWithImpl<_AuthSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSuccess&&(identical(other.tokens, tokens) || other.tokens == tokens));
}


@override
int get hashCode => Object.hash(runtimeType,tokens);

@override
String toString() {
  return 'AuthState.success(tokens: $tokens)';
}


}

/// @nodoc
abstract mixin class _$AuthSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthSuccessCopyWith(_AuthSuccess value, $Res Function(_AuthSuccess) _then) = __$AuthSuccessCopyWithImpl;
@useResult
$Res call({
 AuthTokens tokens
});




}
/// @nodoc
class __$AuthSuccessCopyWithImpl<$Res>
    implements _$AuthSuccessCopyWith<$Res> {
  __$AuthSuccessCopyWithImpl(this._self, this._then);

  final _AuthSuccess _self;
  final $Res Function(_AuthSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tokens = null,}) {
  return _then(_AuthSuccess(
tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as AuthTokens,
  ));
}


}

/// @nodoc


class _AuthError implements AuthState {
  const _AuthError({required this.error});
  

 final  String error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthErrorCopyWith<_AuthError> get copyWith => __$AuthErrorCopyWithImpl<_AuthError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AuthState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$AuthErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthErrorCopyWith(_AuthError value, $Res Function(_AuthError) _then) = __$AuthErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$AuthErrorCopyWithImpl<$Res>
    implements _$AuthErrorCopyWith<$Res> {
  __$AuthErrorCopyWithImpl(this._self, this._then);

  final _AuthError _self;
  final $Res Function(_AuthError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_AuthError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
