part of 'search_cubit.dart';

class SearchState {
  List<Item> items;
  List<Item> results;
  String query;

  SearchState({ required this.items, required this.results, required this.query });

  factory SearchState.init() {
    return SearchState(
      items: List<Item>.generate(20, (index) {
        return ListItem(
          title: "teste $index",
          subtitle: "Subtítulo $index",
          content: "Conteudo $index",
          img: const SizedBox()
        );
      }).toList(),
      results: [],
      query: ""
    );
  }

  SearchState addItem(item) {
    items.insert(0, item);
    return copyWith(items: items);
  }

  SearchState search(query) {
    results = items.where(
      (element) {
        return element.title.contains(query) ||
               element.subtitle.contains(query) ||
               element.content.contains(query);
      } 
    ).toList();
    return copyWith(results: results, query: query);
  }

  SearchState copyWith({
    List<Item>? items,
    List<Item>? results,
    String? query
  }) {
    return SearchState(
      items: items??this.items,
      results: results??this.results,
      query: query??this.query
    );
  }
}