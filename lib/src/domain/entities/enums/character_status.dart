import 'package:rick_and_morty/core/ui.dart';

enum CharacterStatus {
  alive,
  dead,
  unknown;

  bool get isAlive => this == CharacterStatus.alive;
  bool get isDead => this == CharacterStatus.dead;
  bool get isUnknown => this == CharacterStatus.unknown;
}

extension CharacterStatusExtension on CharacterStatus {
  Color color(BuildContext context) => switch (this) {
    CharacterStatus.alive => ColorValues.borderSuccess(context),
    CharacterStatus.dead => ColorValues.borderError(context),
    CharacterStatus.unknown => ColorValues.bgQuaternary(context),
  };

  String get displayText => name.capitalize;

  Color textColor(BuildContext context) => switch (this) {
    CharacterStatus.alive => ColorValues.bgPrimary(context),
    CharacterStatus.dead => ColorValues.bgPrimary(context),
    CharacterStatus.unknown => ColorValues.textPrimary(context),
  };
}
