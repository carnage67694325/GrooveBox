import 'package:flutter/material.dart';
import 'package:groove_box/core/utils/app_text_styles.dart';
import 'package:groove_box/features/home/presentation/view/widgets/recently_played_list.dart';

class RecentlyPlayedSection extends StatelessWidget {
  const RecentlyPlayedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6),
            child: Text(
              'Recently Played',
              style: AppTextStyles.heading,
            ),
          ),
          RecentlyPlayedList(),
        ],
      ),
    );
  }
}
