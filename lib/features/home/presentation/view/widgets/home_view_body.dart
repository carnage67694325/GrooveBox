import 'package:flutter/material.dart';
import 'package:groove_box/core/utils/app_gradient.dart';
import 'package:groove_box/core/utils/app_text_styles.dart';
import 'package:groove_box/features/home/presentation/view/widgets/favourite_section.dart';
import 'package:groove_box/features/home/presentation/view/widgets/most_played.dart';
import 'package:groove_box/features/home/presentation/view/widgets/recently_played_widgets.dart';

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
          //RecentlyPlayedSection(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          FavouriteSection(),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 10,
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                'Most Played',
                style: AppTextStyles.heading,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 10,
          )),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              sliver: MostPlayed())
        ],
      ),
    );
  }
}
