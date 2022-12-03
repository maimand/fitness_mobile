// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) {
  return ExerciseModel(
    json['name'] as String?,
    json['videoUrl'] as String?,
  );
}

Map<String, dynamic> _$ExerciseModelToJson(ExerciseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'videoUrl': instance.videoUrl,
    };

ExerciseDetailModel _$ExerciseDetailModelFromJson(Map<String, dynamic> json) {
  return ExerciseDetailModel(
    name: json['name'] as String?,
    videoUrl: json['videoUrl'] as String?,
    difficulty: json['difficulty'] as String?,
    instructions: json['instructions'] as String?,
    caloriesBurn: (json['caloriesBurn'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ExerciseDetailModelToJson(
        ExerciseDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'videoUrl': instance.videoUrl,
      'difficulty': instance.difficulty,
      'instructions': instance.instructions,
      'caloriesBurn': instance.caloriesBurn,
    };
