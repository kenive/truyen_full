import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import 'package:truyen_full/model/chapter/chapter_id.dart';
import 'package:truyen_full/themes/colors.dart';
import 'package:tuple/tuple.dart';

import '../../../model/chapter/chapter.dart';
import '../../../service/category/category_api.dart';

part 'chapter_detail_logic.dart';

class ChapterDetail extends StatefulWidget {
  const ChapterDetail({super.key});

  @override
  State<ChapterDetail> createState() => _ChapterDetailState();
}

class _ChapterDetailState extends State<ChapterDetail> {
  late ChapterDetailLogic logic;
  @override
  void initState() {
    super.initState();
    logic = ChapterDetailLogic(context: context);
  }

  List<ChapterModel> get agr =>
      ModalRoute.of(context)!.settings.arguments as List<ChapterModel>;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: logic,
      child: Selector<ChapterDetailLogic, Tuple2<ChapterIDModel?, bool>>(
        selector: (p0, p1) => Tuple2(p1.data, p1.dark),
        builder: (context, value, child) {
          if (value.item1 == null) {
            return const Scaffold();
          }
          return Scaffold(
            backgroundColor:
                value.item2 ? AppColors.black : AppColors.backgroundColor,
            appBar: AppBar(
                backgroundColor: AppColors.green,
                title: Text(value.item1!.header),
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: Container(
                      color: AppColors.green,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  logic.changDark();
                                },
                                icon: Icon(
                                  Icons.dark_mode,
                                  color: value.item2
                                      ? AppColors.white
                                      : AppColors.black,
                                )),
                            IconButton(
                                onPressed: () {
                                  logic.tang();
                                },
                                icon: const Icon(Icons.add)),
                            IconButton(
                                onPressed: () {
                                  logic.giam();
                                },
                                icon: const Icon(Icons.remove))
                          ]),
                    ))),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    value.item1!.header,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: value.item2 ? AppColors.white : AppColors.black,
                    ),
                  ),
                  Selector<ChapterDetailLogic, double>(
                    selector: (p0, p1) => p1.count,
                    builder: (context, val, child) {
                      return Html(
                        data: value.item1!.body.first,
                        style: {
                          '*': Style(
                            color:
                                value.item2 ? AppColors.white : AppColors.black,
                            fontSize: FontSize(val),
                          )
                        },
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (value.item1!.id != agr.first.id) {
                              int page = --value.item1!.id;
                              logic.getChapterDetail(page.toString());
                            }
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color:
                                value.item2 ? AppColors.white : AppColors.black,
                          )),
                      Expanded(
                          child: Text(
                        value.item1!.header,
                        style: TextStyle(
                          color:
                              value.item2 ? AppColors.white : AppColors.black,
                        ),
                      )),
                      IconButton(
                          onPressed: () {
                            if (value.item1!.id != agr.last.id) {
                              int page = ++value.item1!.id;
                              logic.getChapterDetail(page.toString());
                            }
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color:
                                value.item2 ? AppColors.white : AppColors.black,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
