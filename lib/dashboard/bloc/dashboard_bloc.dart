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

  bool _loadingContacts = false;
  bool _loadingActivities = false;
  bool _loadingGifts = false;
  StreamController<DashboardSummary> _dashboardSummary = StreamController();
  StreamController<ContactsState> _contactsState = StreamController();

  List<Contact> _contacts = [];

  DashboardBloc() {
    // Start the load of the dashboard data
    _repo.contacts.listen((data) {
      _contacts = data;
      _buildDashboardSummary();
      _buildContactsState();
    });

    viewState = DashboardBlocViewState(
        summary: _dashboardSummary.stream,
        contactsState: _contactsState.stream);

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
    _loadingContacts = true;
    var result = await _repo.fetchContacts();
    result.onFailure(() => effectController.add(LoadingErrorEffect()));
    _loadingContacts = false;
  }

  void _buildDashboardSummary() {
    _dashboardSummary.add(DashboardSummary(
      loading: _loadingContacts || _loadingActivities || _loadingGifts,
        activitiesCount: 0, contactsCount: _contacts.length, giftsCount: 0));
  }

  void _buildContactsState() {
    _contactsState.add(ContactsState(loading: _loadingContacts, contacts: _contacts));
  }

  @override
  dispose() {
    _dashboardSummary.close();
    return super.dispose();
  }
}

class DashboardBlocViewState {
  DashboardBlocViewState({@required this.summary, @required this.contactsState});
  final Stream<DashboardSummary> summary;
  final Stream<ContactsState> contactsState;
}

@immutable
class DashboardSummary {
  final bool loading;
  final int contactsCount;
  final int activitiesCount;
  final int giftsCount;

  DashboardSummary(
      {@required this.loading,
      @required this.contactsCount,
      @required this.activitiesCount,
      @required this.giftsCount});
}

class ContactsState {
  final bool loading;
  final List<Contact> contacts;

  ContactsState({@required this.loading, @required this.contacts});
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
