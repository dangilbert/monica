import 'package:flutter/material.dart';
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
    return Container(
      child: StreamBuilder(stream: _bloc.viewState.summary, builder: (context, summary) {
        if (!summary.hasData) {
          return Text(I18n.of(context).coreNoData);
        }
        DashboardSummary summaryData = summary.data;
        return Column(children: <Widget>[
          Text("Contacts: ${summaryData.contactsCount}"),
          Text("Activites: ${summaryData.activitiesCount}"),
          Text("Gifts: ${summaryData.giftsCount}"),
        ],);
      },)
    );
  }
}
