part of '../../base/home_page.dart';

class _CharacterInfo extends StatelessWidget {
  const _CharacterInfo({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: WidthValues.spacingXs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: WidthValues.spacingXxs,
        children: [
          Text(
            character.name,
            style: context.appTextStyles.cardTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            spacing: WidthValues.spacingXs,
            children: [
              Text(
                character.gender.displayText,
                style: context.appTextStyles.textXs,
              ),

              Text('-', style: context.appTextStyles.textXs),

              Expanded(
                child: Text(
                  character.species,
                  style: context.appTextStyles.textXs,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            spacing: WidthValues.spacingXs,
            children: [
              Icon(
                Icons.location_on,
                size: TextValues.textXs,
                color: ColorValues.textPrimary(context),
              ),

              Expanded(
                child: Text(
                  character.location.name,
                  style: context.appTextStyles.textXs,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
