import 'package:api_call/services/remote_services.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APi'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Card(
            
  shape: BeveledRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
              margin: EdgeInsets.all(20),
              shadowColor: Color.fromARGB(255, 240, 7, 7),
              color: Color.fromARGB(255, 72, 173, 50),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      posts![index].name,
                      style:  const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amber),
                    ),
                    Text(
                      posts![index].email,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 81, 7, 255)),
                    ),
                    Text(
                      posts![index].phone,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 15, 255, 7)),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 85, 7, 255),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        posts![index].website,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.amber),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
