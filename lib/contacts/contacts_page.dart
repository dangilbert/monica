import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:monica/contacts/contacts_bloc.dart';
import 'package:monica/contacts/details/contact_details_page.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/i18n.dart';
import 'package:monica/service/navigation_service.dart';

class ContactsPage extends StatefulWidget {
  ContactsPage({Key key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  // TODO inject this bloc
  ContactsBloc _bloc = ContactsBloc();
  NavigationService _navigationService = GetIt.instance.get();

  @override
  Widget build(BuildContext context) {
    List<Widget> slivers = [_contactsList()];

    return Container(
        child: RefreshIndicator(
            onRefresh: () async {
              _bloc.handleAction(RefreshViewAction());
            },
            child: CustomScrollView(
              slivers: slivers,
            )));
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
                    child: SizedBox(
                        height: 50.0,
                        child: LoadingIndicator(
                          indicatorType: Indicator.orbit,
                          color: Theme.of(context).accentColor,
                        ))))
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
                  _navigationService.navigateTo(Routes.contactDetails,
                      arguments: ContactDetailsPageArgs(id: contact.id));
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
