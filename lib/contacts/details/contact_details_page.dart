import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monica/contacts/details/bloc/contact_details_bloc.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/i18n.dart';

@immutable
class ContactDetailsPageArgs {
  final int id;

  ContactDetailsPageArgs({@required this.id});
}

class ContactDetailsPage extends StatefulWidget {
  final int contactId;
  ContactDetailsPage({@required this.contactId, Key key}) : super(key: key);

  @override
  _ContactDetailsPageState createState() =>
      _ContactDetailsPageState(contactId: contactId);
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  final int contactId;
  ContactDetailsBloc _bloc;

  _ContactDetailsPageState({@required this.contactId}) {
    _bloc = ContactDetailsBloc(contactId: contactId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.viewState.contactState,
        builder: (context, contactState) {
          var loading = !contactState.hasData || contactState.data.loading;
          var contact = contactState.data?.contact;
          return Scaffold(
              appBar: AppBar(
                elevation:
                    defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
                title: Text(contact == null
                    ? I18n.of(context).appScreenContacts
                    : contact.firstName),
              ),
              body: Container(child: _content(loading, contact)));
        });
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  Widget _content(bool loading, Contact contact) {
    return _header(loading, contact);
  }

  Widget _header(bool loading, Contact contact) {
    return Column(
      children: <Widget>[
        CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 50.0,
            child: Center(
                child: loading
                    ? CircularProgressIndicator()
                    : Text("${contact.initials}",
                        style: Theme.of(context).textTheme.display1)))
      ],
    );
  }
}
