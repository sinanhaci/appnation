import 'dart:convert';
import 'package:flutter/foundation.dart';
import '_core_model.dart';
import '_failure_model.dart';
import '_fairing_model.dart';
import '_link_model.dart';


Future<List<SpaceXLaunchModel>> spaceXLaunchModelFromJson(String str) async {
  //https://api.spacexdata.com/v4/launches/next bu endpoint kullanılarak bir tane datayı çekerdim ancak örnekte bu şekilde istediğinizi tahmin ettim. 
  var decodeJson = await compute(jsonDecode, str);
  return List<SpaceXLaunchModel>.from(
      decodeJson.map((x) => SpaceXLaunchModel.fromJson(x)));
}

class SpaceXLaunchModel {
  SpaceXLaunchModel({
    this.fairings,
    this.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.net,
    this.window,
    this.rocket,
    this.success,
    this.failures,
    this.details,
    this.crew,
    this.ships,
    this.capsules,
    this.payloads,
    this.launchpad,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateUnix,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.cores,
    this.autoUpdate,
    this.tbd,
    this.launchLibraryId,
    this.id,
  });

  Fairings? fairings;
  Links? links;
  DateTime? staticFireDateUtc;
  int? staticFireDateUnix;
  bool? net;
  int? window;
  String? rocket;
  bool? success;
  List<Failure>? failures;
  String? details;
  List<String>? crew;
  List<String>? ships;
  List<String>? capsules;
  List<String>? payloads;
  String? launchpad;
  int? flightNumber;
  String? name;
  DateTime? dateUtc;
  int? dateUnix;
  DateTime? dateLocal;
  String? datePrecision;
  bool? upcoming;
  List<Core>? cores;
  bool? autoUpdate;
  bool? tbd;
  String? launchLibraryId;
  String? id;

  factory SpaceXLaunchModel.fromJson(Map<String, dynamic> json) =>
      SpaceXLaunchModel(
        fairings: json["fairings"] == null
            ? null
            : Fairings.fromJson(json["fairings"]),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        staticFireDateUtc: json["static_fire_date_utc"] == null ? null : DateTime.tryParse(json["static_fire_date_utc"]),
        staticFireDateUnix: json["static_fire_date_unix"],
        net: json["net"],
        window: json["window"],
        rocket: json["rocket"],
        success: json["success"],
        failures: json["failures"] == null
            ? []
            : List<Failure>.from(
                json["failures"].map((x) => Failure.fromJson(x))),
        details: json["details"],
        crew: json["crew"] == null
            ? []
            : List<String>.from(json["crew"].map((x) => x)),
        ships: json["ships"] == null
            ? []
            : List<String>.from(json["ships"].map((x) => x)),
        capsules: json["capsules"] == null
            ? []
            : List<String>.from(json["capsules"].map((x) => x)),
        payloads: json["payloads"] == null
            ? []
            : List<String>.from(json["payloads"].map((x) => x)),
        launchpad: json["launchpad"],
        flightNumber: json["flight_number"],
        name: json["name"],
        dateUtc: DateTime.parse(json["date_utc"]),
        dateUnix: json["date_unix"],
        dateLocal: DateTime.parse(json["date_local"]),
        datePrecision: json["date_precision"],
        upcoming: json["upcoming"],
        cores: json["cores"] == null
            ? []
            : List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
        autoUpdate: json["auto_update"],
        tbd: json["tbd"],
        launchLibraryId: json["launch_library_id"],
        id: json["id"],
      );
}
