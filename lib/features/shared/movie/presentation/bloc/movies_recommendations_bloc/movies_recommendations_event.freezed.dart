// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_recommendations_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieRecommendationsEvent {

 int get id; String get lang; int get page;
/// Create a copy of MovieRecommendationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieRecommendationsEventCopyWith<MovieRecommendationsEvent> get copyWith => _$MovieRecommendationsEventCopyWithImpl<MovieRecommendationsEvent>(this as MovieRecommendationsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieRecommendationsEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,id,lang,page);

@override
String toString() {
  return 'MovieRecommendationsEvent(id: $id, lang: $lang, page: $page)';
}


}

/// @nodoc
abstract mixin class $MovieRecommendationsEventCopyWith<$Res>  {
  factory $MovieRecommendationsEventCopyWith(MovieRecommendationsEvent value, $Res Function(MovieRecommendationsEvent) _then) = _$MovieRecommendationsEventCopyWithImpl;
@useResult
$Res call({
 int id, String lang, int page
});




}
/// @nodoc
class _$MovieRecommendationsEventCopyWithImpl<$Res>
    implements $MovieRecommendationsEventCopyWith<$Res> {
  _$MovieRecommendationsEventCopyWithImpl(this._self, this._then);

  final MovieRecommendationsEvent _self;
  final $Res Function(MovieRecommendationsEvent) _then;

/// Create a copy of MovieRecommendationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lang = null,Object? page = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieRecommendationsEvent].
extension MovieRecommendationsEventPatterns on MovieRecommendationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetMoviesRecommendations value)?  getMoviesRecommendations,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetMoviesRecommendations() when getMoviesRecommendations != null:
return getMoviesRecommendations(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetMoviesRecommendations value)  getMoviesRecommendations,}){
final _that = this;
switch (_that) {
case _GetMoviesRecommendations():
return getMoviesRecommendations(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetMoviesRecommendations value)?  getMoviesRecommendations,}){
final _that = this;
switch (_that) {
case _GetMoviesRecommendations() when getMoviesRecommendations != null:
return getMoviesRecommendations(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  String lang,  int page)?  getMoviesRecommendations,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetMoviesRecommendations() when getMoviesRecommendations != null:
return getMoviesRecommendations(_that.id,_that.lang,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  String lang,  int page)  getMoviesRecommendations,}) {final _that = this;
switch (_that) {
case _GetMoviesRecommendations():
return getMoviesRecommendations(_that.id,_that.lang,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  String lang,  int page)?  getMoviesRecommendations,}) {final _that = this;
switch (_that) {
case _GetMoviesRecommendations() when getMoviesRecommendations != null:
return getMoviesRecommendations(_that.id,_that.lang,_that.page);case _:
  return null;

}
}

}

/// @nodoc


class _GetMoviesRecommendations implements MovieRecommendationsEvent {
  const _GetMoviesRecommendations({required this.id, required this.lang, required this.page});
  

@override final  int id;
@override final  String lang;
@override final  int page;

/// Create a copy of MovieRecommendationsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetMoviesRecommendationsCopyWith<_GetMoviesRecommendations> get copyWith => __$GetMoviesRecommendationsCopyWithImpl<_GetMoviesRecommendations>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetMoviesRecommendations&&(identical(other.id, id) || other.id == id)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,id,lang,page);

@override
String toString() {
  return 'MovieRecommendationsEvent.getMoviesRecommendations(id: $id, lang: $lang, page: $page)';
}


}

/// @nodoc
abstract mixin class _$GetMoviesRecommendationsCopyWith<$Res> implements $MovieRecommendationsEventCopyWith<$Res> {
  factory _$GetMoviesRecommendationsCopyWith(_GetMoviesRecommendations value, $Res Function(_GetMoviesRecommendations) _then) = __$GetMoviesRecommendationsCopyWithImpl;
@override @useResult
$Res call({
 int id, String lang, int page
});




}
/// @nodoc
class __$GetMoviesRecommendationsCopyWithImpl<$Res>
    implements _$GetMoviesRecommendationsCopyWith<$Res> {
  __$GetMoviesRecommendationsCopyWithImpl(this._self, this._then);

  final _GetMoviesRecommendations _self;
  final $Res Function(_GetMoviesRecommendations) _then;

/// Create a copy of MovieRecommendationsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? lang = null,Object? page = null,}) {
  return _then(_GetMoviesRecommendations(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
