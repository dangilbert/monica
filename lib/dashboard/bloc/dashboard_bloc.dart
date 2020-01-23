import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/core/bloc/bloc.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/dashboard/data/dashboard_repo.dart';

class DashboardBloc extends Bloc<DashboardBlocViewState,
    DashboardBlocViewEffect, DashboardBlocViewAction> {
  DashboardRepo _repo = GetIt.instance.get();

  StreamController<bool> _loading = StreamController();
  StreamController<DashboardSummary> _dashboardSummary = StreamController();

  List<Contact> _contacts = [];

  DashboardBloc() {
    // Start the load of the dashboard data
    _repo.contacts.listen((data) {
      _contacts = data;
      _buildDashboardSummary();
    });

    viewState = DashboardBlocViewState(
        loading: _loading.stream, summary: _dashboardSummary.stream);

_buildDashboardSummary();
    _loadData();
  }

  @override
  void handleAction(DashboardBlocViewAction action) {
    switch (action.runtimeType) {
      case RefreshViewAction:
        _loadData();
        break;
      case ContactsTappedViewAction:
        print("Contacts tapped");
        break;
      case EventsTappedViewAction:
        print("Events tapped");
        break;
      case EventDetailsTappedViewAction:
        print("Event Details tapped");
        break;
    }
  }

  void _loadData() async {
    _loading.add(true);
    var result = await _repo.fetchContacts();
    result.onFailure(() => effectController.add(LoadingErrorEffect()));
    _loading.add(false);
  }

  void _buildDashboardSummary() {
    _dashboardSummary.add(DashboardSummary(
        activitiesCount: 0, contactsCount: _contacts.length, giftsCount: 0));
  }

  @override
  dispose() {
    _dashboardSummary.close();
    return super.dispose();
  }
}

class DashboardBlocViewState {
  DashboardBlocViewState({@required this.loading, @required this.summary});
  final Stream<bool> loading;
  final Stream<DashboardSummary> summary;
}

@immutable
class DashboardSummary {
  final int contactsCount;
  final int activitiesCount;
  final int giftsCount;

  DashboardSummary(
      {@required this.contactsCount,
      @required this.activitiesCount,
      @required this.giftsCount});
}

abstract class DashboardBlocViewEffect extends Equatable {}

class LoadingErrorEffect extends DashboardBlocViewEffect {
  @override
  List<Object> get props => [];
}

class DashboardBlocViewAction {}

class RefreshViewAction extends DashboardBlocViewAction {}

class ContactsTappedViewAction extends DashboardBlocViewAction {}

class EventsTappedViewAction extends DashboardBlocViewAction {}

@immutable
class EventDetailsTappedViewAction extends DashboardBlocViewAction {
  final String eventId;
  EventDetailsTappedViewAction({@required this.eventId});
}
