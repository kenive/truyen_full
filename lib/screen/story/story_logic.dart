part of 'story.dart';

class StoryLogic extends ChangeNotifier {
  final BuildContext context;

  StoryLogic({required this.context}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Category arg = ModalRoute.of(context)!.settings.arguments as Category;

      getStory(arg.id.toString());
    });
  }

  final CategoryApi service = CategoryApi.client(isLoading: false);

  List<StoryModel> data = [];

  // List<String> data = [];

  void getStory(String id) async {
    try {
      await service.getStory(id).then((value) => data = value);
      notifyListeners();
    } catch (e) {
      debugPrint('$e');
    }
  }
}
