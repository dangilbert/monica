import 'package:get_it/get_it.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/model/life_event.dart';
import 'package:monica/core/data/repo/contacts_repo.dart';
import 'package:monica/core/data/repo/life_events_repo.dart';
import 'package:monica/core/networking/binary_result.dart';

class DashboardRepo {
  ContactsRepo _contactsRepo = GetIt.instance.get();
  LifeEventsRepo _lifeEventsRepo = GetIt.instance.get();
  Stream<List<Contact>> contacts;
  Stream<List<LifeEvent>> lifeEvents;

  DashboardRepo() {
    contacts = _contactsRepo.contacts;
    lifeEvents = _lifeEventsRepo.lifeEvents;
  }

  Future<BinaryResult<void>> fetchContacts() async {
    return await _contactsRepo.loadContacts();
  }

  Future<BinaryResult<void>> fetchLifeEvents() async {
    return await _lifeEventsRepo.loadLifeEvents();
  }
}
