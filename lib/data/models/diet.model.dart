import 'package:json_annotation/json_annotation.dart';
part 'diet.model.g.dart';

@JsonSerializable(explicitToJson: true)
class FoodList {
  List<Food>? items;
  int? size;
  int? page;
  int? total;

  FoodList({this.items, this.page, this.size, this.total});

  factory FoodList.fromJson(Map<String, dynamic> json) =>
      _$FoodListFromJson(json);

  Map<String, dynamic> toJson() => _$FoodListToJson(this);
}

@JsonSerializable()
class Food {
  final String? id;
  final String? name;
  final String? ration;
  final double? calo;
  final double? protein;
  final double? fat;
  final double? carb;
  final double? fiber;

  Food(
      {this.id,
      this.name,
      this.ration,
      this.calo,
      this.protein,
      this.fat,
      this.carb,
      this.fiber});

  factory Food.fromJson(Map<String, dynamic> json) =>
      _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
