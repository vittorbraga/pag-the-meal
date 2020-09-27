// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$searchAtom = Atom(name: '_HomeStore.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$categoryAtom = Atom(name: '_HomeStore.category');

  @override
  List<Category> get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(List<Category> value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$productAtom = Atom(name: '_HomeStore.product');

  @override
  List<Product> get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(List<Product> value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void setSearch(String value) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchCategoryList() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.fetchCategoryList');
    try {
      return super.fetchCategoryList();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchProductList() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.fetchProductList');
    try {
      return super.fetchProductList();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getchProductListByCategory(String category) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.getchProductListByCategory');
    try {
      return super.getchProductListByCategory(category);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
category: ${category},
product: ${product}
    ''';
  }
}
