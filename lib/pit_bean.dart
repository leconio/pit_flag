import 'package:json_annotation/json_annotation.dart';

part 'pit_bean.g.dart';


List<PitBean> getPitBeanList(List<dynamic> list){
  List<PitBean> result = [];
  list.forEach((item){
    result.add(PitBean.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class PitBean extends Object {

  @JsonKey(name: 'locale')
  String locale;

  @JsonKey(name: 'country')
  String country;

  @JsonKey(name: 'string')
  String string;

  PitBean(this.locale,this.country,this.string,);

  factory PitBean.fromJson(Map<String, dynamic> srcJson) => _$PitBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PitBeanToJson(this);

}


