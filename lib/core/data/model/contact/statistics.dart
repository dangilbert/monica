import 'dart:convert';

class Statistics {
  int numberOfCalls;
  int numberOfNotes;
  int numberOfActivities;
  int numberOfReminders;
  int numberOfTasks;
  int numberOfGifts;
  int numberOfDebts;
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
      numberOfCalls: map['number_of_calls'],
      numberOfNotes: map['number_of_notes'],
      numberOfActivities: map['number_of_activities'],
      numberOfReminders: map['number_of_reminders'],
      numberOfTasks: map['number_of_tasks'],
      numberOfGifts: map['number_of_gifts'],
      numberOfDebts: map['number_of_debts'],
    );
  }

  String toJson() => json.encode(toMap());

  static Statistics fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Statistics numberOfCalls: $numberOfCalls, numberOfNotes: $numberOfNotes, numberOfActivities: $numberOfActivities, numberOfReminders: $numberOfReminders, numberOfTasks: $numberOfTasks, numberOfGifts: $numberOfGifts, numberOfDebts: $numberOfDebts';
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
