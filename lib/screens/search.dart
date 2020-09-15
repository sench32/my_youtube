import 'package:flutter/material.dart';

import '../custom__icons.dart';

// ignore: camel_case_types
class My_search extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => 'Поиск';

  final sities = [
    "Holliwood",
    "Boston",
    "Abilene",
    "Akron",
    "Bridgeport",
    "Charlotte",
    "Birmingham",
    "Ann Arbor",
  ];

  final recentSities = [
    "Abilene",
    "Akron",
    "Bridgeport",
    "Charlotte",
  ];

  // (actions for app bar - действия для панели приложений)
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
    // throw UnimplementedError();
  }

  // (leading icon on left of the app bar - ведущий значок слева от панели приложения)
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
    // throw UnimplementedError();
  }

  // (show some result based on the selection - показать какой-то результат на основе выбора)
  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  // (show when someone searches for something - показать, когда кто-то что-то ищет)
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSities
        : sities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          leading: Icon(
            Icons.restore,
          ),
          title: Text(suggestionList[index]),
          trailing: IconButton(
            highlightColor: Colors.transparent,
            icon: Icon(
              Custom_Icons.mynorthwest_24px,
              size: 14,
            ),
            onPressed: () {},
          ),
          onTap: () {},
          onLongPress: () {},
        ),
      ),
      itemCount: suggestionList.length,
    );
    // throw UnimplementedError();
  }
}
