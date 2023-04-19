part of 'home.dart';

class HomeLogic extends ChangeNotifier {
  final BuildContext context;

  HomeLogic({required this.context}) {
    getCategory();
  }

  final CategoryApi service = CategoryApi.client(isLoading: true);

  List<Category> dataCategory = [];

  void getCategory() async {
    try {
      await service.getCategory().then((value) => dataCategory = value);

      notifyListeners();
    } catch (e) {
      debugPrint('$e');
    }
    notifyListeners();
  }
}
