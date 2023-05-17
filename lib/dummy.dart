// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => HomeScreenState();
// }
//
// class HomeScreenState extends State<HomeScreen> {
//   final _baseUrl = "https://dummyjson.com/products";
//   int _page = 0;
//
//   final int _limit = 10;
//
//   bool _isFirstLoadRunning = false;
//   bool hasNextPage = true;
//
//   bool _isLoadMoreRunning = false;
//
//   List product = [];
//
//   void _loadMore() async {
//     if (hasNextPage == true &&
//         _isFirstLoadRunning == false &&
//         _isLoadMoreRunning == false &&
//         _controller.position.extentAfter < 300) {
//       setState(() {
//         _isLoadMoreRunning = true; //Display progress indicator at the bottom
//       });
//
//       _page += 1; //increase page by 1
//
//       try {
//         final res =
//         await http.get(Uri.parse("$_baseUrl")); //?_page=$_page&_limit=$_limit
//         final List fetchedPosts = json.decode(res.body);
//         print(fetchedPosts);
//         if (fetchedPosts.isNotEmpty) {
//           setState(() {
//             product.addAll(fetchedPosts);
//           });
//         } else {
//           setState(() {
//             hasNextPage = false;
//           });
//         }
//       } catch (err) {
//         if (kDebugMode) {
//           print('Something went wrong');
//         }
//       }
//
//       setState(() {
//         _isLoadMoreRunning = false;
//       });
//     }
//   }
//
//   void _firstLoad() async {
//     setState(() {
//       _isFirstLoadRunning = true;
//     });
//     try {
//       final res =
//       await http.get(Uri.parse("$_baseUrl"));//?_page=$_page&_limit=$_limit
//
//       setState(() {
//         product = json.decode(res.body) as List;
//         print(product);
//       });
//     } catch (err) {
//       if (kDebugMode) {
//         print('Something went wrong');
//       }
//     }
//     setState(() {
//       _isFirstLoadRunning = false;
//     });
//   }
//
//   late ScrollController _controller;
//
//   @override
//   void initState() {
//     _firstLoad();
//     _controller = ScrollController()..addListener(_loadMore);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           backgroundColor: Colors.black87,
//           title: Text(
//             'Products',
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//         body: _isFirstLoadRunning
//             ? const Center(
//           child: CircularProgressIndicator(),
//         )
//             : Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Popular',style: TextStyle(fontSize: 18,color: Colors.white),),SizedBox(width: 210,),
//                   Text('See all',style: TextStyle(fontSize: 15,color: Colors.grey.withOpacity(0.5)),),
//                   Icon(Icons.arrow_forward_ios,size: 15,color: Colors.grey.withOpacity(0.5),)
//                 ],
//               ),
//             ),
//
//             Expanded(
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     itemCount: product.length,
//                     controller: _controller,
//                     itemBuilder: (context, index) => Card(
//                       child: ListTile(
//                         leading: Image.network(product[index]['images'],),
//                         title: Text(product[index]['title'],style: TextStyle(color: Colors.white),),
//                       ),
//                     ))),
//             if (_isLoadMoreRunning == true)
//               const Padding(
//                 padding: EdgeInsets.only(top: 10, bottom: 40),
//                 child: Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               ),
//             if (hasNextPage == false)
//               Container(
//                 padding: const EdgeInsets.only(top: 30, bottom: 40),
//                 color: Colors.amber,
//                 child: const Center(
//                   child: Text('You have fetched all of the content'),
//                 ),
//               )
//           ],
//         ));
//   }
// }
