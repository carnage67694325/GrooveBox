import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groove_box/core/model/music_model.dart';
import 'package:groove_box/core/utils/app_gradient.dart';
import 'package:groove_box/core/utils/app_text_styles.dart';
import 'package:groove_box/core/utils/widgets/music_card.dart';

class MusicListTile extends StatelessWidget {
  const MusicListTile({
    super.key,
    required this.musicModel,
  });
  final MusicModel musicModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: AppGradients.diagonalGradient,
            borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height * .13,
                      child: MusicCard(onTap: () {})),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Text(
                          musicModel.title,
                          style: AppTextStyles.subHeading,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          musicModel.artist,
                          style: AppTextStyles.subHeading,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(FontAwesomeIcons.heart),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
