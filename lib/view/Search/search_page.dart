import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/search_screenCntrl.dart';
import '../widget/newsCard.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    TextEditingController textController = TextEditingController();
    SearchSreenController provider =
        Provider.of<SearchSreenController>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * .1,
        title: Container(
          padding: EdgeInsets.only(left: 10),
          height: 45,
          width: width * .75,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1)),
          child: Center(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "Search Here",
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                fillColor: Colors.white,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              provider.searchData(
                  searchText: textController.text.toLowerCase());
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Text(
              "Search",
              style: TextStyle(color: Colors.red),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black54)),
          ),
          SizedBox(
            width: 10,
          )
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(
                //   height: 45,
                //   width: MediaQuery.sizeOf(context).width * 2 / 3,
                //   child: TextField(
                //     controller: textController,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10),
                //           borderSide: const BorderSide(
                //               color: Colors.black54, width: 3)),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                // Expanded(
                //   child: ElevatedButton(
                //     onPressed: () {
                //       provider.searchData(
                //           searchText: textController.text.toLowerCase());
                //       FocusManager.instance.primaryFocus?.unfocus();
                //     },
                //     child: Text(
                //       "Search",
                //       style: TextStyle(color: Colors.red),
                //     ),
                //     style: ButtonStyle(
                //         backgroundColor:
                //             MaterialStatePropertyAll(Colors.black54)),
                //   ),
                // )
              ],
            ),
            Expanded(
              child: Provider.of<SearchSreenController>(context, listen: false)
                          .isLoading ==
                      true
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      itemBuilder: (context, index) => NewsCard(
                          title: provider.newsDataModel?.articles?[index].title ??
                              "",
                          description: provider.newsDataModel?.articles?[index]
                                  .description ??
                              "",
                          date: provider
                              .newsDataModel?.articles?[index].publishedAt,
                          imageUrl:
                              provider.newsDataModel?.articles?[index].urlToImage ?? "",
                          contant: provider.newsDataModel?.articles?[index].content ?? "",
                          sourceName: provider.newsDataModel?.articles?[index].source?.name ?? "",
                          url: provider.newsDataModel?.articles?[index].url ?? ""),
                      separatorBuilder: (context, index) => const Divider(height: 20),
                      itemCount: provider.newsDataModel?.articles?.length ?? 0),
            )
          ],
        ),
      )),
    );
  }
}
