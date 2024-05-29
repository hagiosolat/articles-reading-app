// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$articleRepositoryHash() => r'bd161a13c077fa5d0704d7a0049b659d48a73a4a';

/// See also [articleRepository].
@ProviderFor(articleRepository)
final articleRepositoryProvider =
    AutoDisposeProvider<ArticleRepository>.internal(
  articleRepository,
  name: r'articleRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$articleRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ArticleRepositoryRef = AutoDisposeProviderRef<ArticleRepository>;
String _$getArticlesHash() => r'2d5725a2fbe5c91cce57aca75930c9af24549bc3';

/// See also [getArticles].
@ProviderFor(getArticles)
final getArticlesProvider = AutoDisposeFutureProvider<List<Article>>.internal(
  getArticles,
  name: r'getArticlesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getArticlesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetArticlesRef = AutoDisposeFutureProviderRef<List<Article>>;
String _$sortArticlesByPriorityHash() =>
    r'bbdcd3ad6a23ea6c0a866691d9c7f352f9929ad1';

/// See also [sortArticlesByPriority].
@ProviderFor(sortArticlesByPriority)
final sortArticlesByPriorityProvider =
    AutoDisposeFutureProvider<List<Article>>.internal(
  sortArticlesByPriority,
  name: r'sortArticlesByPriorityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sortArticlesByPriorityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SortArticlesByPriorityRef = AutoDisposeFutureProviderRef<List<Article>>;
String _$getOneArticleHash() => r'4e78063d12f67a80dac03f8ba971e837fb93d450';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getOneArticle].
@ProviderFor(getOneArticle)
const getOneArticleProvider = GetOneArticleFamily();

/// See also [getOneArticle].
class GetOneArticleFamily extends Family<AsyncValue<Article>> {
  /// See also [getOneArticle].
  const GetOneArticleFamily();

  /// See also [getOneArticle].
  GetOneArticleProvider call({
    required int index,
  }) {
    return GetOneArticleProvider(
      index: index,
    );
  }

  @override
  GetOneArticleProvider getProviderOverride(
    covariant GetOneArticleProvider provider,
  ) {
    return call(
      index: provider.index,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getOneArticleProvider';
}

/// See also [getOneArticle].
class GetOneArticleProvider extends AutoDisposeFutureProvider<Article> {
  /// See also [getOneArticle].
  GetOneArticleProvider({
    required int index,
  }) : this._internal(
          (ref) => getOneArticle(
            ref as GetOneArticleRef,
            index: index,
          ),
          from: getOneArticleProvider,
          name: r'getOneArticleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOneArticleHash,
          dependencies: GetOneArticleFamily._dependencies,
          allTransitiveDependencies:
              GetOneArticleFamily._allTransitiveDependencies,
          index: index,
        );

  GetOneArticleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    FutureOr<Article> Function(GetOneArticleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOneArticleProvider._internal(
        (ref) => create(ref as GetOneArticleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Article> createElement() {
    return _GetOneArticleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOneArticleProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetOneArticleRef on AutoDisposeFutureProviderRef<Article> {
  /// The parameter `index` of this provider.
  int get index;
}

class _GetOneArticleProviderElement
    extends AutoDisposeFutureProviderElement<Article> with GetOneArticleRef {
  _GetOneArticleProviderElement(super.provider);

  @override
  int get index => (origin as GetOneArticleProvider).index;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
