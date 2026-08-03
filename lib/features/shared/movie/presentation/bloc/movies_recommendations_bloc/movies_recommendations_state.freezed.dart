// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_recommendations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieRecommendationsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieRecommendationsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieRecommendationsState()';
}


}

/// @nodoc
class $MovieRecommendationsStateCopyWith<$Res>  {
$MovieRecommendationsStateCopyWith(MovieRecommendationsState _, $Res Function(MovieRecommendationsState) __);
}


/// Adds pattern-matching-related methods to [MovieRecommendationsState].
extension MovieRecommendationsStatePatterns on MovieRecommendationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _MovieRecommendationsLoading value)?  loading,TResult Function( _MovieRecommendationsError value)?  error,TResult Function( _MovieRecommendationsStateSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _MovieRecommendationsLoading() when loading != null:
return loading(_that);case _MovieRecommendationsError() when error != null:
return error(_that);case _MovieRecommendationsStateSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _MovieRecommendationsLoading value)  loading,required TResult Function( _MovieRecommendationsError value)  error,required TResult Function( _MovieRecommendationsStateSuccess value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _MovieRecommendationsLoading():
return loading(_that);case _MovieRecommendationsError():
return error(_that);case _MovieRecommendationsStateSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _MovieRecommendationsLoading value)?  loading,TResult? Function( _MovieRecommendationsError value)?  error,TResult? Function( _MovieRecommendationsStateSuccess value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _MovieRecommendationsLoading() when loading != null:
return loading(_that);case _MovieRecommendationsError() when error != null:
return error(_that);case _MovieRecommendationsStateSuccess() when success != null:
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
return initial();case _MovieRecommendationsLoading() when loading != null:
return loading();case _MovieRecommendationsError() when error != null:
return error(_that.error);case _MovieRecommendationsStateSuccess() when success != null:
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
return initial();case _MovieRecommendationsLoading():
return loading();case _MovieRecommendationsError():
return error(_that.error);case _MovieRecommendationsStateSuccess():
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
return initial();case _MovieRecommendationsLoading() when loading != null:
return loading();case _MovieRecommendationsError() when error != null:
return error(_that.error);case _MovieRecommendationsStateSuccess() when success != null:
return success(_that.movies);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements MovieRecommendationsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieRecommendationsState.initial()';
}


}




/// @nodoc


class _MovieRecommendationsLoading implements MovieRecommendationsState {
  const _MovieRecommendationsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieRecommendationsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieRecommendationsState.loading()';
}


}




/// @nodoc


class _MovieRecommendationsError implements MovieRecommendationsState {
  const _MovieRecommendationsError({required this.error});
  

 final  String error;

/// Create a copy of MovieRecommendationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieRecommendationsErrorCopyWith<_MovieRecommendationsError> get copyWith => __$MovieRecommendationsErrorCopyWithImpl<_MovieRecommendationsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieRecommendationsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'MovieRecommendationsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$MovieRecommendationsErrorCopyWith<$Res> implements $MovieRecommendationsStateCopyWith<$Res> {
  factory _$MovieRecommendationsErrorCopyWith(_MovieRecommendationsError value, $Res Function(_MovieRecommendationsError) _then) = __$MovieRecommendationsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$MovieRecommendationsErrorCopyWithImpl<$Res>
    implements _$MovieRecommendationsErrorCopyWith<$Res> {
  __$MovieRecommendationsErrorCopyWithImpl(this._self, this._then);

  final _MovieRecommendationsError _self;
  final $Res Function(_MovieRecommendationsError) _then;

/// Create a copy of MovieRecommendationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_MovieRecommendationsError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _MovieRecommendationsStateSuccess implements MovieRecommendationsState {
  const _MovieRecommendationsStateSuccess({required this.movies});
  

 final  PagedResullt<Movie> movies;

/// Create a copy of MovieRecommendationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieRecommendationsStateSuccessCopyWith<_MovieRecommendationsStateSuccess> get copyWith => __$MovieRecommendationsStateSuccessCopyWithImpl<_MovieRecommendationsStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieRecommendationsStateSuccess&&(identical(other.movies, movies) || other.movies == movies));
}


@override
int get hashCode => Object.hash(runtimeType,movies);

@override
String toString() {
  return 'MovieRecommendationsState.success(movies: $movies)';
}


}

/// @nodoc
abstract mixin class _$MovieRecommendationsStateSuccessCopyWith<$Res> implements $MovieRecommendationsStateCopyWith<$Res> {
  factory _$MovieRecommendationsStateSuccessCopyWith(_MovieRecommendationsStateSuccess value, $Res Function(_MovieRecommendationsStateSuccess) _then) = __$MovieRecommendationsStateSuccessCopyWithImpl;
@useResult
$Res call({
 PagedResullt<Movie> movies
});




}
/// @nodoc
class __$MovieRecommendationsStateSuccessCopyWithImpl<$Res>
    implements _$MovieRecommendationsStateSuccessCopyWith<$Res> {
  __$MovieRecommendationsStateSuccessCopyWithImpl(this._self, this._then);

  final _MovieRecommendationsStateSuccess _self;
  final $Res Function(_MovieRecommendationsStateSuccess) _then;

/// Create a copy of MovieRecommendationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(_MovieRecommendationsStateSuccess(
movies: null == movies ? _self.movies : movies // ignore: cast_nullable_to_non_nullable
as PagedResullt<Movie>,
  ));
}


}

// dart format on
