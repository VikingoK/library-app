import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_search_provider.g.dart';

@Riverpod(keepAlive: true)
class RecentSearch extends _$RecentSearch {
  @override
  List<String> build() => [];

  void addSearch(String code) {
    if (state.contains(code.trim())) return;

    if (state.length >= 5) {
      state.removeLast();
    }

    state = [code, ...state];
  }

  void removeSearch(String code) {
    state = state.where((search) => search != code).toList();
  }
}
