part of '../base/character_details_page.dart';

class _DetailItem extends StatelessWidget {
  const _DetailItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: context.textTheme.bodyLarge?.copyWith(
            color: ColorValues.textSecondary(context),
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: context.textTheme.bodyLarge?.copyWith(
              color: ColorValues.textPrimary(context),
            ),
          ),
        ),
      ],
    );
  }
}
