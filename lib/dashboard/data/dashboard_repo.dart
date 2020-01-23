

import 'package:get_it/get_it.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/repo/contacts_repo.dart';
import 'package:monica/core/networking/binary_result.dart';

class DashboardRepo {

  ContactsRepo _contactsRepo = GetIt.instance.get();
  Stream<List<Contact>> contacts;

  DashboardRepo() {
    contacts = _contactsRepo.contacts;
  }

  Future<BinaryResult<void>> fetchContacts() async {
    return await _contactsRepo.loadContacts();
  }

}