import 'package:flutter/material.dart';

import '../service/book_list.dart';

class BookScreen extends StatefulWidget {
  BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {

  List b = [];

  getBookList() async {
    var a = await BookService().getBookList();
    b.clear();
    b.addAll(a);
    setState(() {});
  }

  @override
  void initState() {
    getBookList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Book"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.1,
        ),
        itemCount: b.length,
        itemBuilder: (context, index) => Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu_book, size: 20),
                    // Icon(Icons.menu_book, size: 20),
                    Text(
                      "# ${b[index]["id"]}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "${b[index]["title"]}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.description, size: 20),
                    SizedBox(width: 5),
                    Text(
                      "${b[index]["pageCount"]}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.person_2_outlined, size: 20),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        "${b[index]["authors"]}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text(
                        "View More",
                        style: TextStyle(color: Colors.black87, fontSize: 12),
                      ),)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}