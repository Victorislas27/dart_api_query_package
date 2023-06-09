import 'package:dart_api_query_package/src/builder.dart';
import 'package:dart_api_query_package/src/static_model.dart';

class Model extends StaticModel {
  late final Builder builder;

  late String _customResource;

  Model() : super() {
    builder = Builder(this);
  }

  String baseUrl() {
    return baseUrl();
  }

  String resource() {
    return builder.model.toString();
  }

  parameterNames() {
    return {
      'include': 'include',
      'filter': 'filter',
      'sort': 'sort',
      'fields': 'fields',
      'append': 'append',
      'page': 'page',
      'limit': 'limit'
    };
  }

  String custom(String args) {
    _customResource = args;

    return _customResource;
  }

  primaryKey() {
    return 'id';
  }

  getPrimaryKey() {
    return primaryKey();
  }

  isValidId(id) {
    return !!id;
  }

  String url() {
    String base = '';

    base = _customResource.isNotEmpty ? '${baseUrl()}/$_customResource' : base;

    builder.reset();

    return '$base${builder.query()}';
  }

  String reset() {
    return builder.reset();
  }

  Model include(List<String> args) {
    builder.includes(args);

    return this;
  }

  Model params(Map<String, dynamic> payload) {
    builder.params(payload);

    return this;
  }

  Model append(List<String> append) {
    builder.appends(append);

    return this;
  }

  Model select(Map<String, dynamic> args) {
    builder.select(args);

    return this;
  }

  Model where(String key, String value) {
    builder.where(key, value);

    return this;
  }

  Model whereIn(String key, List<String> list) {
    builder.whereIn(key, list);

    return this;
  }

  Model page(int value) {
    builder.page(value);

    return this;
  }

  Model limit(int value) {
    builder.limit(value);

    return this;
  }

  Model orderBy(List<String> args) {
    builder.orderBy(args);

    return this;
  }
}
