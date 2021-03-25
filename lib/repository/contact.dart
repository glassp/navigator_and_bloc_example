import 'package:navigator_and_bloc_example/models/contact.dart';

/// This class is a over simplified class which only returns a list of Contacts
/// Normally it should read from an API, database or something like that
/// but of the sake of simplicity this is not needed.
class ContactRepository {
  List<Contact> getAllContacts() => <Contact>[
    Contact("Cercei", "Lannister", "(322) 299-6063", "cercei@lannister.westeros"),
    Contact("Jaime", "Lannister", "(874) 986-5356", "jaime@lannister.westeros"),
    Contact("Deanerys", "Targaryen", "(500) 495-7082", "deanerys@targaryen.westeros"),
    Contact("Jon", "Snow", "(359) 857-2873", "jon.snow@nights-watch.westeros"),
    Contact("Sansa", "Stark", "(264) 235-0864", "sansa.stark@gmail.com"),
  ];


}