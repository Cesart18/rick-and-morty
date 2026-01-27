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
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _isSearching = false;

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
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (_isSearching) {
        _controller.forward();
        _focusNode.requestFocus();
      } else {
        _controller.reverse();
        _searchController.clear();
        _focusNode.unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorValues.bgPrimary(context),
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: 1.0 - _animation.value,
                    child: Opacity(
                      opacity: 1.0 - _animation.value,
                      child: child,
                    ),
                  ),
                );
              },
              child: GestureDetector(
                onTap: () => context.read<_HomeBloc>().add(
                  const _ScrollToTopRequested(),
                ),
                child: Text(
                  _HomeStrings.appBarTitle,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: ColorValues.textPrimary(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

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
                child: SizedBox(
                  height: 40,
                  child: CustomTextFormField(
                    key: ValueKey(_isSearching),
                    hintText: _HomeStrings.searchHint,
                    focusNode: _focusNode,
                    onChanged: (value) {
                      context.read<_HomeBloc>().add(
                        SearchFormInputChanged(
                          searchFormInput: SearchFormInput.dirty(value),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: _toggleSearch,
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              _isSearching ? Icons.close : Icons.search,
              key: ValueKey(_isSearching),
              color: ColorValues.primary,
            ),
          ),
        ),
        Sizer.gap(WidthValues.spacingSm),
      ],
    );
  }
}
