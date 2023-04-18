part of 'home.dart';

class HomeLogic extends ChangeNotifier {
  final BuildContext context;

  HomeLogic({required this.context}) {
    getCategory();
  }

  final CategoryApi service = CategoryApi.client(isLoading: false);

  List<Category> dataCategory = [];

  void getCategory() async {
    await service.getCategory().then((value) => dataCategory = value);
    notifyListeners();
  }
}
