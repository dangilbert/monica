import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/request/contacts_request.dart';

class FakeContactsRequest extends ContactsRequest {

  BinaryResult<List<Contact>> nextResult = BinaryResult.success(value: []);

  @override
  Future<BinaryResult<List<Contact>>> getContacts() async {
    return nextResult;
  }
}
