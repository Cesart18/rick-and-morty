part of '../base/home_page.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  final FocusNode _nameFocusNode = FocusNode();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    _nameFocusNode.dispose();
    _nameController.dispose();
    _speciesController.dispose();
    _typeController.dispose();
    super.dispose();
  }

  void _onSearchStateChanged(bool isSearchViewActive) {
    if (isSearchViewActive) {
      final homeState = context.read<_HomeBloc>().state;
      _nameController.text = homeState.nameInput;
      _speciesController.text = homeState.speciesInput;
      _typeController.text = homeState.typeInput;

      _controller.forward();
      _nameFocusNode.requestFocus();
    } else {
      _controller.reverse();
      _nameFocusNode.unfocus();
    }
  }

  void _toggleSearch() {
    context.read<_HomeBloc>().add(const _SearchViewToggled());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<_HomeBloc, _HomeState>(
      listenWhen: (previous, current) =>
          previous.isSearchViewActive != current.isSearchViewActive,
      listener: (context, state) =>
          _onSearchStateChanged(state.isSearchViewActive),
      child: AppBar(
        backgroundColor: ColorValues.bgPrimary(context),
        elevation: 0,
        titleSpacing: 0,
        foregroundColor: ColorValues.textPrimary(context),
        surfaceTintColor: ColorValues.bgPrimary(context),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: WidthValues.spacingXl),
          child: Row(
            children: [
              _AppBarTitle(animation: _animation),
              Expanded(
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return ClipRect(
                      child: Align(
                        alignment: Alignment.centerRight,
                        widthFactor: _animation.value,
                        child: Opacity(opacity: _animation.value, child: child),
                      ),
                    );
                  },
                  child: _SearchInputsRow(
                    nameController: _nameController,
                    speciesController: _speciesController,
                    typeController: _typeController,
                    nameFocusNode: _nameFocusNode,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          _AppBarSearchToggle(onPressed: _toggleSearch),
          Sizer.gap(WidthValues.spacingSm),
        ],
      ),
    );
  }
}
