// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrendingMoviesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendingMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrendingMoviesState()';
}


}

/// @nodoc
class $TrendingMoviesStateCopyWith<$Res>  {
$TrendingMoviesStateCopyWith(TrendingMoviesState _, $Res Function(TrendingMoviesState) __);
}


/// Adds pattern-matching-related methods to [TrendingMoviesState].
extension TrendingMoviesStatePatterns on TrendingMoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _TrendingMoviesLoading value)?  loading,TResult Function( _TrendingMoviesError value)?  error,TResult Function( _TrendingMoviesSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _TrendingMoviesLoading() when loading != null:
return loading(_that);case _TrendingMoviesError() when error != null:
return error(_that);case _TrendingMoviesSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _TrendingMoviesLoading value)  loading,required TResult Function( _TrendingMoviesError value)  error,required TResult Function( _TrendingMoviesSuccess value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _TrendingMoviesLoading():
return loading(_that);case _TrendingMoviesError():
return error(_that);case _TrendingMoviesSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _TrendingMoviesLoading value)?  loading,TResult? Function( _TrendingMoviesError value)?  error,TResult? Function( _TrendingMoviesSuccess value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _TrendingMoviesLoading() when loading != null:
return loading(_that);case _TrendingMoviesError() when error != null:
return error(_that);case _TrendingMoviesSuccess() when success != null:
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
return initial();case _TrendingMoviesLoading() when loading != null:
return loading();case _TrendingMoviesError() when error != null:
return error(_that.error);case _TrendingMoviesSuccess() when success != null:
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
return initial();case _TrendingMoviesLoading():
return loading();case _TrendingMoviesError():
return error(_that.error);case _TrendingMoviesSuccess():
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
return initial();case _TrendingMoviesLoading() when loading != null:
return loading();case _TrendingMoviesError() when error != null:
return error(_that.error);case _TrendingMoviesSuccess() when success != null:
return success(_that.movies);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TrendingMoviesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrendingMoviesState.initial()';
}


}




/// @nodoc


class _TrendingMoviesLoading implements TrendingMoviesState {
  const _TrendingMoviesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrendingMoviesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrendingMoviesState.loading()';
}


}




/// @nodoc


class _TrendingMoviesError implements TrendingMoviesState {
  const _TrendingMoviesError({required this.error});
  

 final  String error;

/// Create a copy of TrendingMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrendingMoviesErrorCopyWith<_TrendingMoviesError> get copyWith => __$TrendingMoviesErrorCopyWithImpl<_TrendingMoviesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrendingMoviesError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'TrendingMoviesState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$TrendingMoviesErrorCopyWith<$Res> implements $TrendingMoviesStateCopyWith<$Res> {
  factory _$TrendingMoviesErrorCopyWith(_TrendingMoviesError value, $Res Function(_TrendingMoviesError) _then) = __$TrendingMoviesErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$TrendingMoviesErrorCopyWithImpl<$Res>
    implements _$TrendingMoviesErrorCopyWith<$Res> {
  __$TrendingMoviesErrorCopyWithImpl(this._self, this._then);

  final _TrendingMoviesError _self;
  final $Res Function(_TrendingMoviesError) _then;

/// Create a copy of TrendingMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_TrendingMoviesError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TrendingMoviesSuccess implements TrendingMoviesState {
  const _TrendingMoviesSuccess({required this.movies});
  

 final  PagedResullt<Movie> movies;

/// Create a copy of TrendingMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrendingMoviesSuccessCopyWith<_TrendingMoviesSuccess> get copyWith => __$TrendingMoviesSuccessCopyWithImpl<_TrendingMoviesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrendingMoviesSuccess&&(identical(other.movies, movies) || other.movies == movies));
}


@override
int get hashCode => Object.hash(runtimeType,movies);

@override
String toString() {
  return 'TrendingMoviesState.success(movies: $movies)';
}


}

/// @nodoc
abstract mixin class _$TrendingMoviesSuccessCopyWith<$Res> implements $TrendingMoviesStateCopyWith<$Res> {
  factory _$TrendingMoviesSuccessCopyWith(_TrendingMoviesSuccess value, $Res Function(_TrendingMoviesSuccess) _then) = __$TrendingMoviesSuccessCopyWithImpl;
@useResult
$Res call({
 PagedResullt<Movie> movies
});




}
/// @nodoc
class __$TrendingMoviesSuccessCopyWithImpl<$Res>
    implements _$TrendingMoviesSuccessCopyWith<$Res> {
  __$TrendingMoviesSuccessCopyWithImpl(this._self, this._then);

  final _TrendingMoviesSuccess _self;
  final $Res Function(_TrendingMoviesSuccess) _then;

/// Create a copy of TrendingMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(_TrendingMoviesSuccess(
movies: null == movies ? _self.movies : movies // ignore: cast_nullable_to_non_nullable
as PagedResullt<Movie>,
  ));
}


}

// dart format on
