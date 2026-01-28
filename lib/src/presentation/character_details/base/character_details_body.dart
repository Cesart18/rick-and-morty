part of '../base/character_details_page.dart';

/// {@template character_details_body}
/// Body of the CharacterDetailsPage
/// {@endtemplate}
class _CharacterDetailsBody extends StatelessWidget {
  /// {@macro character_details_body}
  const _CharacterDetailsBody({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(WidthValues.spacing2xl),
      child: Container(
        padding: EdgeInsets.all(WidthValues.spacing2xl),
        decoration: BoxDecoration(
          color: ColorValues.bgPrimary(context),
          borderRadius: BorderRadius.circular(WidthValues.radius3xl),
          border: Border.all(color: ColorValues.borderPrimary(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CharacterImage(character: character),

            Sizer.gap(WidthValues.spacingXl),

            _CharacterInfo(character: character),
          ],
        ),
      ),
    );
  }
}
