import 'package:flutter/material.dart';
import 'package:netdemohomework/model/user.dart';
import 'package:netdemohomework/services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = '';

  void _apiPostList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response!),
        });
  }

  void _apiPostListId() {
    Network.GETID(Network.API_LIST_ID, Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiCreatePost() {
    Network.CREATE(Network.API_CREATE, Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiUpdate(User user) {
    Network.UPDATEID(
            Network.API_UPDATE + user.id.toString(), Network.paramsUpdate(user))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiDelete(User user) {
    Network.DELETEID(
            Network.API_DELETE + user.id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _showResponse(String response) {
    setState(() {
      data = response;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = User(id: 21, name: 'Komiljon', salary: '500000', age: '25');
    // _apiUpdate(post);
    // _apiDelete(post);
    // _apiPostListId();
    // _apiCreatePost();
    _apiDelete(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(data ?? "No Data"),
        ),
      ),
    );
  }
}
