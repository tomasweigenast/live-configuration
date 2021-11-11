import 'dart:collection';

import 'package:webapp_api/src/api/api_response.dart';

class Query {

  final List<QueryFilter>? _filters;
  final List<QuerySort>? _sort;
  final PageDetails _paging;

  List<QueryFilter>? get filters => _filters == null ? null : UnmodifiableListView(_filters!);
  List<QuerySort>? get sorting => _sort == null ? null : UnmodifiableListView(_sort!);
  PageDetails get paging => _paging; 

  const Query({List<QueryFilter>? filters, List<QuerySort>? sorting, PageDetails? paging})
    : _filters = filters,
      _sort = sorting,
      _paging = paging ?? const PageDetails(pageSize: 100);
}

abstract class QueryFilter {
  final FilterOperator operator;

  const QueryFilter({required this.operator});

  factory QueryFilter.equal(String property, Object? value) => _ConditionalQueryFilter(property, value, FilterOperator.equal); 
  factory QueryFilter.notEqual(String property, Object? value)  => _ConditionalQueryFilter(property, value, FilterOperator.notEqual); 
  factory QueryFilter.greaterThan(String property, Object? value)  => _ConditionalQueryFilter(property, value, FilterOperator.greaterThan); 
  factory QueryFilter.greaterThanOrEqualsTo(String property, Object? value)  => _ConditionalQueryFilter(property, value, FilterOperator.greaterThanOrEqualsTo); 
  factory QueryFilter.lessThan(String property, Object? value)  => _ConditionalQueryFilter(property, value, FilterOperator.lessThan); 
  factory QueryFilter.lessThanOrEqualsTo(String property, Object? value)  => _ConditionalQueryFilter(property, value, FilterOperator.lessThanOrEqualsTo); 
  factory QueryFilter.arrayContains(String property, Object? value) => _ConditionalQueryFilter(property, value, FilterOperator.arrayContains); 
  factory QueryFilter.arrayContainsAny(String property, Iterable<Object> values) => _ConditionalQueryFilter(property, values, FilterOperator.arrayContains); 
  factory QueryFilter.betweens(String property, Object first, Object second) => _ConditionalQueryFilter(property, [first, second], FilterOperator.arrayContains); 
  factory QueryFilter.or(List<QueryFilter> filters) => _OrQueryFilter(filters); 
}

class _ConditionalQueryFilter extends QueryFilter {
  final String property;
  final Object? value;
  
  const _ConditionalQueryFilter(this.property, this.value, FilterOperator operator) : super(operator: operator);
}

class _OrQueryFilter extends QueryFilter {
  final List<QueryFilter> filters;
  
  const _OrQueryFilter(this.filters) : super(operator: FilterOperator.or);
}

class QuerySort {
  final String property;
  final SortDirection direction;

  const QuerySort.ascending(this.property) : direction = SortDirection.ascending;
  const QuerySort.descending(this.property) : direction = SortDirection.descending;
}

enum SortDirection {
  ascending, descending
}

enum FilterOperator {
  equal, 
  notEqual, 
  greaterThan, 
  greaterThanOrEqualsTo,
  lessThan,
  lessThanOrEqualsTo,
  arrayContains,
  arrayContainsAny,
  betweens,
  or,
  and
}