import 'dart:convert';

class Career {
  Null job;
  Null company;
  Career({
    this.job,
    this.company,
  });

  Career copyWith({
    Null job,
    Null company,
  }) {
    return Career(
      job: job ?? this.job,
      company: company ?? this.company,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'job': job,
      'company': company,
    };
  }

  static Career fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Career(
      job: map['job'],
      company: map['company'],
    );
  }

  String toJson() => json.encode(toMap());

  static Career fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Career job: $job, company: $company';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Career && o.job == job && o.company == company;
  }

  @override
  int get hashCode => job.hashCode ^ company.hashCode;
}