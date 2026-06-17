// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detailed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetailedState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieDetailedState()';
}


}

/// @nodoc
class $MovieDetailedStateCopyWith<$Res>  {
$MovieDetailedStateCopyWith(MovieDetailedState _, $Res Function(MovieDetailedState) __);
}


/// Adds pattern-matching-related methods to [MovieDetailedState].
extension MovieDetailedStatePatterns on MovieDetailedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MovieDetailedInitial value)?  initial,TResult Function( _MovieDetailedLoading value)?  loading,TResult Function( MovieDetailedError value)?  error,TResult Function( MovieDetailedSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetailedInitial() when initial != null:
return initial(_that);case _MovieDetailedLoading() when loading != null:
return loading(_that);case MovieDetailedError() when error != null:
return error(_that);case MovieDetailedSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MovieDetailedInitial value)  initial,required TResult Function( _MovieDetailedLoading value)  loading,required TResult Function( MovieDetailedError value)  error,required TResult Function( MovieDetailedSuccess value)  success,}){
final _that = this;
switch (_that) {
case _MovieDetailedInitial():
return initial(_that);case _MovieDetailedLoading():
return loading(_that);case MovieDetailedError():
return error(_that);case MovieDetailedSuccess():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MovieDetailedInitial value)?  initial,TResult? Function( _MovieDetailedLoading value)?  loading,TResult? Function( MovieDetailedError value)?  error,TResult? Function( MovieDetailedSuccess value)?  success,}){
final _that = this;
switch (_that) {
case _MovieDetailedInitial() when initial != null:
return initial(_that);case _MovieDetailedLoading() when loading != null:
return loading(_that);case MovieDetailedError() when error != null:
return error(_that);case MovieDetailedSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String error)?  error,TResult Function( Movie movie)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetailedInitial() when initial != null:
return initial();case _MovieDetailedLoading() when loading != null:
return loading();case MovieDetailedError() when error != null:
return error(_that.error);case MovieDetailedSuccess() when success != null:
return success(_that.movie);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String error)  error,required TResult Function( Movie movie)  success,}) {final _that = this;
switch (_that) {
case _MovieDetailedInitial():
return initial();case _MovieDetailedLoading():
return loading();case MovieDetailedError():
return error(_that.error);case MovieDetailedSuccess():
return success(_that.movie);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String error)?  error,TResult? Function( Movie movie)?  success,}) {final _that = this;
switch (_that) {
case _MovieDetailedInitial() when initial != null:
return initial();case _MovieDetailedLoading() when loading != null:
return loading();case MovieDetailedError() when error != null:
return error(_that.error);case MovieDetailedSuccess() when success != null:
return success(_that.movie);case _:
  return null;

}
}

}

/// @nodoc


class _MovieDetailedInitial implements MovieDetailedState {
  const _MovieDetailedInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailedInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieDetailedState.initial()';
}


}




/// @nodoc


class _MovieDetailedLoading implements MovieDetailedState {
  const _MovieDetailedLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailedLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieDetailedState.loading()';
}


}




/// @nodoc


class MovieDetailedError implements MovieDetailedState {
  const MovieDetailedError({required this.error});
  

 final  String error;

/// Create a copy of MovieDetailedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailedErrorCopyWith<MovieDetailedError> get copyWith => _$MovieDetailedErrorCopyWithImpl<MovieDetailedError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailedError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'MovieDetailedState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $MovieDetailedErrorCopyWith<$Res> implements $MovieDetailedStateCopyWith<$Res> {
  factory $MovieDetailedErrorCopyWith(MovieDetailedError value, $Res Function(MovieDetailedError) _then) = _$MovieDetailedErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$MovieDetailedErrorCopyWithImpl<$Res>
    implements $MovieDetailedErrorCopyWith<$Res> {
  _$MovieDetailedErrorCopyWithImpl(this._self, this._then);

  final MovieDetailedError _self;
  final $Res Function(MovieDetailedError) _then;

/// Create a copy of MovieDetailedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(MovieDetailedError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MovieDetailedSuccess implements MovieDetailedState {
  const MovieDetailedSuccess({required this.movie});
  

 final  Movie movie;

/// Create a copy of MovieDetailedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailedSuccessCopyWith<MovieDetailedSuccess> get copyWith => _$MovieDetailedSuccessCopyWithImpl<MovieDetailedSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailedSuccess&&(identical(other.movie, movie) || other.movie == movie));
}


@override
int get hashCode => Object.hash(runtimeType,movie);

@override
String toString() {
  return 'MovieDetailedState.success(movie: $movie)';
}


}

/// @nodoc
abstract mixin class $MovieDetailedSuccessCopyWith<$Res> implements $MovieDetailedStateCopyWith<$Res> {
  factory $MovieDetailedSuccessCopyWith(MovieDetailedSuccess value, $Res Function(MovieDetailedSuccess) _then) = _$MovieDetailedSuccessCopyWithImpl;
@useResult
$Res call({
 Movie movie
});




}
/// @nodoc
class _$MovieDetailedSuccessCopyWithImpl<$Res>
    implements $MovieDetailedSuccessCopyWith<$Res> {
  _$MovieDetailedSuccessCopyWithImpl(this._self, this._then);

  final MovieDetailedSuccess _self;
  final $Res Function(MovieDetailedSuccess) _then;

/// Create a copy of MovieDetailedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movie = null,}) {
  return _then(MovieDetailedSuccess(
movie: null == movie ? _self.movie : movie // ignore: cast_nullable_to_non_nullable
as Movie,
  ));
}


}

// dart format on
