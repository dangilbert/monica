import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:monica/core/data/model/life_event.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/client.dart';

class LifeEventsRequest {
  MonicaClient _client;

  LifeEventsRequest({@required MonicaClient client}) {
    _client = client;
  }

  Future<BinaryResult<List<LifeEvent>>> getLifeEvents() async {
    var result = await _client.get("lifeevents");
    if (result is BinaryResultSuccess) {
      try {
        var lifeEventsJson = jsonDecode(result.value)['data'];
        List<LifeEvent> lifeEvents =
            lifeEventsJson.toList().map<LifeEvent>((lifeEventJson) {
          return LifeEvent.fromJson(lifeEventJson);
        }).toList();
        return BinaryResult.success(value: lifeEvents);
      } catch (err) {
        // TODO inject logger
        return BinaryResult.failure(exception: err);
      }
    } else {
      return BinaryResult.failure();
    }
  }
}
