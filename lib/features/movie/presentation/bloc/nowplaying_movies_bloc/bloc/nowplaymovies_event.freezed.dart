// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nowplaymovies_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NowPlayMoviesEvent {

 String get lang; int get page;
/// Create a copy of NowPlayMoviesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NowPlayMoviesEventCopyWith<NowPlayMoviesEvent> get copyWith => _$NowPlayMoviesEventCopyWithImpl<NowPlayMoviesEvent>(this as NowPlayMoviesEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NowPlayMoviesEvent&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,lang,page);

@override
String toString() {
  return 'NowPlayMoviesEvent(lang: $lang, page: $page)';
}


}

/// @nodoc
abstract mixin class $NowPlayMoviesEventCopyWith<$Res>  {
  factory $NowPlayMoviesEventCopyWith(NowPlayMoviesEvent value, $Res Function(NowPlayMoviesEvent) _then) = _$NowPlayMoviesEventCopyWithImpl;
@useResult
$Res call({
 String lang, int page
});




}
/// @nodoc
class _$NowPlayMoviesEventCopyWithImpl<$Res>
    implements $NowPlayMoviesEventCopyWith<$Res> {
  _$NowPlayMoviesEventCopyWithImpl(this._self, this._then);

  final NowPlayMoviesEvent _self;
  final $Res Function(NowPlayMoviesEvent) _then;

/// Create a copy of NowPlayMoviesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lang = null,Object? page = null,}) {
  return _then(_self.copyWith(
lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NowPlayMoviesEvent].
extension NowPlayMoviesEventPatterns on NowPlayMoviesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NowPlayingGetNowPlaying value)?  getNowPlaying,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NowPlayingGetNowPlaying() when getNowPlaying != null:
return getNowPlaying(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NowPlayingGetNowPlaying value)  getNowPlaying,}){
final _that = this;
switch (_that) {
case _NowPlayingGetNowPlaying():
return getNowPlaying(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NowPlayingGetNowPlaying value)?  getNowPlaying,}){
final _that = this;
switch (_that) {
case _NowPlayingGetNowPlaying() when getNowPlaying != null:
return getNowPlaying(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String lang,  int page)?  getNowPlaying,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NowPlayingGetNowPlaying() when getNowPlaying != null:
return getNowPlaying(_that.lang,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String lang,  int page)  getNowPlaying,}) {final _that = this;
switch (_that) {
case _NowPlayingGetNowPlaying():
return getNowPlaying(_that.lang,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String lang,  int page)?  getNowPlaying,}) {final _that = this;
switch (_that) {
case _NowPlayingGetNowPlaying() when getNowPlaying != null:
return getNowPlaying(_that.lang,_that.page);case _:
  return null;

}
}

}

/// @nodoc


class _NowPlayingGetNowPlaying implements NowPlayMoviesEvent {
  const _NowPlayingGetNowPlaying({required this.lang, required this.page});
  

@override final  String lang;
@override final  int page;

/// Create a copy of NowPlayMoviesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NowPlayingGetNowPlayingCopyWith<_NowPlayingGetNowPlaying> get copyWith => __$NowPlayingGetNowPlayingCopyWithImpl<_NowPlayingGetNowPlaying>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NowPlayingGetNowPlaying&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,lang,page);

@override
String toString() {
  return 'NowPlayMoviesEvent.getNowPlaying(lang: $lang, page: $page)';
}


}

/// @nodoc
abstract mixin class _$NowPlayingGetNowPlayingCopyWith<$Res> implements $NowPlayMoviesEventCopyWith<$Res> {
  factory _$NowPlayingGetNowPlayingCopyWith(_NowPlayingGetNowPlaying value, $Res Function(_NowPlayingGetNowPlaying) _then) = __$NowPlayingGetNowPlayingCopyWithImpl;
@override @useResult
$Res call({
 String lang, int page
});




}
/// @nodoc
class __$NowPlayingGetNowPlayingCopyWithImpl<$Res>
    implements _$NowPlayingGetNowPlayingCopyWith<$Res> {
  __$NowPlayingGetNowPlayingCopyWithImpl(this._self, this._then);

  final _NowPlayingGetNowPlaying _self;
  final $Res Function(_NowPlayingGetNowPlaying) _then;

/// Create a copy of NowPlayMoviesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lang = null,Object? page = null,}) {
  return _then(_NowPlayingGetNowPlaying(
lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
