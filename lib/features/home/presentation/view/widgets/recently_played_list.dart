// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:groove_box/core/utils/widgets/music_card.dart';

// class RecentlyPlayedList extends StatelessWidget {
//   const RecentlyPlayedList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 8,
//       ),
//       child: SizedBox(
//         height: MediaQuery.sizeOf(context).height * 0.2,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: 10,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: MusicCard(onTap: () {
//                 log('tapped');
//               }),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
