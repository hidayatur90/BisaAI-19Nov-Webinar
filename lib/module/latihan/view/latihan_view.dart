import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/core.dart';
import '../controller/latihan_controller.dart';

class LatihanView extends StatefulWidget {
  var faker = Faker();
  LatihanView({Key? key}) : super(key: key);

  Widget build(context, LatihanController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Column"),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: 100,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            child: Person(
              avatarUrl: "https://picsum.photos/id/$index/200/300",
              name: faker.person.name(),
              chat: faker.lorem.sentence(),
            ),
          );
        },
      ),
    );
  }

  @override
  State<LatihanView> createState() => LatihanController();
}

class Person extends StatelessWidget {
  final avatarUrl;
  final name;
  final chat;
  const Person({Key? key, this.avatarUrl, this.name, this.chat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        backgroundImage: NetworkImage(avatarUrl),
      ),
      title: Text(name),
      subtitle: Text(
        chat,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
