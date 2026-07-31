class ProfileDModel {
  String? sId;
  String? email;
  String? password;
  String? createdDate;

  ProfileDModel({this.sId, this.email, this.password, this.createdDate});

  ProfileDModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['createdDate'] = this.createdDate;
    return data;
  }
}
