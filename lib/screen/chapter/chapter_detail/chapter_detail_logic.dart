part of 'chapter_detail.dart';

class ChapterDetailLogic extends ChangeNotifier {
  final BuildContext context;

  ChapterDetailLogic({required this.context}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      List<ChapterModel> agr =
          ModalRoute.of(context)!.settings.arguments as List<ChapterModel>;
      getChapterDetail(agr.first.id.toString());
    });
  }

  final CategoryApi service = CategoryApi.client(isLoading: false);

  ChapterIDModel? data;

  bool dark = false;

  void getChapterDetail(String id) async {
    try {
      await service.getChaptersID(id).then((value) {
        data = value;
        // print(data.id);
        notifyListeners();
      });
    } catch (e) {
      debugPrint('$e');
    }
  }

  double count = 18;

  void tang() {
    count++;
    notifyListeners();
  }

  void changDark() {
    dark = !dark;
    notifyListeners();
  }

  void giam() {
    count--;
    notifyListeners();
  }
}
