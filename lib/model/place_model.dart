import 'package:catalog_city_project/model/craftstores_model.dart';
import 'package:catalog_city_project/model/hotel_model.dart';
import 'package:catalog_city_project/model/restaurants_model.dart';
import 'package:catalog_city_project/model/things_todo.dart';
import 'package:get/get.dart';

class PlaceModel {
  final int id;
  final String title;
  final String country;
  final String address;
  final String description;
  final List<String> images;
  final String? video;
  final double latitude;
  final double longitude;
  bool isFavourite;
  final List<ThingsTodo>? thingsTodo;
  final List<Restaurants>? restaurants;
  final List<Hotel>? hotels;
  final List<Craftstores>? craftstores;

  PlaceModel(
      {required this.id,
      required this.title,
      required this.country,
      required this.address,
      required this.description,
      required this.images,
      this.video,
      required this.latitude,
      required this.longitude,
      required this.isFavourite,
      this.thingsTodo,
      this.restaurants,
      this.hotels,
      this.craftstores});

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
      id: json['id'],
      title: json['title'],
      country: json['country'],
      address: json['address'],
      description: json['description'],
      images: List<String>.from(json['images']),
      video: json['video'] == null ? null : (json['video']),
      latitude: json['coordinates']['lat'],
      longitude: json['coordinates']['lon'],
      isFavourite: json['isFavourite'],
      thingsTodo: json['thingstodo'] == null
          ? null
          : (json['thingstodo'] as List)
              .map((i) => ThingsTodo.fromJson(i))
              .toList(),
      restaurants: json['restaurants'] == null
          ? null
          : (json['restaurants'] as List)
              .map((i) => Restaurants.fromJson(i))
              .toList(),
      hotels: json['hotels'] == null
          ? null
          : (json['hotels'] as List).map((i) => Hotel.fromJson(i)).toList(),
      craftstores: json['craftstores'] == null
          ? null
          : (json['craftstores'] as List)
              .map((i) => Craftstores.fromJson(i))
              .toList());
}

RxList<PlaceModel> places = RxList<PlaceModel>([]);
RxList<PlaceModel> internationalTripList = RxList<PlaceModel>([]);
