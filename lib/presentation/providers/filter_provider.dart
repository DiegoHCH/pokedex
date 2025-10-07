import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    return <String>{};
  }

  void setSelectedTypes(Set<String> types) {
    state = types;
  }

  void clearFilters() {
    state = <String>{};
  }

  bool get hasActiveFilters => state.isNotEmpty;
}

final filterProvider = NotifierProvider<FilterNotifier, Set<String>>(() {
  return FilterNotifier();
});
