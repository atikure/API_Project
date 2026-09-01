import 'package:api_project/view/custom_widget/text.dart';
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
        backgroundColor: Colors.blueGrey,
        title: CustomText(text: "Book - ${b.length}",fSize: 25,fWeight: FontWeight.bold,),
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu_book, size: 20),
                    CustomText(
                      text: "# ${b[index]["id"]}",
                      fSize: 18,
                      fWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                CustomText(
                  text: "${b[index]["title"]}",
                  maxLine: 2,
                  tOverflow: TextOverflow.ellipsis,
                  fSize: 18,
                  fWeight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.description, size: 20),
                    SizedBox(width: 5),
                    CustomText(
                      text: "${b[index]["pageCount"]}",
                      fSize: 18,
                      fWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.person_2_outlined, size: 20),
                    SizedBox(width: 5),
                    Expanded(
                      child: CustomText(
                        text: "${b[index]["authors"]}",
                        tOverflow: TextOverflow.ellipsis,
                        maxLine: 1,
                        fSize: 18,
                        fWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: CustomText(
                      text: "View More",
                      color: Colors.black87,
                      fSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}