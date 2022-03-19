import 'package:flutter/material.dart';

import 'package:superheroes/blocs/main_bloc.dart';
import 'package:superheroes/model/biography.dart';
import 'package:superheroes/resources/superhoroes_colors.dart';
import 'package:superheroes/widgets/alignment_widget.dart';

class BiographyCard extends StatelessWidget {
  final Biography biography;

  const BiographyCard({
    Key? key,
    required this.biography,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: SuperheroesColors.superheroCardBG,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                SizedBox(height: 16),
                Text(
                  "Bio".toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white),
                ),
                // SizedBox(height: 8),
                bioAliasHeader("Full name"),
                SizedBox(height: 4),
                bioAliasText(biography.fullName),
                SizedBox(height: 20),
                bioAliasHeader("Aliases"),
                SizedBox(height: 4),
                bioAliasText(biography.aliases.join(", ")),
                SizedBox(height: 20),
                bioAliasHeader("Place of birth"),
                SizedBox(height: 4),
                bioAliasText(biography.placeOfBirth),
                SizedBox(height: 24)
              ],
            ),
          ),
          Row(
            children: [
              const Expanded(child: SizedBox()),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(20))),
                height: 70,
                width: 24,
                child: biography.alignmentInfo != null
                    ? AlignmentWidget(alignmentInfo: biography.alignmentInfo!)
                    : const SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row bioAliasHeader(final String name) {
    return Row(
      children: [
        Text(
          name.toUpperCase(),
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Color(0xFF999999)),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }

  Row bioAliasText(final String text) {
    return Row(
      children: [
        Flexible(
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
