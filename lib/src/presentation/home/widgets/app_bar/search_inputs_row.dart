part of '../../base/home_page.dart';

class _SearchInputsRow extends StatelessWidget {
  const _SearchInputsRow({
    required this.nameController,
    required this.speciesController,
    required this.typeController,
    required this.nameFocusNode,
  });

  final TextEditingController nameController;
  final TextEditingController speciesController;
  final TextEditingController typeController;
  final FocusNode nameFocusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidthValues.spacing10xl,
      child: Row(
        spacing: WidthValues.spacingSm,
        children: [
          Expanded(
            child: _SearchInput(
              controller: nameController,
              hintText: _HomeStrings.nameHint,
              focusNode: nameFocusNode,
              onChanged: (value) {
                context.read<_HomeBloc>().add(_NameInputChanged(value));
              },
              onClear: () {
                nameController.clear();
                context.read<_HomeBloc>().add(const _NameInputChanged(''));
              },
            ),
          ),
          Expanded(
            child: _SearchInput(
              controller: speciesController,
              hintText: _HomeStrings.speciesHint,
              onChanged: (value) {
                context.read<_HomeBloc>().add(_SpeciesInputChanged(value));
              },
              onClear: () {
                speciesController.clear();
                context
                    .read<_HomeBloc>()
                    .add(const _SpeciesInputChanged(''));
              },
            ),
          ),
          Expanded(
            child: _SearchInput(
              controller: typeController,
              hintText: _HomeStrings.typeHint,
              onChanged: (value) {
                context.read<_HomeBloc>().add(_TypeInputChanged(value));
              },
              onClear: () {
                typeController.clear();
                context.read<_HomeBloc>().add(const _TypeInputChanged(''));
              },
            ),
          ),
        ],
      ),
    );
  }
}
