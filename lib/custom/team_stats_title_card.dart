import 'package:flutter/material.dart';

class TeamStatsTitleCard extends StatelessWidget {
  // const TeamStatsTitleCard({Key? key}) : super(key: key);
  final String title;
  TeamStatsTitleCard(this.title);

  @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Theme.of(context).primaryColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           this.title,
//         ),
//       ),
//     );
//   }
// }

  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: appWidth * 0.3,
      child: Card(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              this.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
