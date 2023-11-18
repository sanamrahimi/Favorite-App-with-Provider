import 'package:favorite_app_provider/provider/favorite_provider.dart';
import 'package:favorite_app_provider/screens/my_favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
//without provider
  List<int> _selectedItem = [];

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite App'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyFavoritesScreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Consumer<FavoriteItemsProvider>(
                        builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        title: Text('item' + index.toString()),
                        trailing: Icon(value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_outline),
                      );
                    });
                  }))
        ],
      ),
    );
  }
}

// manual methode of add to favorite

// import 'package:flutter/material.dart';
//
// class FavoriteScreen extends StatefulWidget {
//   const FavoriteScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FavoriteScreen> createState() => _FavoriteScreenState();
// }
//
// class _FavoriteScreenState extends State<FavoriteScreen> {
//
//   List<int> selectedItem = [];
//
//   @override
//   Widget build(BuildContext context) {
//     print('build');
//     return Scaffold(
//       appBar: AppBar(title: Text('Favorite App')),
//       body: Column(
//         children: [Expanded(child: ListView.builder(
//             itemCount: 100,
//             itemBuilder: (context, index){
//               return ListTile(
//                 onTap: (){
//                   selectedItem.add(index);
//                   setState(() {
//
//                   });
//
//                 },
//                 title: Text('item'+index.toString()),
//                 trailing: Icon(
//                     selectedItem.contains(index)?
//                     Icons.favorite
//                         : Icons.favorite_outline),
//               );
//             }))],
//       ),
//     );
//   }
// }
