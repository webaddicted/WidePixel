import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/view/list/PhotoListItem.dart';

class SearchItem extends SearchDelegate<int> {
  final List<String> _data = ['Love', "Bride"].toList();
  List<String> _history = <String>[
    'Car',
    'Nature',
    'Animal',
    'Oh Baby',
    'Like'
  ];

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        tooltip: 'Back',
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () => Get.back());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = query.isEmpty
        ? _history
        : _data.where((String i) => '$i'.startsWith(query));
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion =
            suggestions.map((String i) => '$i').toList()[i];
        return ListTile(
          leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
          title: getTxtBlackColor(
              msg: suggestion.substring(query.length), fontSize: 16),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return PhotoListItem('Nature');
    // final int? searched = int.tryParse(query);
    // if (searched == null || !_data.contains(searched)) {
    //   return Center(
    //     child: Text(
    //       '"$query"\n is not a valid integer between 0 and 100,000.\nTry again.',
    //       textAlign: TextAlign.center,
    //     ),
    //   );
    // }
    //
    // return ListView(
    //   children: <Widget>[
    //     _ResultCard(
    //       title: 'This integer',
    //       integer: searched,
    //       searchDelegate: this,
    //     ),
    //     _ResultCard(
    //       title: 'Next integer',
    //       integer: searched + 1,
    //       searchDelegate: this,
    //     ),
    //     _ResultCard(
    //       title: 'Previous integer',
    //       integer: searched - 1,
    //       searchDelegate: this,
    //     ),
    //   ],
    // );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isEmpty
          ? IconButton(
              tooltip: 'Voice Search',
              icon: const Icon(Icons.mic),
              onPressed: () {
                query = 'Voice input';
              },
            )
          : IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
    ];
  }
}
