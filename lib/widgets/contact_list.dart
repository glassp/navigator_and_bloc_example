import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation.dart';
import '../repository/contact.dart';
import 'contact_details.dart';

/// A ListView of Contacts
class ContactListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ListView(
        children: [
          for (var contact in ContactRepository().getAllContacts())
            ListTile(
              onTap: () {
                // TODO trigger navigation
              },
              isThreeLine: true,
              leading: Icon(Icons.account_circle),
              title: Text(contact.fullName),
              subtitle: Text("${contact.phoneNumber}\n${contact.email}"),
            ),
        ],
      ),
    );
  }
}
