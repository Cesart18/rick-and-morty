part of '../../base/home_page.dart';

class _CharacterImage extends StatelessWidget {
  const _CharacterImage({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(WidthValues.radius3xl);
    final shadowColor = ColorValues.textPrimary(context).withValues(alpha: 0.2);
    const spreadRadius = 1.0;
    const blurRadius = 2.0;
    const xOffset = 2.0;
    const yOffset = -1.0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            offset: const Offset(xOffset, yOffset),
          ),
          BoxShadow(
            color: shadowColor,
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            offset: const Offset(-xOffset, yOffset),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImageAdapter(imageUrl: character.image),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: WidthValues.spacingXxs),
                color: character.status.color(context),
                child: Text(
                  character.status.displayText,
                  textAlign: TextAlign.center,
                  style: context.appTextStyles.textXs.copyWith(
                    color: character.status.textColor(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
