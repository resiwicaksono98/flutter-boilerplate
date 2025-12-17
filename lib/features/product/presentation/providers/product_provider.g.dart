// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productHash() => r'36df843539a78825d21c47ee3dacd912c4869f64';

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

/// See also [product].
@ProviderFor(product)
const productProvider = ProductFamily();

/// See also [product].
class ProductFamily extends Family<AsyncValue<Product>> {
  /// See also [product].
  const ProductFamily();

  /// See also [product].
  ProductProvider call(int id) {
    return ProductProvider(id);
  }

  @override
  ProductProvider getProviderOverride(covariant ProductProvider provider) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productProvider';
}

/// See also [product].
class ProductProvider extends AutoDisposeFutureProvider<Product> {
  /// See also [product].
  ProductProvider(int id)
    : this._internal(
        (ref) => product(ref as ProductRef, id),
        from: productProvider,
        name: r'productProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$productHash,
        dependencies: ProductFamily._dependencies,
        allTransitiveDependencies: ProductFamily._allTransitiveDependencies,
        id: id,
      );

  ProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Product> Function(ProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductProvider._internal(
        (ref) => create(ref as ProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Product> createElement() {
    return _ProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductRef on AutoDisposeFutureProviderRef<Product> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProductProviderElement extends AutoDisposeFutureProviderElement<Product>
    with ProductRef {
  _ProductProviderElement(super.provider);

  @override
  int get id => (origin as ProductProvider).id;
}

String _$productsHash() => r'41badff8e016666ee408304742c56542ef2965a7';

/// See also [Products].
@ProviderFor(Products)
final productsProvider =
    AutoDisposeAsyncNotifierProvider<Products, List<Product>>.internal(
      Products.new,
      name: r'productsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$productsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Products = AutoDisposeAsyncNotifier<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
