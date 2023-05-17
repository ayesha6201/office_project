import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:office_project/screens/product_details.dart';

import '../Model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Products> Product = [];
  ScrollController scrollController = ScrollController();
  bool loading = true;
  int offset = 0;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    fetchData(offset);
    handleNext();
  }

  Future<void> fetchData(paraOffset) async {
    print(paraOffset);
    var response = await http.get(Uri.parse(
        "https://dummyjson.com/products?offset=${paraOffset}&limit=10"));
    ProductModel productModel =
        ProductModel.fromJson(json.decode(response.body));
    Product = Product + productModel.products!;
    int localOffset = offset + 10;

    setState(() {
      loading = false;

      offset = localOffset;
    });
  }

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        setState(() {
          isLoadingMore = true;
        });
        offset = offset + 10;
        await fetchData(offset);
        setState(() {
          isLoadingMore = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Products'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const SizedBox(
                    width: 215,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "See all",
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.5), fontSize: 13),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.withOpacity(0.5),
                    size: 15,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemExtent: 100,
                  controller: scrollController,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount:
                      isLoadingMore ? Product.length + 10 : Product.length,
                  itemBuilder: (context, index) {
                    if (index < Product.length) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      productDetail(Product[index])));
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.zero,
                            child: Container(
                                height: 330,
                                width: 100,
                                child: Row(children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        Product[index].thumbnail!.toString(),
                                        fit: BoxFit.fill,
                                        height: 100,
                                        width: 150,
                                      )),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Product[index].title!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ]),
                                  )
                                ]))),
                      );
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      ));
                    }
                  }),
            ),
          ],
        ));
  }
}
