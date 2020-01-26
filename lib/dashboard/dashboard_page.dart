import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get_it/get_it.dart';
import 'package:loading/indicator/line_scale_indicator.dart';
import 'package:loading/loading.dart';
import 'package:monica/contacts/details/contact_details_page.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/model/life_event.dart';
import 'package:monica/dashboard/bloc/dashboard_bloc.dart';
import 'package:monica/i18n.dart';
import 'package:intl/intl.dart';
import 'package:monica/service/navigation_service.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardBloc _bloc = DashboardBloc();
  NavigationService _navigationService = GetIt.instance.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> slivers = [
      _sectionHeader(
          child: Text(
        I18n.of(context).dashboardSummary,
        style: Theme.of(context).textTheme.display1,
      )),
      _summaryItem(),
      _sectionHeader(
          child: Text(
        I18n.of(context).dashboardRecentContacts,
        style: Theme.of(context).textTheme.display1,
      )),
      _recentContactsItem(),
      _sectionHeader(
          child: Text(
        I18n.of(context).dashboardUpcomingEvents,
        style: Theme.of(context).textTheme.display1,
      )),
      _eventsItem(),
    ];

    return Container(
        child: CustomScrollView(
      slivers: slivers,
    ));
  }

  Widget _sectionHeader({@required Widget child}) {
    return SliverStickyHeader(header: child);
  }

  Widget _summaryItem() {
    return StreamBuilder(
        stream: _bloc.viewState.summary,
        builder: (context, summary) {
          DashboardSummary summaryData = summary.data;

          if (!summary.hasData || summaryData.loading) {
            return SliverToBoxAdapter(
              child: Container(
                  child: Center(
                      child: Loading(
                          indicator: LineScaleIndicator(), size: 40.0))),
            );
          }

          return SliverGrid.count(
              crossAxisCount: 3, children: _summaryItems(summaryData));
        });
  }

  List<Widget> _summaryItems(DashboardSummary summaryData) {
    return [
      Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "${summaryData.contactsCount}",
              style: Theme.of(context).textTheme.display3,
            ),
            Text("Contacts"),
          ],
        ),
      ),
      Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "${summaryData.activitiesCount}",
              style: Theme.of(context).textTheme.display3,
            ),
            Text("Activities"),
          ],
        ),
      ),
      Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "${summaryData.giftsCount}",
              style: Theme.of(context).textTheme.display3,
            ),
            Text("Gifts"),
          ],
        ),
      ),
    ];
  }

  Widget _recentContactsItem() {
    return StreamBuilder(
      stream: _bloc.viewState.contactsState,
      builder: (context, contactsState) {
        ContactsState state = contactsState.data;
        var loading = !contactsState.hasData || state.loading;

        if (loading) {
          return SliverToBoxAdapter(
            child: Container(
                child: Center(
                    child:
                        Loading(indicator: LineScaleIndicator(), size: 40.0))),
          );
        }

        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, childAspectRatio: 1.0),
          delegate: SliverChildBuilderDelegate((context, index) {
            Contact contact = state.contacts[index];
            return InkWell(
                // When the user taps the button, show a snackbar.
                onTap: () {
                  _navigationService.navigateTo(Routes.contactDetails,
                      arguments: ContactDetailsPageArgs(id: contact.id));
                },
                child: GridTile(
                    child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                            color: Colors.blue,
                            child: Center(
                                child: Text("${contact.initials}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .display2))))));
          }, childCount: min(10, state.contacts.length)),
        );
      },
    );
  }

  Widget _eventsItem() {
    return StreamBuilder(
      stream: _bloc.viewState.eventsState,
      builder: (context, eventsState) {
        EventsState state = eventsState.data;
        var loading = !eventsState.hasData || state.loading;

        if (loading) {
          return SliverToBoxAdapter(
            child: Container(
                child: Center(
                    child:
                        Loading(indicator: LineScaleIndicator(), size: 40.0))),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            LifeEvent lifeEvent = state.events[index];
            String dateString = DateFormat.MMMd(
                            Localizations.localeOf(context).languageCode)
                        .format(lifeEvent.happenedAt);
            return ListTile(
              leading: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[Text("$dateString")]),
                title: Text("${lifeEvent.lifeEventType.name}",
                    style: Theme.of(context).textTheme.body2),
                    subtitle: Text("${lifeEvent.contact.firstName} ${lifeEvent.contact.lastName}",
                    style: Theme.of(context).textTheme.body1),);
          }, childCount: min(10, state.events.length)),
        );
      },
    );
  }
}
