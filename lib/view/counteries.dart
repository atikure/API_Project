import 'package:api_project/service/counteries.dart';
import 'package:api_project/view/custom_widget/text.dart';
import 'package:flutter/material.dart';

class Countries extends StatefulWidget {
  const Countries({super.key});

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  List cl = [];

  getData() async {
    var a = await CountriesService().getCountries();
    cl.clear();
    cl.addAll(a);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Countries - ${cl.length}"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              getData();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cl.length,
        itemBuilder: (c, i) => ListTile(
          title: Text("${cl[i]["name"]}"),
          subtitle: Text("${cl[i]["admissionDateUnitedNations"]}"),
        ),
      ),
    );
  }
}
