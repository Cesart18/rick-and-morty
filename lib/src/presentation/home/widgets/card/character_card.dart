part of '../../base/home_page.dart';

class _CharacterCard extends StatelessWidget {
  const _CharacterCard({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          CharacterDetailsPage.navigateTo(context, character: character),
      child: Container(
        padding: EdgeInsets.all(WidthValues.spacing2Md),
        decoration: BoxDecoration(
          color: ColorValues.bgPrimary(context),
          border: Border.all(color: ColorValues.borderPrimary(context)),
          borderRadius: BorderRadius.circular(WidthValues.radius4xl),
          boxShadow: [
            BoxShadow(
              color: ColorValues.textPrimary(context).withValues(alpha: 0.1),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(3, 5),
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
      ),
    );
  }
}
