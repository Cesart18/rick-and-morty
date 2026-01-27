import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rick_and_morty/app.dart';
import 'package:rick_and_morty/config.dart';
import 'package:rick_and_morty/core/http/http_manager.dart';
import 'package:rick_and_morty/src/infrastructure/data_sources/character_api/character_api_rest.dart';
import 'package:rick_and_morty/src/infrastructure/infrastructure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  final httpClient = HttpManager.simple(baseUrl: dotenv.env['API_URL'] ?? '');

  runApp(
    App(
      config: Config(
        characterRepository: CharacterRepository(
          characterApi: CharacterApiRest(client: httpClient),
        ),
      ),
    ),
  );
}
