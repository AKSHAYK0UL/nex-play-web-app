// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_movies_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrendingMoviesEvent {

 String get lang; int get page; TimeWindow get timeWindow;
/// Create a copy of TrendingMoviesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrendingMoviesEventCopyWith<TrendingMoviesEvent> get copyWith => _$TrendingMoviesEventCopyWithImpl<TrendingMoviesEvent>(this as TrendingMoviesEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendingMoviesEvent&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.page, page) || other.page == page)&&(identical(other.timeWindow, timeWindow) || other.timeWindow == timeWindow));
}


@override
int get hashCode => Object.hash(runtimeType,lang,page,timeWindow);

@override
String toString() {
  return 'TrendingMoviesEvent(lang: $lang, page: $page, timeWindow: $timeWindow)';
}


}

/// @nodoc
abstract mixin class $TrendingMoviesEventCopyWith<$Res>  {
  factory $TrendingMoviesEventCopyWith(TrendingMoviesEvent value, $Res Function(TrendingMoviesEvent) _then) = _$TrendingMoviesEventCopyWithImpl;
@useResult
$Res call({
 String lang, int page, TimeWindow timeWindow
});




}
/// @nodoc
class _$TrendingMoviesEventCopyWithImpl<$Res>
    implements $TrendingMoviesEventCopyWith<$Res> {
  _$TrendingMoviesEventCopyWithImpl(this._self, this._then);

  final TrendingMoviesEvent _self;
  final $Res Function(TrendingMoviesEvent) _then;

/// Create a copy of TrendingMoviesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lang = null,Object? page = null,Object? timeWindow = null,}) {
  return _then(_self.copyWith(
lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,timeWindow: null == timeWindow ? _self.timeWindow : timeWindow // ignore: cast_nullable_to_non_nullable
as TimeWindow,
  ));
}

}


/// Adds pattern-matching-related methods to [TrendingMoviesEvent].
extension TrendingMoviesEventPatterns on TrendingMoviesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TrendingMoviesGetTrending value)?  getTrending,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrendingMoviesGetTrending() when getTrending != null:
return getTrending(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TrendingMoviesGetTrending value)  getTrending,}){
final _that = this;
switch (_that) {
case _TrendingMoviesGetTrending():
return getTrending(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TrendingMoviesGetTrending value)?  getTrending,}){
final _that = this;
switch (_that) {
case _TrendingMoviesGetTrending() when getTrending != null:
return getTrending(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String lang,  int page,  TimeWindow timeWindow)?  getTrending,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrendingMoviesGetTrending() when getTrending != null:
return getTrending(_that.lang,_that.page,_that.timeWindow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String lang,  int page,  TimeWindow timeWindow)  getTrending,}) {final _that = this;
switch (_that) {
case _TrendingMoviesGetTrending():
return getTrending(_that.lang,_that.page,_that.timeWindow);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String lang,  int page,  TimeWindow timeWindow)?  getTrending,}) {final _that = this;
switch (_that) {
case _TrendingMoviesGetTrending() when getTrending != null:
return getTrending(_that.lang,_that.page,_that.timeWindow);case _:
  return null;

}
}

}

/// @nodoc


class _TrendingMoviesGetTrending implements TrendingMoviesEvent {
  const _TrendingMoviesGetTrending({required this.lang, required this.page, required this.timeWindow});
  

@override final  String lang;
@override final  int page;
@override final  TimeWindow timeWindow;

/// Create a copy of TrendingMoviesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrendingMoviesGetTrendingCopyWith<_TrendingMoviesGetTrending> get copyWith => __$TrendingMoviesGetTrendingCopyWithImpl<_TrendingMoviesGetTrending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrendingMoviesGetTrending&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.page, page) || other.page == page)&&(identical(other.timeWindow, timeWindow) || other.timeWindow == timeWindow));
}


@override
int get hashCode => Object.hash(runtimeType,lang,page,timeWindow);

@override
String toString() {
  return 'TrendingMoviesEvent.getTrending(lang: $lang, page: $page, timeWindow: $timeWindow)';
}


}

/// @nodoc
abstract mixin class _$TrendingMoviesGetTrendingCopyWith<$Res> implements $TrendingMoviesEventCopyWith<$Res> {
  factory _$TrendingMoviesGetTrendingCopyWith(_TrendingMoviesGetTrending value, $Res Function(_TrendingMoviesGetTrending) _then) = __$TrendingMoviesGetTrendingCopyWithImpl;
@override @useResult
$Res call({
 String lang, int page, TimeWindow timeWindow
});




}
/// @nodoc
class __$TrendingMoviesGetTrendingCopyWithImpl<$Res>
    implements _$TrendingMoviesGetTrendingCopyWith<$Res> {
  __$TrendingMoviesGetTrendingCopyWithImpl(this._self, this._then);

  final _TrendingMoviesGetTrending _self;
  final $Res Function(_TrendingMoviesGetTrending) _then;

/// Create a copy of TrendingMoviesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lang = null,Object? page = null,Object? timeWindow = null,}) {
  return _then(_TrendingMoviesGetTrending(
lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,timeWindow: null == timeWindow ? _self.timeWindow : timeWindow // ignore: cast_nullable_to_non_nullable
as TimeWindow,
  ));
}


}

// dart format on
