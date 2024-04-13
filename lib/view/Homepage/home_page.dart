import 'package:flutter/material.dart';
import 'package:news_now/view/Search/search_page.dart';

import 'package:provider/provider.dart';

import '../../controller/home_screeCntrl.dart';
import '../widget/newsCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    HomeScreenController provider = Provider.of<HomeScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News Now",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
               color: Colors.red),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchPage()));
            },
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            splashColor: Colors.redAccent,
          ),
          SizedBox(width: 10,)
        ],
        toolbarHeight: height * .1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
      body: Provider.of<HomeScreenController>(context).isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                  itemBuilder: (context, index) => NewsCard(
                        title: provider.newsModel.articles?[index].title
                                .toString() ??
                            "",
                        description: provider
                                .newsModel.articles?[index].description
                                .toString() ??
                            "",
                        date: provider.newsModel.articles?[index].publishedAt,
                        imageUrl: provider.newsModel.articles?[index].urlToImage
                                .toString() ??
                            "",
                        contant: provider.newsModel.articles?[index].content
                                .toString() ??
                            "",
                        sourceName: provider
                                .newsModel.articles?[index].source?.name
                                .toString() ??
                            "",
                        url: provider.newsModel.articles?[index].url
                                .toString() ??
                            "",
                      ),
                  separatorBuilder: (context, index) => const Divider(
                        height: 20,
                      ),
                  itemCount: provider.newsModel.articles?.length ?? 0),
            ),
    );
  }
}
