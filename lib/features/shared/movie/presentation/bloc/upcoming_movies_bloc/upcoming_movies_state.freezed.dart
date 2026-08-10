// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upcoming_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpcomingMoviesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpcomingMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpcomingMoviesState()';
}


}

/// @nodoc
class $UpcomingMoviesStateCopyWith<$Res>  {
$UpcomingMoviesStateCopyWith(UpcomingMoviesState _, $Res Function(UpcomingMoviesState) __);
}


/// Adds pattern-matching-related methods to [UpcomingMoviesState].
extension UpcomingMoviesStatePatterns on UpcomingMoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _UpcomingMoviesLoading value)?  loading,TResult Function( _UpcomingMoviesError value)?  error,TResult Function( _UpcomingMoviesSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _UpcomingMoviesLoading() when loading != null:
return loading(_that);case _UpcomingMoviesError() when error != null:
return error(_that);case _UpcomingMoviesSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _UpcomingMoviesLoading value)  loading,required TResult Function( _UpcomingMoviesError value)  error,required TResult Function( _UpcomingMoviesSuccess value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _UpcomingMoviesLoading():
return loading(_that);case _UpcomingMoviesError():
return error(_that);case _UpcomingMoviesSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _UpcomingMoviesLoading value)?  loading,TResult? Function( _UpcomingMoviesError value)?  error,TResult? Function( _UpcomingMoviesSuccess value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _UpcomingMoviesLoading() when loading != null:
return loading(_that);case _UpcomingMoviesError() when error != null:
return error(_that);case _UpcomingMoviesSuccess() when success != null:
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
return initial();case _UpcomingMoviesLoading() when loading != null:
return loading();case _UpcomingMoviesError() when error != null:
return error(_that.error);case _UpcomingMoviesSuccess() when success != null:
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
return initial();case _UpcomingMoviesLoading():
return loading();case _UpcomingMoviesError():
return error(_that.error);case _UpcomingMoviesSuccess():
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
return initial();case _UpcomingMoviesLoading() when loading != null:
return loading();case _UpcomingMoviesError() when error != null:
return error(_that.error);case _UpcomingMoviesSuccess() when success != null:
return success(_that.movies);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UpcomingMoviesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpcomingMoviesState.initial()';
}


}




/// @nodoc


class _UpcomingMoviesLoading implements UpcomingMoviesState {
  const _UpcomingMoviesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpcomingMoviesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpcomingMoviesState.loading()';
}


}




/// @nodoc


class _UpcomingMoviesError implements UpcomingMoviesState {
  const _UpcomingMoviesError({required this.error});
  

 final  String error;

/// Create a copy of UpcomingMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpcomingMoviesErrorCopyWith<_UpcomingMoviesError> get copyWith => __$UpcomingMoviesErrorCopyWithImpl<_UpcomingMoviesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpcomingMoviesError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'UpcomingMoviesState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$UpcomingMoviesErrorCopyWith<$Res> implements $UpcomingMoviesStateCopyWith<$Res> {
  factory _$UpcomingMoviesErrorCopyWith(_UpcomingMoviesError value, $Res Function(_UpcomingMoviesError) _then) = __$UpcomingMoviesErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$UpcomingMoviesErrorCopyWithImpl<$Res>
    implements _$UpcomingMoviesErrorCopyWith<$Res> {
  __$UpcomingMoviesErrorCopyWithImpl(this._self, this._then);

  final _UpcomingMoviesError _self;
  final $Res Function(_UpcomingMoviesError) _then;

/// Create a copy of UpcomingMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_UpcomingMoviesError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpcomingMoviesSuccess implements UpcomingMoviesState {
  const _UpcomingMoviesSuccess({required this.movies});
  

 final  PagedResullt<Movie> movies;

/// Create a copy of UpcomingMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpcomingMoviesSuccessCopyWith<_UpcomingMoviesSuccess> get copyWith => __$UpcomingMoviesSuccessCopyWithImpl<_UpcomingMoviesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpcomingMoviesSuccess&&(identical(other.movies, movies) || other.movies == movies));
}


@override
int get hashCode => Object.hash(runtimeType,movies);

@override
String toString() {
  return 'UpcomingMoviesState.success(movies: $movies)';
}


}

/// @nodoc
abstract mixin class _$UpcomingMoviesSuccessCopyWith<$Res> implements $UpcomingMoviesStateCopyWith<$Res> {
  factory _$UpcomingMoviesSuccessCopyWith(_UpcomingMoviesSuccess value, $Res Function(_UpcomingMoviesSuccess) _then) = __$UpcomingMoviesSuccessCopyWithImpl;
@useResult
$Res call({
 PagedResullt<Movie> movies
});




}
/// @nodoc
class __$UpcomingMoviesSuccessCopyWithImpl<$Res>
    implements _$UpcomingMoviesSuccessCopyWith<$Res> {
  __$UpcomingMoviesSuccessCopyWithImpl(this._self, this._then);

  final _UpcomingMoviesSuccess _self;
  final $Res Function(_UpcomingMoviesSuccess) _then;

/// Create a copy of UpcomingMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(_UpcomingMoviesSuccess(
movies: null == movies ? _self.movies : movies // ignore: cast_nullable_to_non_nullable
as PagedResullt<Movie>,
  ));
}


}

// dart format on
