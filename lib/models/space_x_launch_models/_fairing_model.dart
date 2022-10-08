class Fairings {
  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
    this.ships,
  });

  bool? reused;
  bool? recoveryAttempt;
  bool? recovered;
  List<String>? ships;

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
        reused: json["reused"],
        recoveryAttempt: json["recovery_attempt"],
        recovered: json["recovered"],
        ships: json["ships"] == null
            ? []
            : List<String>.from(json["ships"].map((x) => x)),
      );
}