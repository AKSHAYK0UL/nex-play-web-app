// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detailed_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetailedEvent {

 int get id; String get lang;
/// Create a copy of MovieDetailedEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailedEventCopyWith<MovieDetailedEvent> get copyWith => _$MovieDetailedEventCopyWithImpl<MovieDetailedEvent>(this as MovieDetailedEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailedEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.lang, lang) || other.lang == lang));
}


@override
int get hashCode => Object.hash(runtimeType,id,lang);

@override
String toString() {
  return 'MovieDetailedEvent(id: $id, lang: $lang)';
}


}

/// @nodoc
abstract mixin class $MovieDetailedEventCopyWith<$Res>  {
  factory $MovieDetailedEventCopyWith(MovieDetailedEvent value, $Res Function(MovieDetailedEvent) _then) = _$MovieDetailedEventCopyWithImpl;
@useResult
$Res call({
 int id, String lang
});




}
/// @nodoc
class _$MovieDetailedEventCopyWithImpl<$Res>
    implements $MovieDetailedEventCopyWith<$Res> {
  _$MovieDetailedEventCopyWithImpl(this._self, this._then);

  final MovieDetailedEvent _self;
  final $Res Function(MovieDetailedEvent) _then;

/// Create a copy of MovieDetailedEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lang = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetailedEvent].
extension MovieDetailedEventPatterns on MovieDetailedEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MovieDetailedGetMovieDetails value)?  getMovieDetails,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetailedGetMovieDetails() when getMovieDetails != null:
return getMovieDetails(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MovieDetailedGetMovieDetails value)  getMovieDetails,}){
final _that = this;
switch (_that) {
case _MovieDetailedGetMovieDetails():
return getMovieDetails(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MovieDetailedGetMovieDetails value)?  getMovieDetails,}){
final _that = this;
switch (_that) {
case _MovieDetailedGetMovieDetails() when getMovieDetails != null:
return getMovieDetails(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  String lang)?  getMovieDetails,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetailedGetMovieDetails() when getMovieDetails != null:
return getMovieDetails(_that.id,_that.lang);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  String lang)  getMovieDetails,}) {final _that = this;
switch (_that) {
case _MovieDetailedGetMovieDetails():
return getMovieDetails(_that.id,_that.lang);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  String lang)?  getMovieDetails,}) {final _that = this;
switch (_that) {
case _MovieDetailedGetMovieDetails() when getMovieDetails != null:
return getMovieDetails(_that.id,_that.lang);case _:
  return null;

}
}

}

/// @nodoc


class _MovieDetailedGetMovieDetails implements MovieDetailedEvent {
  const _MovieDetailedGetMovieDetails({required this.id, required this.lang});
  

@override final  int id;
@override final  String lang;

/// Create a copy of MovieDetailedEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailedGetMovieDetailsCopyWith<_MovieDetailedGetMovieDetails> get copyWith => __$MovieDetailedGetMovieDetailsCopyWithImpl<_MovieDetailedGetMovieDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailedGetMovieDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.lang, lang) || other.lang == lang));
}


@override
int get hashCode => Object.hash(runtimeType,id,lang);

@override
String toString() {
  return 'MovieDetailedEvent.getMovieDetails(id: $id, lang: $lang)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailedGetMovieDetailsCopyWith<$Res> implements $MovieDetailedEventCopyWith<$Res> {
  factory _$MovieDetailedGetMovieDetailsCopyWith(_MovieDetailedGetMovieDetails value, $Res Function(_MovieDetailedGetMovieDetails) _then) = __$MovieDetailedGetMovieDetailsCopyWithImpl;
@override @useResult
$Res call({
 int id, String lang
});




}
/// @nodoc
class __$MovieDetailedGetMovieDetailsCopyWithImpl<$Res>
    implements _$MovieDetailedGetMovieDetailsCopyWith<$Res> {
  __$MovieDetailedGetMovieDetailsCopyWithImpl(this._self, this._then);

  final _MovieDetailedGetMovieDetails _self;
  final $Res Function(_MovieDetailedGetMovieDetails) _then;

/// Create a copy of MovieDetailedEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? lang = null,}) {
  return _then(_MovieDetailedGetMovieDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
