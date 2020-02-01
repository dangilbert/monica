import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/core/bloc/bloc.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/repo/contacts_repo.dart';

class ContactDetailsBloc extends Bloc<ContactDetailsBlocViewState,
    ContactDetailsBlocViewEffect, ContactDetailsBlocViewAction> {
  ContactsRepo _repo = GetIt.instance.get();

  StreamController<ContactState> _contactStreamController = StreamController();

  int contactId;
  Contact _contact;
  bool _loading;


  ContactDetailsBloc({@required this.contactId}) {
    _repo.contact(contactId).listen((contact) {
      _contact = contact;
      _buildViewState();
    });
    viewState =
        ContactDetailsBlocViewState(contactState: _contactStreamController.stream.asBroadcastStream());

    _buildViewState();
    _loadData();
  }

  @override
  dispose() {
    _contactStreamController.close();
    _repo.dispose();
    return super.dispose();
  }

  @override
  void handleAction(ContactDetailsBlocViewAction action) {
    // TODO: implement handleAction
  }

  void _loadData() async {
    _loading = true;
    _buildViewState();
    var result = await _repo.loadContact(contactId);
    result.onFailure(() => effectController.add(ContactDetailsErrorLoadingContactViewEffect()));
    _loading = false;
    _buildViewState();
  }

  void _buildViewState() {
          var state = ContactState(loading: _loading, contact: _contact);
          _contactStreamController.add(state);
  }
}

@immutable
class ContactState {
  final bool loading;
  final Contact contact; 

  ContactState({@required this.loading, @required this.contact});
}

@immutable
class ContactDetailsBlocViewState {
  final Stream<ContactState> contactState;

  ContactDetailsBlocViewState({@required this.contactState});
}

abstract class ContactDetailsBlocViewAction {}

abstract class ContactDetailsBlocViewEffect {}
class ContactDetailsErrorLoadingContactViewEffect extends ContactDetailsBlocViewEffect {}
