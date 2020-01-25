import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading/indicator/line_scale_indicator.dart';
import 'package:loading/loading.dart';
import 'package:monica/contacts/bloc/contacts_bloc.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/i18n.dart';

class ContactsPage extends StatefulWidget {
  ContactsPage({Key key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  ContactsBloc _bloc = ContactsBloc();

  @override
  Widget build(BuildContext context) {
    List<Widget> slivers = [_contactsList()];

    return Container(
        child: CustomScrollView(
      slivers: slivers,
    ));
  }

  Widget _contactsList() {
    return StreamBuilder(
      stream: _bloc.viewState.contactsState,
      builder: (context, contactsState) {
        ContactsState state = contactsState.data;
        List<Widget> items;
        if (!contactsState.hasData) {
          items = [
            Container(
                child: Center(
                    child:
                        Loading(indicator: LineScaleIndicator(), size: 40.0)))
          ];
        } else {
          items = state.contacts.map<Widget>((contact) {
            var birthdate = contact.information.dates.birthdate;
            var formattedDate = birthdate.date != null
                ? birthdate.isYearUnknown
                    ? DateFormat.Md(
                            Localizations.localeOf(context).languageCode)
                        .format(birthdate.date)
                    : DateFormat.yMd(
                            Localizations.localeOf(context).languageCode)
                        .format(birthdate.date)
                : I18n.of(context).contactUnknownBirthdate;
            return InkWell(
                // When the user taps the button, show a snackbar.
                onTap: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Tap'),
                  ));
                },
                child: ListTile(
                  leading: _contactIcon(contact),
                  title: Text("${contact.firstName} ${contact.lastName}"),
                  subtitle: Text("🎂 $formattedDate"),
                ));
          }).toList();
        }
        return SliverList(
          delegate: SliverChildListDelegate(items),
        );
      },
    );
  }

  Widget _contactIcon(Contact contact) {
    return CircleAvatar(
        backgroundColor: Colors.blue,
        child: Center(
            child: Text("${contact.initials}",
                style: Theme.of(context).textTheme.body1)));
  }
}
