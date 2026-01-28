part of '../base/character_details_page.dart';

class _LocationInfo extends StatelessWidget {
  const _LocationInfo({required this.label, required this.locationName});

  final String label;
  final String locationName;

  @override
  Widget build(BuildContext context) {
    final displayName = locationName.isEmpty
        ? _CharacterDetailsStrings.unknownLocation
        : locationName;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(WidthValues.spacingXl),
      decoration: BoxDecoration(
        color: ColorValues.bgSecondary(context),
        borderRadius: BorderRadius.circular(WidthValues.radiusMd),
        border: Border.all(color: ColorValues.borderSecondary(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: ColorValues.textSecondary(context),
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            displayName,
            style: context.textTheme.bodyLarge?.copyWith(
              color: ColorValues.textPrimary(context),
            ),
          ),
        ],
      ),
    );
  }
}
