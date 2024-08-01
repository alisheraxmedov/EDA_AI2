import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavialable/config/route/route.dart';
import 'package:unavialable/config/theme/theme.dart';
import 'package:unavialable/generated/codegen_loader.g.dart';
import 'package:unavialable/presentation/provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', "US"),
        Locale('ru', "RU"),
        Locale('uz', "UZ"),
      ],
      assetLoader: const CodegenLoader(),
      path: 'assets/translations/',
      // fallbackLocale: const Locale('uz', "UZ"),
      startLocale: const Locale('uz', "UZ"),
      // saveLocale: true,
      child: const MainWidget(),
    ),
  );
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderClass>(
          create: (_) => ProviderClass(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeDataClass.lightTeme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}

// import 'dart:io';

// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:unavialable/presentation/const/var.dart';

// void main() async {
//   // Access your API key as an environment variable (see "Set up your API key" above)
//   // final apiKey = Platform.environment['AIzaSyBYYs2cQB-5iIj4DS017NJTOa9lB5c0YOM'];
//   // if (apiKey == null) {
//   //   print('No \$API_KEY environment variable');
//   //   exit(1);
//   // }
//   // The Gemini 1.5 models are versatile and work with both text-only and multimodal prompts
//   final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: "AIzaSyBYYs2cQB-5iIj4DS017NJTOa9lB5c0YOM");
//   final content = [Content.text('Write a story about a magic backpack.')];
//   final response = await model.generateContent(content);
//   print(response.text);
// }
