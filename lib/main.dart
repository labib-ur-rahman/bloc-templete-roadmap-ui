import 'src/imports/core_imports.dart';
import 'src/imports/packages_imports.dart';
import 'src/app.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await EasyLocalization.ensureInitialized();

  try {
    await dotenv.load(fileName: '.env');
  } catch (error, stackTrace) {
    AppLogger.warning(
        'Missing .env file. Continuing with AppConfig fallbacks.');
    AppLogger.error('dotenv load failed during startup', error, stackTrace);
  }

  await AppConfig.init();

  runApp(
    const LocalizationWrapper(
      child: StateWrapper(
        child: App(),
      ),
    ),
  );
}
