import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            child: DrawerHeader(
              child: Center(
                child: Text(
                  'Football Scorer',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: Colors.black,
                ),
                title: Text(
                  'About',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                ),
                title: Text(
                  'Exit',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                onTap: () => {SystemNavigator.pop()},
              ),
            ],
          ),
          Spacer(),
          // Divider(color: Colors.black),
          Container(
            child: Card(
              child: ListTile(
                title: Text(
                  "Made by",
                  style: TextStyle(color: Colors.grey[700], fontSize: 15),
                ),
                subtitle: Text(
                  "Harshal Hole",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Drawer(
//       child: Column(
//         children: <Widget>[
//           Container(
//             child: DrawerHeader(
//               child: Center(
//                 child: Text(
//                   'Football Scorer',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).primaryColor,
//               ),
//             ),
//           ),
//           Container(
//             color: Theme.of(context).accentColor,
//             child: Column(
//               children: [
//                 ListTile(
//                   leading: Icon(Icons.info_outline),
//                   title: Text('About'),
//                   onTap: () => {Navigator.of(context).pop()},
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.exit_to_app),
//                   title: Text('Home'),
//                   onTap: () => {},
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );

// Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             child: Center(
//               child: Text(
//                 'Football Scorer',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 25,
//                 ),
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor,
//             ),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.info_outline,
//               color: Colors.black,
//             ),
//             title: Text(
//               'About',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 17,
//               ),
//             ),
//             onTap: () => {Navigator.of(context).pop()},
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.exit_to_app,
//               color: Colors.black,
//             ),
//             title: Text(
//               'Exit',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 17,
//               ),
//             ),
//             onTap: () => {},
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: ListTile(
//               title: Text("Made by"),
//               subtitle: Text("Harshal Hole"),
//             ),
//           ),
//         ],
//       ),
//     );
