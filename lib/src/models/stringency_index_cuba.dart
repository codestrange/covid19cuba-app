import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

part 'stringency_index_cuba.g.dart';

@JsonSerializable()
class StringencyIndexCubaModel {
  @JsonKey(fromJson: dateTimeListFromJson, toJson: dateTimeListToJson)
  List<DateTime> days;
  List<double> data;
  List<MomentModel> moments;

  StringencyIndexCubaModel();

  factory StringencyIndexCubaModel.fromJson(Map<String, dynamic> json) =>
      _$StringencyIndexCubaModelFromJson(json);

  Map<String, dynamic> toJson() => _$StringencyIndexCubaModelToJson(this);
}
