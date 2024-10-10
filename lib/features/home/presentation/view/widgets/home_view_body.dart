import 'package:flutter/material.dart';
import 'package:groove_box/core/utils/app_gradient.dart';
import 'package:groove_box/core/utils/app_text_styles.dart';
import 'package:groove_box/features/home/presentation/view/widgets/favourite_section.dart';
import 'package:groove_box/features/home/presentation/view/widgets/most_played.dart';
import 'package:groove_box/features/home/presentation/view/widgets/recently_played_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppGradients.buildHorizontalGradeint(),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
          const RecentlyPlayedSection(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          const FavouriteSection(),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 10,
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                'Most Played',
                style: AppTextStyles.qwitcher,
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 10,
          )),
          const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              sliver: MostPlayed())
        ],
      ),
    );
  }
}
