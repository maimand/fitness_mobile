// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodList _$FoodListFromJson(Map<String, dynamic> json) {
  return FoodList(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Food.fromJson(e as Map<String, dynamic>))
        .toList(),
    page: json['page'] as int?,
    size: json['size'] as int?,
    total: json['total'] as int?,
  );
}

Map<String, dynamic> _$FoodListToJson(FoodList instance) => <String, dynamic>{
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'size': instance.size,
      'page': instance.page,
      'total': instance.total,
    };

Food _$FoodFromJson(Map<String, dynamic> json) {
  return Food(
    id: json['id'] as String?,
    name: json['name'] as String?,
    ration: json['ration'] as String?,
    calo: (json['calo'] as num?)?.toDouble(),
    protein: (json['protein'] as num?)?.toDouble(),
    fat: (json['fat'] as num?)?.toDouble(),
    carb: (json['carb'] as num?)?.toDouble(),
    fiber: (json['fiber'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ration': instance.ration,
      'calo': instance.calo,
      'protein': instance.protein,
      'fat': instance.fat,
      'carb': instance.carb,
      'fiber': instance.fiber,
    };
