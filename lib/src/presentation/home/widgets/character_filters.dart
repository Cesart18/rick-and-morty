part of '../base/home_page.dart';

class _CharacterFilters extends StatelessWidget {
  const _CharacterFilters();

  @override
  Widget build(BuildContext context) {
    final homeState = context.watch<_HomeBloc>().state;
    final selectedStatus = homeState.selectedStatus;
    final selectedGender = homeState.selectedGender;
    return Row(
      spacing: WidthValues.spacingMd,
      children: [
        Expanded(
          child: CustomDropdown<CharacterStatus>(
            items: CharacterStatus.values,
            value: selectedStatus,
            hintText: _HomeStrings.status,
            showAllOption: true,
            allOptionLabel: _HomeStrings.allStatus,
            itemLabelBuilder: (status) => status.displayText,
            onChanged: (value) {
              context.read<_HomeBloc>().add(_StatusSelected(status: value));
            },
          ),
        ),
        Expanded(
          child: CustomDropdown<CharacterGender>(
            items: CharacterGender.values,
            value: selectedGender,
            hintText: _HomeStrings.gender,
            showAllOption: true,
            allOptionLabel: _HomeStrings.allGender,
            itemLabelBuilder: (gender) => gender.displayText,
            onChanged: (value) {
              context.read<_HomeBloc>().add(_GenderSelected(gender: value));
            },
          ),
        ),
      ],
    );
  }
}
