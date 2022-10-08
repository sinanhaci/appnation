class Failure {
  Failure({
    this.time,
    this.altitude,
    this.reason,
  });

  int? time;
  int? altitude;
  String? reason;

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
        time: json["time"],
        altitude: json["altitude"],
        reason: json["reason"],
      );
}
