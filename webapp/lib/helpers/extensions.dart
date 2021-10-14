import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

extension FormBuilderExtensions on GlobalKey<FormBuilderState> {
  T? getFieldOrNull<T>(String name) {
    return currentState!.fields[name]?.value as T?;
  }

  T getField<T>(String name) {
    var field = currentState!.fields[name]?.value as T?;
    if(field == null) {
      throw Exception("Field $name not found.");
    }

    return field;
  }

  Map<String, Object?> getFields() {
    return currentState!.fields.map((key, value) => MapEntry(key, value.value as Object?));
  }
}