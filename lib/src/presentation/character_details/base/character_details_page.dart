import 'package:rick_and_morty/core/ui.dart';
import 'package:rick_and_morty/src/domain/domain.dart';

part '../constants/character_details_strings.dart';
part '../widgets/character_image.dart';
part '../widgets/character_info.dart';
part '../widgets/detail_item.dart';
part '../widgets/location_info.dart';
part 'character_details_body.dart';

/// {@template character_details_page}
/// Page that displays detailed information about a character
/// {@endtemplate}
class CharacterDetailsPage extends StatelessWidget {
  /// {@macro character_details_page}
  const CharacterDetailsPage({required this.character, super.key});

  final Character character;

  /// The path name of CharacterDetailsPage. Use for navigation.
  static const path = '/$routeName/:id';

  /// The route name of CharacterDetailsPage. Use to navigate
  /// with named routes.
  static const routeName = 'character-details';

  static Future<void> navigateTo(
    BuildContext context, {
    required Character character,
  }) async {
    await context.push('/$routeName/${character.id}', extra: character);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorValues.bgPrimary(context),
        elevation: 0,
      ),
      body: _CharacterDetailsBody(character: character),
    );
  }
}
