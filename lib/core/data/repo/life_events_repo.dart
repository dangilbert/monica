import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:monica/core/data/model/life_event.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/request/life_events_request.dart';

class LifeEventsRepo {
  LifeEventsRequest _request = GetIt.instance.get();

  StreamController<List<LifeEvent>> _lifeEvents = StreamController();
  Stream lifeEvents;

  LifeEventsRepo() {
    lifeEvents = _lifeEvents.stream.asBroadcastStream();
  }

  Future<BinaryResult<void>> loadLifeEvents() async {
    BinaryResult<List<LifeEvent>> eventsResult = await _request.getLifeEvents();
    return eventsResult
      ..onSuccess((events) {
        // TODO persist the contacts
        _lifeEvents.add(events);
      });
  }
}
