// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_rated_movies_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopRatedMoviesEvent {

 String get lang; int get page;
/// Create a copy of TopRatedMoviesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopRatedMoviesEventCopyWith<TopRatedMoviesEvent> get copyWith => _$TopRatedMoviesEventCopyWithImpl<TopRatedMoviesEvent>(this as TopRatedMoviesEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMoviesEvent&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,lang,page);

@override
String toString() {
  return 'TopRatedMoviesEvent(lang: $lang, page: $page)';
}


}

/// @nodoc
abstract mixin class $TopRatedMoviesEventCopyWith<$Res>  {
  factory $TopRatedMoviesEventCopyWith(TopRatedMoviesEvent value, $Res Function(TopRatedMoviesEvent) _then) = _$TopRatedMoviesEventCopyWithImpl;
@useResult
$Res call({
 String lang, int page
});




}
/// @nodoc
class _$TopRatedMoviesEventCopyWithImpl<$Res>
    implements $TopRatedMoviesEventCopyWith<$Res> {
  _$TopRatedMoviesEventCopyWithImpl(this._self, this._then);

  final TopRatedMoviesEvent _self;
  final $Res Function(TopRatedMoviesEvent) _then;

/// Create a copy of TopRatedMoviesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lang = null,Object? page = null,}) {
  return _then(_self.copyWith(
lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TopRatedMoviesEvent].
extension TopRatedMoviesEventPatterns on TopRatedMoviesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetTopRatedMovies value)?  getTopRatedMovies,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetTopRatedMovies() when getTopRatedMovies != null:
return getTopRatedMovies(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetTopRatedMovies value)  getTopRatedMovies,}){
final _that = this;
switch (_that) {
case _GetTopRatedMovies():
return getTopRatedMovies(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetTopRatedMovies value)?  getTopRatedMovies,}){
final _that = this;
switch (_that) {
case _GetTopRatedMovies() when getTopRatedMovies != null:
return getTopRatedMovies(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String lang,  int page)?  getTopRatedMovies,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetTopRatedMovies() when getTopRatedMovies != null:
return getTopRatedMovies(_that.lang,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String lang,  int page)  getTopRatedMovies,}) {final _that = this;
switch (_that) {
case _GetTopRatedMovies():
return getTopRatedMovies(_that.lang,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String lang,  int page)?  getTopRatedMovies,}) {final _that = this;
switch (_that) {
case _GetTopRatedMovies() when getTopRatedMovies != null:
return getTopRatedMovies(_that.lang,_that.page);case _:
  return null;

}
}

}

/// @nodoc


class _GetTopRatedMovies implements TopRatedMoviesEvent {
  const _GetTopRatedMovies({required this.lang, required this.page});
  

@override final  String lang;
@override final  int page;

/// Create a copy of TopRatedMoviesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTopRatedMoviesCopyWith<_GetTopRatedMovies> get copyWith => __$GetTopRatedMoviesCopyWithImpl<_GetTopRatedMovies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTopRatedMovies&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,lang,page);

@override
String toString() {
  return 'TopRatedMoviesEvent.getTopRatedMovies(lang: $lang, page: $page)';
}


}

/// @nodoc
abstract mixin class _$GetTopRatedMoviesCopyWith<$Res> implements $TopRatedMoviesEventCopyWith<$Res> {
  factory _$GetTopRatedMoviesCopyWith(_GetTopRatedMovies value, $Res Function(_GetTopRatedMovies) _then) = __$GetTopRatedMoviesCopyWithImpl;
@override @useResult
$Res call({
 String lang, int page
});




}
/// @nodoc
class __$GetTopRatedMoviesCopyWithImpl<$Res>
    implements _$GetTopRatedMoviesCopyWith<$Res> {
  __$GetTopRatedMoviesCopyWithImpl(this._self, this._then);

  final _GetTopRatedMovies _self;
  final $Res Function(_GetTopRatedMovies) _then;

/// Create a copy of TopRatedMoviesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lang = null,Object? page = null,}) {
  return _then(_GetTopRatedMovies(
lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
