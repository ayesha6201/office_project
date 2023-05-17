import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:office_project/Model/product_model.dart';

class productDetail extends StatefulWidget {
  Products Item;

  productDetail(this.Item, {Key? key}) : super(key: key);

  @override
  State<productDetail> createState() => productDetailState();
}

class productDetailState extends State<productDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Product Details",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          CarouselSlider(
            options: CarouselOptions(height: 250.0),
            items: widget.Item.images!.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 50),
                      decoration: const BoxDecoration(color: Colors.grey),
                      child: Image.network(
                        i.toString(),
                        //widget.Item.images[i].toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.Item.title.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.Item.description.toString(),
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.8), fontSize: 13),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Category",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  widget.Item.category.toString(),
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.8), fontSize: 15),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Brand",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  widget.Item.brand.toString(),
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.8), fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Rating",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  widget.Item.rating.toString(),
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.8), fontSize: 15),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Discount",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  widget.Item.discountPercentage.toString(),
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.8), fontSize: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
