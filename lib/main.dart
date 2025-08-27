import 'package:flutter/material.dart';
import 'package:simple_beautiful_checklist_exercise/data/database_repository.dart';
import 'package:simple_beautiful_checklist_exercise/data/mock_database_repository.dart';
import 'package:simple_beautiful_checklist_exercise/src/app.dart';
import 'package:simple_beautiful_checklist_exercise/data/sharedprefences_repository.dart';

void main() async {
  // Wird benötigt, um auf SharedPreferences zuzugreifen
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Hier statt MockDatabaseRepository() ein SharedPreferencesRepository() verwenden.
final sharedPrefsRepo = SharedprefencesRepository();
await sharedPrefsRepo.initializePersistence();
runApp(App(repository: sharedPrefsRepo));
}
