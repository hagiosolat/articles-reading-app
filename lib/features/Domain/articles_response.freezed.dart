// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArticlesResponse _$ArticlesResponseFromJson(Map<String, dynamic> json) {
  return _ArticlesResponse.fromJson(json);
}

/// @nodoc
mixin _$ArticlesResponse {
  List<Article> get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticlesResponseCopyWith<ArticlesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesResponseCopyWith<$Res> {
  factory $ArticlesResponseCopyWith(
          ArticlesResponse value, $Res Function(ArticlesResponse) then) =
      _$ArticlesResponseCopyWithImpl<$Res, ArticlesResponse>;
  @useResult
  $Res call({List<Article> articles});
}

/// @nodoc
class _$ArticlesResponseCopyWithImpl<$Res, $Val extends ArticlesResponse>
    implements $ArticlesResponseCopyWith<$Res> {
  _$ArticlesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticlesResponseImplCopyWith<$Res>
    implements $ArticlesResponseCopyWith<$Res> {
  factory _$$ArticlesResponseImplCopyWith(_$ArticlesResponseImpl value,
          $Res Function(_$ArticlesResponseImpl) then) =
      __$$ArticlesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Article> articles});
}

/// @nodoc
class __$$ArticlesResponseImplCopyWithImpl<$Res>
    extends _$ArticlesResponseCopyWithImpl<$Res, _$ArticlesResponseImpl>
    implements _$$ArticlesResponseImplCopyWith<$Res> {
  __$$ArticlesResponseImplCopyWithImpl(_$ArticlesResponseImpl _value,
      $Res Function(_$ArticlesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_$ArticlesResponseImpl(
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticlesResponseImpl implements _ArticlesResponse {
  _$ArticlesResponseImpl({required final List<Article> articles})
      : _articles = articles;

  factory _$ArticlesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticlesResponseImplFromJson(json);

  final List<Article> _articles;
  @override
  List<Article> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'ArticlesResponse(articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticlesResponseImpl &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticlesResponseImplCopyWith<_$ArticlesResponseImpl> get copyWith =>
      __$$ArticlesResponseImplCopyWithImpl<_$ArticlesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticlesResponseImplToJson(
      this,
    );
  }
}

abstract class _ArticlesResponse implements ArticlesResponse {
  factory _ArticlesResponse({required final List<Article> articles}) =
      _$ArticlesResponseImpl;

  factory _ArticlesResponse.fromJson(Map<String, dynamic> json) =
      _$ArticlesResponseImpl.fromJson;

  @override
  List<Article> get articles;
  @override
  @JsonKey(ignore: true)
  _$$ArticlesResponseImplCopyWith<_$ArticlesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
