part of '../../base/home_page.dart';

class _CharacterCard extends StatelessWidget {
  const _CharacterCard({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(WidthValues.spacing2Md),
      decoration: BoxDecoration(
        color: ColorValues.bgPrimary(context),
        border: Border.all(color: ColorValues.borderPrimary(context)),
        borderRadius: BorderRadius.circular(WidthValues.radius4xl),
        boxShadow: [
          BoxShadow(
            color: ColorValues.textPrimary(context).withValues(alpha: 0.1),
            blurRadius: WidthValues.radiusXs,
            offset: Offset(0, WidthValues.radiusXs),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: WidthValues.spacingXs,
        children: [
          Expanded(child: _CharacterImage(character: character)),

          _CharacterInfo(character: character),
        ],
      ),
    );
  }
}
