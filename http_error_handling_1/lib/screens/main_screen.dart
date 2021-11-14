import 'package:flutter/material.dart';
import 'package:http_error_handling_1/controller/user_controller.dart';
import 'package:http_error_handling_1/models/user.dart';
import 'package:http_error_handling_1/repository/jsonplaceholder_repository.dart';

class MainScreen extends StatelessWidget {
  static const routName = '/';
  var controller = UserController(JsonplaceholderRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Samlple Code'),
      ),
      body: FutureBuilder<List<User>>(
        future: controller.fetchUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              var user = snapshot.data?[index] as User;
              return ListTile(
                leading: Text(user.id.toString()),
                title: Text(user.name.toString()),
                subtitle: Text(user.email.toString()),
                trailing: Text(user.website.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
