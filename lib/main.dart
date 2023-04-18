import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truyen_full/screen/chapter/chapter_detail/chapter_detail.dart';
import 'package:truyen_full/screen/chapter/chapter_ui.dart';
import 'package:truyen_full/screen/home/home.dart';
import 'package:truyen_full/screen/story/story.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeLogic(context: context)),
        ChangeNotifierProvider(create: (_) => StoryLogic(context: context)),
        ChangeNotifierProvider(create: (_) => ChapterLogic(context: context)),
        ChangeNotifierProvider(
            create: (_) => ChapterDetailLogic(context: context)),
      ],
      child: MaterialApp(
        title: 'Truyện Full',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/story': (context) => const ListStory(),
          '/chapter': (context) => const ChapTerUI(),
          '/chapterDetail': (context) => const ChapterDetail()
        },
      ),
    );
  }
}
