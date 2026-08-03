// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nowplaymovies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NowPlayMoviesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NowPlayMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NowPlayMoviesState()';
}


}

/// @nodoc
class $NowPlayMoviesStateCopyWith<$Res>  {
$NowPlayMoviesStateCopyWith(NowPlayMoviesState _, $Res Function(NowPlayMoviesState) __);
}


/// Adds pattern-matching-related methods to [NowPlayMoviesState].
extension NowPlayMoviesStatePatterns on NowPlayMoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _NowPlayingLoading value)?  loading,TResult Function( _NowPlayMovieError value)?  error,TResult Function( _NowPlayMoviesSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _NowPlayingLoading() when loading != null:
return loading(_that);case _NowPlayMovieError() when error != null:
return error(_that);case _NowPlayMoviesSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _NowPlayingLoading value)  loading,required TResult Function( _NowPlayMovieError value)  error,required TResult Function( _NowPlayMoviesSuccess value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _NowPlayingLoading():
return loading(_that);case _NowPlayMovieError():
return error(_that);case _NowPlayMoviesSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _NowPlayingLoading value)?  loading,TResult? Function( _NowPlayMovieError value)?  error,TResult? Function( _NowPlayMoviesSuccess value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _NowPlayingLoading() when loading != null:
return loading(_that);case _NowPlayMovieError() when error != null:
return error(_that);case _NowPlayMoviesSuccess() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String error)?  error,TResult Function( PagedResullt<Movie> movies)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _NowPlayingLoading() when loading != null:
return loading();case _NowPlayMovieError() when error != null:
return error(_that.error);case _NowPlayMoviesSuccess() when success != null:
return success(_that.movies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String error)  error,required TResult Function( PagedResullt<Movie> movies)  success,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _NowPlayingLoading():
return loading();case _NowPlayMovieError():
return error(_that.error);case _NowPlayMoviesSuccess():
return success(_that.movies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String error)?  error,TResult? Function( PagedResullt<Movie> movies)?  success,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _NowPlayingLoading() when loading != null:
return loading();case _NowPlayMovieError() when error != null:
return error(_that.error);case _NowPlayMoviesSuccess() when success != null:
return success(_that.movies);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements NowPlayMoviesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NowPlayMoviesState.initial()';
}


}




/// @nodoc


class _NowPlayingLoading implements NowPlayMoviesState {
  const _NowPlayingLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NowPlayingLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NowPlayMoviesState.loading()';
}


}




/// @nodoc


class _NowPlayMovieError implements NowPlayMoviesState {
  const _NowPlayMovieError({required this.error});
  

 final  String error;

/// Create a copy of NowPlayMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NowPlayMovieErrorCopyWith<_NowPlayMovieError> get copyWith => __$NowPlayMovieErrorCopyWithImpl<_NowPlayMovieError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NowPlayMovieError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'NowPlayMoviesState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$NowPlayMovieErrorCopyWith<$Res> implements $NowPlayMoviesStateCopyWith<$Res> {
  factory _$NowPlayMovieErrorCopyWith(_NowPlayMovieError value, $Res Function(_NowPlayMovieError) _then) = __$NowPlayMovieErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$NowPlayMovieErrorCopyWithImpl<$Res>
    implements _$NowPlayMovieErrorCopyWith<$Res> {
  __$NowPlayMovieErrorCopyWithImpl(this._self, this._then);

  final _NowPlayMovieError _self;
  final $Res Function(_NowPlayMovieError) _then;

/// Create a copy of NowPlayMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_NowPlayMovieError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NowPlayMoviesSuccess implements NowPlayMoviesState {
  const _NowPlayMoviesSuccess({required this.movies});
  

 final  PagedResullt<Movie> movies;

/// Create a copy of NowPlayMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NowPlayMoviesSuccessCopyWith<_NowPlayMoviesSuccess> get copyWith => __$NowPlayMoviesSuccessCopyWithImpl<_NowPlayMoviesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NowPlayMoviesSuccess&&(identical(other.movies, movies) || other.movies == movies));
}


@override
int get hashCode => Object.hash(runtimeType,movies);

@override
String toString() {
  return 'NowPlayMoviesState.success(movies: $movies)';
}


}

/// @nodoc
abstract mixin class _$NowPlayMoviesSuccessCopyWith<$Res> implements $NowPlayMoviesStateCopyWith<$Res> {
  factory _$NowPlayMoviesSuccessCopyWith(_NowPlayMoviesSuccess value, $Res Function(_NowPlayMoviesSuccess) _then) = __$NowPlayMoviesSuccessCopyWithImpl;
@useResult
$Res call({
 PagedResullt<Movie> movies
});




}
/// @nodoc
class __$NowPlayMoviesSuccessCopyWithImpl<$Res>
    implements _$NowPlayMoviesSuccessCopyWith<$Res> {
  __$NowPlayMoviesSuccessCopyWithImpl(this._self, this._then);

  final _NowPlayMoviesSuccess _self;
  final $Res Function(_NowPlayMoviesSuccess) _then;

/// Create a copy of NowPlayMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(_NowPlayMoviesSuccess(
movies: null == movies ? _self.movies : movies // ignore: cast_nullable_to_non_nullable
as PagedResullt<Movie>,
  ));
}


}

// dart format on
