class OfficeData {
  String? email;
  String? name;
  String? password;
  String? phoneNumber;

  OfficeData({this.email, this.name, this.password, this.phoneNumber});

  OfficeData.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    name = json['Name'];
    password = json['Password'];
    phoneNumber = json['PhoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = email;
    data['Name'] = name;
    data['Password'] = password;
    data['PhoneNumber'] = phoneNumber;
    return data;
  }
}
