import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: search(),
  ));
}

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  bool issearch = false;
  List temp = [];
  List l = [ "Vijay", "Suresh", "Sanjay", "Akshay", "Mahesh"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: issearch
          ? AppBar(
              leading: IconButton(
                  onPressed: () {
                    setState(() {
                      issearch = false;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 30,
                    color: Colors.black,
                  )),
              title: TextField(
                autofocus: true,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                onChanged: (value) {
                  temp.clear();
                  setState(() {
                    for (int i = 0; i < l.length; i++) {
                      if (l[i]
                          .toString()
                          .toLowerCase()
                          .contains(value.trim().toLowerCase())) {
                        temp.add(l[i]);
                      }
                    }
                  });
                },
              ),
              backgroundColor: Colors.yellowAccent,
            )
          : AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          issearch = true;
                        });
                      },
                      icon: Icon(
                        Icons.search,
                        size: 35,
                        color: Colors.black,
                      )),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert_rounded,
                      size: 30,
                      color: Colors.black,
                    ))
              ],
              title: Text(
                "Whatsapp",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              backgroundColor: Colors.green,
            ),
      body: issearch
          ? ListView.builder(
              itemCount: temp.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${temp[index]}"),
                );
              },
            )
          : ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "${l[index]}",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                );
              },
            ),
    );
  }
}
