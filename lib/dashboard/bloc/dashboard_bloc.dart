import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/core/bloc/bloc.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/model/life_event.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/dashboard/data/dashboard_repo.dart';

class DashboardBloc extends Bloc<DashboardBlocViewState,
    DashboardBlocViewEffect, DashboardBlocViewAction> {
  DashboardRepo _repo = GetIt.instance.get();

  bool _loading = false;
  StreamController<DashboardSummary> _dashboardSummary = StreamController();
  StreamController<ContactsState> _contactsState = StreamController();
  StreamController<EventsState> _eventsState = StreamController();

  List<Contact> _contacts = [];
  List<LifeEvent> _lifeEvents = [];

  DashboardBloc() {
    // Start the load of the dashboard data
    _repo.contacts.listen((data) {
      _contacts = data;
      _updateDashboard();
    });

    _repo.lifeEvents.listen((data) {
      _lifeEvents = data;
      _updateDashboard();
    });

    viewState = DashboardBlocViewState(
        summary: _dashboardSummary.stream,
        contactsState: _contactsState.stream,
        eventsState: _eventsState.stream);

    _updateDashboard();
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
    _loading = true;
    var contactsRequest = _repo.fetchContacts();
    var lifeEventsRequest = _repo.fetchLifeEvents();
    var results = await Future.wait([contactsRequest, lifeEventsRequest]);
    var failure = results.any((result) {
      return result is BinaryResultFailure;
    });
    if (failure) {
      effectController.add(LoadingErrorEffect());
    }
    _loading = false;
  }

  void _updateDashboard() {
    _buildDashboardSummary();
    _buildContactsState();
    _buildEventsState();
  }

  void _buildDashboardSummary() {
    _dashboardSummary.add(DashboardSummary(
        loading: _loading,
        activitiesCount: 0,
        contactsCount: _contacts.length,
        giftsCount: 0));
  }

  void _buildContactsState() {
    _contactsState.add(ContactsState(loading: _loading, contacts: _contacts));
  }

  void _buildEventsState() {
    _eventsState.add(EventsState(loading: _loading, events: _lifeEvents));
  }

  @override
  dispose() {
    _dashboardSummary.close();
    return super.dispose();
  }
}

class DashboardBlocViewState {
  DashboardBlocViewState(
      {@required this.summary,
      @required this.contactsState,
      @required this.eventsState});
  final Stream<DashboardSummary> summary;
  final Stream<ContactsState> contactsState;
  final Stream<EventsState> eventsState;
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

@immutable
class ContactsState {
  final bool loading;
  final List<Contact> contacts;

  ContactsState({@required this.loading, @required this.contacts});
}

@immutable
class EventsState {
  final bool loading;
  final List<LifeEvent> events;

  EventsState({@required this.loading, @required this.events});
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
