import 'package:flutter/material.dart';
import 'package:groove_box/core/utils/app_gradient.dart';
import 'package:groove_box/core/utils/app_text_styles.dart';
import 'package:groove_box/core/utils/widgets/music_card.dart';
import 'package:groove_box/features/home/presentation/view/widgets/recently_played_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(gradient: AppGradients.horizontalGradient),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                'Recently Played',
                style: AppTextStyles.heading,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: RecentlyPlayedList(),
          )
        ],
      ),
    );
  }
}
