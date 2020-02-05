import 'dart:convert';

class Statistics {
  final int numberOfCalls;
  final int numberOfNotes;
  final int numberOfActivities;
  final int numberOfReminders;
  final int numberOfTasks;
  final int numberOfGifts;
  final int numberOfDebts;
  Statistics({
    this.numberOfCalls,
    this.numberOfNotes,
    this.numberOfActivities,
    this.numberOfReminders,
    this.numberOfTasks,
    this.numberOfGifts,
    this.numberOfDebts,
  });

  Statistics copyWith({
    int numberOfCalls,
    int numberOfNotes,
    int numberOfActivities,
    int numberOfReminders,
    int numberOfTasks,
    int numberOfGifts,
    int numberOfDebts,
  }) {
    return Statistics(
      numberOfCalls: numberOfCalls ?? this.numberOfCalls,
      numberOfNotes: numberOfNotes ?? this.numberOfNotes,
      numberOfActivities: numberOfActivities ?? this.numberOfActivities,
      numberOfReminders: numberOfReminders ?? this.numberOfReminders,
      numberOfTasks: numberOfTasks ?? this.numberOfTasks,
      numberOfGifts: numberOfGifts ?? this.numberOfGifts,
      numberOfDebts: numberOfDebts ?? this.numberOfDebts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number_of_calls': numberOfCalls,
      'number_of_notes': numberOfNotes,
      'number_of_activities': numberOfActivities,
      'number_of_reminders': numberOfReminders,
      'number_of_tasks': numberOfTasks,
      'number_of_gifts': numberOfGifts,
      'number_of_debts': numberOfDebts,
    };
  }

  static Statistics fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Statistics(
      numberOfCalls: map['number_of_calls']?.toInt(),
      numberOfNotes: map['number_of_notes']?.toInt(),
      numberOfActivities: map['number_of_activities']?.toInt(),
      numberOfReminders: map['number_of_reminders']?.toInt(),
      numberOfTasks: map['number_of_tasks']?.toInt(),
      numberOfGifts: map['number_of_gifts']?.toInt(),
      numberOfDebts: map['number_of_debts']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Statistics fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Statistics number_of_calls: $numberOfCalls, number_of_notes: $numberOfNotes, number_of_activities: $numberOfActivities, number_of_reminders: $numberOfReminders, number_of_tasks: $numberOfTasks, number_of_gifts: $numberOfGifts, number_of_debts: $numberOfDebts';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Statistics &&
        o.numberOfCalls == numberOfCalls &&
        o.numberOfNotes == numberOfNotes &&
        o.numberOfActivities == numberOfActivities &&
        o.numberOfReminders == numberOfReminders &&
        o.numberOfTasks == numberOfTasks &&
        o.numberOfGifts == numberOfGifts &&
        o.numberOfDebts == numberOfDebts;
  }

  @override
  int get hashCode {
    return numberOfCalls.hashCode ^
        numberOfNotes.hashCode ^
        numberOfActivities.hashCode ^
        numberOfReminders.hashCode ^
        numberOfTasks.hashCode ^
        numberOfGifts.hashCode ^
        numberOfDebts.hashCode;
  }
}
