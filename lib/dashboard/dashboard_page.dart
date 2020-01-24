import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/dashboard/bloc/dashboard_bloc.dart';
import 'package:monica/i18n.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardBloc _bloc = DashboardBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> slivers = [_summaryItem(), _recentContactsItem()];

    return Container(
        child: CustomScrollView(
      slivers: slivers,
    ));
  }

  Widget _summaryItem() {
    return StreamBuilder(
        stream: _bloc.viewState.summary,
        builder: (context, summary) {
          DashboardSummary summaryData = summary.data;
          return SliverGrid.count(
            crossAxisCount: summary.hasData ? 3 : 1,
            children: summary.hasData
                ? _summaryItems(summaryData)
                : [Text(I18n.of(context).coreNoData)],
          );
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
      stream: _bloc.viewState.contacts,
      builder: (context, contacts) {
        List<Contact> contactsData = contacts.data;

        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, childAspectRatio: 1.0),
          delegate: SliverChildBuilderDelegate((context, index) {
            if (!contacts.hasData) {
              return Text(I18n.of(context).coreNoData);
            }
            return GridTile(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                    child: Container(
                        color: Colors.blue,
                        child: Center(
                            child: Text("${contactsData[index].initials}", style: Theme.of(context).textTheme.display2)))));
          }, childCount: contacts.hasData ? min(10, contactsData.length) : 1),
        );
      },
    );
  }
}
