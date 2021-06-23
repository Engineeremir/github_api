class GetData {
  final String? login;
  final int? id;
  final String? name;

  GetData({this.login, this.id,this.name,});

  factory GetData.fromJson(Map<String,dynamic> json){
    return GetData(login: json['login'], id:json['id'],name:json['name']);
  }

}