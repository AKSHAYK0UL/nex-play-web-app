// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_rated_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopRatedMoviesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedMoviesState()';
}


}

/// @nodoc
class $TopRatedMoviesStateCopyWith<$Res>  {
$TopRatedMoviesStateCopyWith(TopRatedMoviesState _, $Res Function(TopRatedMoviesState) __);
}


/// Adds pattern-matching-related methods to [TopRatedMoviesState].
extension TopRatedMoviesStatePatterns on TopRatedMoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _TopRatedMoviesStateLoading value)?  loading,TResult Function( _TopRatedMoviesStateError value)?  error,TResult Function( _TopRatedMoviesStateSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _TopRatedMoviesStateLoading() when loading != null:
return loading(_that);case _TopRatedMoviesStateError() when error != null:
return error(_that);case _TopRatedMoviesStateSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _TopRatedMoviesStateLoading value)  loading,required TResult Function( _TopRatedMoviesStateError value)  error,required TResult Function( _TopRatedMoviesStateSuccess value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _TopRatedMoviesStateLoading():
return loading(_that);case _TopRatedMoviesStateError():
return error(_that);case _TopRatedMoviesStateSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _TopRatedMoviesStateLoading value)?  loading,TResult? Function( _TopRatedMoviesStateError value)?  error,TResult? Function( _TopRatedMoviesStateSuccess value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _TopRatedMoviesStateLoading() when loading != null:
return loading(_that);case _TopRatedMoviesStateError() when error != null:
return error(_that);case _TopRatedMoviesStateSuccess() when success != null:
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
return initial();case _TopRatedMoviesStateLoading() when loading != null:
return loading();case _TopRatedMoviesStateError() when error != null:
return error(_that.error);case _TopRatedMoviesStateSuccess() when success != null:
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
return initial();case _TopRatedMoviesStateLoading():
return loading();case _TopRatedMoviesStateError():
return error(_that.error);case _TopRatedMoviesStateSuccess():
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
return initial();case _TopRatedMoviesStateLoading() when loading != null:
return loading();case _TopRatedMoviesStateError() when error != null:
return error(_that.error);case _TopRatedMoviesStateSuccess() when success != null:
return success(_that.movies);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TopRatedMoviesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedMoviesState.initial()';
}


}




/// @nodoc


class _TopRatedMoviesStateLoading implements TopRatedMoviesState {
  const _TopRatedMoviesStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopRatedMoviesStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedMoviesState.loading()';
}


}




/// @nodoc


class _TopRatedMoviesStateError implements TopRatedMoviesState {
  const _TopRatedMoviesStateError({required this.error});
  

 final  String error;

/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopRatedMoviesStateErrorCopyWith<_TopRatedMoviesStateError> get copyWith => __$TopRatedMoviesStateErrorCopyWithImpl<_TopRatedMoviesStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopRatedMoviesStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'TopRatedMoviesState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$TopRatedMoviesStateErrorCopyWith<$Res> implements $TopRatedMoviesStateCopyWith<$Res> {
  factory _$TopRatedMoviesStateErrorCopyWith(_TopRatedMoviesStateError value, $Res Function(_TopRatedMoviesStateError) _then) = __$TopRatedMoviesStateErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$TopRatedMoviesStateErrorCopyWithImpl<$Res>
    implements _$TopRatedMoviesStateErrorCopyWith<$Res> {
  __$TopRatedMoviesStateErrorCopyWithImpl(this._self, this._then);

  final _TopRatedMoviesStateError _self;
  final $Res Function(_TopRatedMoviesStateError) _then;

/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_TopRatedMoviesStateError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TopRatedMoviesStateSuccess implements TopRatedMoviesState {
  const _TopRatedMoviesStateSuccess({required this.movies});
  

 final  PagedResullt<Movie> movies;

/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopRatedMoviesStateSuccessCopyWith<_TopRatedMoviesStateSuccess> get copyWith => __$TopRatedMoviesStateSuccessCopyWithImpl<_TopRatedMoviesStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopRatedMoviesStateSuccess&&(identical(other.movies, movies) || other.movies == movies));
}


@override
int get hashCode => Object.hash(runtimeType,movies);

@override
String toString() {
  return 'TopRatedMoviesState.success(movies: $movies)';
}


}

/// @nodoc
abstract mixin class _$TopRatedMoviesStateSuccessCopyWith<$Res> implements $TopRatedMoviesStateCopyWith<$Res> {
  factory _$TopRatedMoviesStateSuccessCopyWith(_TopRatedMoviesStateSuccess value, $Res Function(_TopRatedMoviesStateSuccess) _then) = __$TopRatedMoviesStateSuccessCopyWithImpl;
@useResult
$Res call({
 PagedResullt<Movie> movies
});




}
/// @nodoc
class __$TopRatedMoviesStateSuccessCopyWithImpl<$Res>
    implements _$TopRatedMoviesStateSuccessCopyWith<$Res> {
  __$TopRatedMoviesStateSuccessCopyWithImpl(this._self, this._then);

  final _TopRatedMoviesStateSuccess _self;
  final $Res Function(_TopRatedMoviesStateSuccess) _then;

/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(_TopRatedMoviesStateSuccess(
movies: null == movies ? _self.movies : movies // ignore: cast_nullable_to_non_nullable
as PagedResullt<Movie>,
  ));
}


}

// dart format on
