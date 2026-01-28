part of '../base/character_details_page.dart';

class _CharacterInfo extends StatelessWidget {
  const _CharacterInfo({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: WidthValues.spacingMd,
      children: [
        Text(
          character.name,
          style: context.textTheme.headlineLarge?.copyWith(
            color: ColorValues.textPrimary(context),
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Container(
              width: WidthValues.spacingMd,
              height: WidthValues.spacingMd,
              decoration: BoxDecoration(
                color: character.status.color(context),
                shape: BoxShape.circle,
              ),
            ),
            Text(
              '${character.status.displayText} - ${character.species}',
              style: context.textTheme.bodyLarge?.copyWith(
                color: ColorValues.textSecondary(context),
              ),
            ),
          ],
        ),
        if (character.type.isNotEmpty) ...[
          _DetailItem(
            label: _CharacterDetailsStrings.type,
            value: character.type,
          ),
        ],
        _DetailItem(
          label: _CharacterDetailsStrings.gender,
          value: character.gender.displayText,
        ),
        _LocationInfo(
          label: _CharacterDetailsStrings.lastSeenAt,
          locationName: character.location.name,
        ),
        _LocationInfo(
          label: _CharacterDetailsStrings.firstSeenAt,
          locationName: character.origin.name,
        ),
      ],
    );
  }
}
