import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/core/bloc/bloc.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/repo/contacts_repo.dart';

class ContactsBloc extends Bloc<ContactsBlocViewState, ContactsBlocViewEffect,
    ContactsBlocViewAction> {
  ContactsRepo _repo = GetIt.instance.get();
  bool _loadingContacts = false;
  List<Contact> _contacts = [];
  StreamController<ContactsState> _contactsState = StreamController();

  ContactsBloc() {
    _repo.contacts.listen((contacts) {
      _contacts = contacts;
      _contacts.sort((a, b) {
        var comparison =
            a.lastName.toLowerCase().compareTo(b.lastName.toLowerCase());
        if (comparison == 0) {
          comparison =
              a.firstName.toLowerCase().compareTo(b.firstName.toLowerCase());
        }
        return comparison;
      });
      _buildContactsState();
    });

    viewState = ContactsBlocViewState(contactsState: _contactsState.stream);

    _loadData();
  }

  @override
  void handleAction(ContactsBlocViewAction action) {
    switch (action.runtimeType) {
      case RefreshViewAction:
        _loadData();
        break;
    }
  }

  void _loadData() async {
    _loadingContacts = true;
    var result = await _repo.loadContacts();
    result.onFailure(() => effectController.add(LoadingErrorEffect()));
    _loadingContacts = false;
  }

  void _buildContactsState() {
    _contactsState
        .add(ContactsState(loading: _loadingContacts, contacts: _contacts));
  }
}

class ContactsBlocViewState {
  ContactsBlocViewState({@required this.contactsState});
  final Stream<ContactsState> contactsState;
}

@immutable
class ContactsState {
  final bool loading;
  final List<Contact> contacts;

  ContactsState({@required this.loading, @required this.contacts});
}

abstract class ContactsBlocViewEffect extends Equatable {}

class LoadingErrorEffect extends ContactsBlocViewEffect {
  @override
  List<Object> get props => [];
}

class ContactsBlocViewAction {}

class RefreshViewAction extends ContactsBlocViewAction {}

class AddContactTappedViewAction extends ContactsBlocViewAction {}

@immutable
class ContactDetailsTappedViewAction extends ContactsBlocViewAction {
  final String contactId;
  ContactDetailsTappedViewAction({@required this.contactId});
}
