part of '../base/character_details_page.dart';

class _CharacterImage extends StatelessWidget {
  const _CharacterImage({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final shadowColor = ColorValues.textPrimary(context).withValues(alpha: 0.2);
    const spreadRadius = 2.0;
    const blurRadius = 8.0;
    const xOffset = 3.0;
    const yOffset = 0.0;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(WidthValues.radius2xl),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
              offset: const Offset(xOffset, yOffset),
            ),
            BoxShadow(
              color: ColorValues.textPrimary(context).withValues(alpha: 0.2),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
              offset: const Offset(-xOffset, yOffset),
            ),
          ],
        ),
        child: CachedNetworkImageAdapter(
          imageUrl: character.image,
          width: double.infinity,
          height: 300,
          borderRadius: BorderRadius.circular(WidthValues.radius2xl),
        ),
      ),
    );
  }
}
