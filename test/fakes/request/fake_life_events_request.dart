
import 'package:monica/core/data/model/life_event.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/request/life_events_request.dart';

class FakeLifeEventsRequest extends LifeEventsRequest {

BinaryResult<List<LifeEvent>> nextResult = BinaryResult.success(value: []);

  @override
  Future<BinaryResult<List<LifeEvent>>> getLifeEvents() async {
    return nextResult;
  }

}