import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/contact.dart';

/// The DetailView for the Contact.
class ContactDetailView extends StatelessWidget {
  final Contact contact;

  ContactDetailView(this.contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.fullName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 50),),
          Icon(Icons.account_circle, size: 200,),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${contact.lastName}, ',
                      style: Theme.of(context).textTheme.headline3!),
                  Text(contact.firstName,
                      style: Theme.of(context).textTheme.headline4!),
                ],
              ),
            ),
          ),
          Text(contact.phoneNumber,
              style: Theme.of(context).textTheme.headline5!),
          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          Text(contact.email, style: Theme.of(context).textTheme.headline5!),
          Padding(padding: EdgeInsets.symmetric(vertical: 30)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                label:
                    Text("Call", style: Theme.of(context).textTheme.headline6!),
                icon: Icon(Icons.call),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
              ElevatedButton.icon(
                onPressed: () {},
                label:
                    Text("Mail", style: Theme.of(context).textTheme.headline6!),
                icon: Icon(Icons.mail),
              ),
            ],
          ),
        ],
      ),
    );
  }
}