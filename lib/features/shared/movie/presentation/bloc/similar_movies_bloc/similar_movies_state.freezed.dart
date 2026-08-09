// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'similar_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SimilarMoviesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimilarMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SimilarMoviesState()';
}


}

/// @nodoc
class $SimilarMoviesStateCopyWith<$Res>  {
$SimilarMoviesStateCopyWith(SimilarMoviesState _, $Res Function(SimilarMoviesState) __);
}


/// Adds pattern-matching-related methods to [SimilarMoviesState].
extension SimilarMoviesStatePatterns on SimilarMoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _SimilarMoviesLoading value)?  loading,TResult Function( _SimilarMoviesError value)?  error,TResult Function( _SimilarMoviesStateSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SimilarMoviesLoading() when loading != null:
return loading(_that);case _SimilarMoviesError() when error != null:
return error(_that);case _SimilarMoviesStateSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _SimilarMoviesLoading value)  loading,required TResult Function( _SimilarMoviesError value)  error,required TResult Function( _SimilarMoviesStateSuccess value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _SimilarMoviesLoading():
return loading(_that);case _SimilarMoviesError():
return error(_that);case _SimilarMoviesStateSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _SimilarMoviesLoading value)?  loading,TResult? Function( _SimilarMoviesError value)?  error,TResult? Function( _SimilarMoviesStateSuccess value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SimilarMoviesLoading() when loading != null:
return loading(_that);case _SimilarMoviesError() when error != null:
return error(_that);case _SimilarMoviesStateSuccess() when success != null:
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
return initial();case _SimilarMoviesLoading() when loading != null:
return loading();case _SimilarMoviesError() when error != null:
return error(_that.error);case _SimilarMoviesStateSuccess() when success != null:
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
return initial();case _SimilarMoviesLoading():
return loading();case _SimilarMoviesError():
return error(_that.error);case _SimilarMoviesStateSuccess():
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
return initial();case _SimilarMoviesLoading() when loading != null:
return loading();case _SimilarMoviesError() when error != null:
return error(_that.error);case _SimilarMoviesStateSuccess() when success != null:
return success(_that.movies);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SimilarMoviesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SimilarMoviesState.initial()';
}


}




/// @nodoc


class _SimilarMoviesLoading implements SimilarMoviesState {
  const _SimilarMoviesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimilarMoviesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SimilarMoviesState.loading()';
}


}




/// @nodoc


class _SimilarMoviesError implements SimilarMoviesState {
  const _SimilarMoviesError({required this.error});
  

 final  String error;

/// Create a copy of SimilarMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimilarMoviesErrorCopyWith<_SimilarMoviesError> get copyWith => __$SimilarMoviesErrorCopyWithImpl<_SimilarMoviesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimilarMoviesError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SimilarMoviesState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$SimilarMoviesErrorCopyWith<$Res> implements $SimilarMoviesStateCopyWith<$Res> {
  factory _$SimilarMoviesErrorCopyWith(_SimilarMoviesError value, $Res Function(_SimilarMoviesError) _then) = __$SimilarMoviesErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$SimilarMoviesErrorCopyWithImpl<$Res>
    implements _$SimilarMoviesErrorCopyWith<$Res> {
  __$SimilarMoviesErrorCopyWithImpl(this._self, this._then);

  final _SimilarMoviesError _self;
  final $Res Function(_SimilarMoviesError) _then;

/// Create a copy of SimilarMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_SimilarMoviesError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SimilarMoviesStateSuccess implements SimilarMoviesState {
  const _SimilarMoviesStateSuccess({required this.movies});
  

 final  PagedResullt<Movie> movies;

/// Create a copy of SimilarMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimilarMoviesStateSuccessCopyWith<_SimilarMoviesStateSuccess> get copyWith => __$SimilarMoviesStateSuccessCopyWithImpl<_SimilarMoviesStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimilarMoviesStateSuccess&&(identical(other.movies, movies) || other.movies == movies));
}


@override
int get hashCode => Object.hash(runtimeType,movies);

@override
String toString() {
  return 'SimilarMoviesState.success(movies: $movies)';
}


}

/// @nodoc
abstract mixin class _$SimilarMoviesStateSuccessCopyWith<$Res> implements $SimilarMoviesStateCopyWith<$Res> {
  factory _$SimilarMoviesStateSuccessCopyWith(_SimilarMoviesStateSuccess value, $Res Function(_SimilarMoviesStateSuccess) _then) = __$SimilarMoviesStateSuccessCopyWithImpl;
@useResult
$Res call({
 PagedResullt<Movie> movies
});




}
/// @nodoc
class __$SimilarMoviesStateSuccessCopyWithImpl<$Res>
    implements _$SimilarMoviesStateSuccessCopyWith<$Res> {
  __$SimilarMoviesStateSuccessCopyWithImpl(this._self, this._then);

  final _SimilarMoviesStateSuccess _self;
  final $Res Function(_SimilarMoviesStateSuccess) _then;

/// Create a copy of SimilarMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(_SimilarMoviesStateSuccess(
movies: null == movies ? _self.movies : movies // ignore: cast_nullable_to_non_nullable
as PagedResullt<Movie>,
  ));
}


}

// dart format on
