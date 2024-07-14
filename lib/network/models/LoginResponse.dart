import 'dart:convert';
/// statuscode : 200
/// message : "Login Success"
/// token : "pk8Kqm6Mg79EGSO5J5TWS03pHQVMHq438ZAWu9RbhfBJUHwzl5dYvjokE4xbUZyC"
/// usertype : 0
/// userdata : {"userid":1,"email":"rzd10@hotmail.com","usertype":0}

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
class LoginResponse {
  LoginResponse({
      num? statuscode, 
      String? message, 
      String? token, 
      num? usertype, 
      Userdata? userdata,}){
    _statuscode = statuscode;
    _message = message;
    _token = token;
    _usertype = usertype;
    _userdata = userdata;
}

  LoginResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _message = json['message'];
    _token = json['token'];
    _usertype = json['usertype'];
    _userdata = json['userdata'] != null ? Userdata.fromJson(json['userdata']) : null;
  }
  num? _statuscode;
  String? _message;
  String? _token;
  num? _usertype;
  Userdata? _userdata;
LoginResponse copyWith({  num? statuscode,
  String? message,
  String? token,
  num? usertype,
  Userdata? userdata,
}) => LoginResponse(  statuscode: statuscode ?? _statuscode,
  message: message ?? _message,
  token: token ?? _token,
  usertype: usertype ?? _usertype,
  userdata: userdata ?? _userdata,
);
  num? get statuscode => _statuscode;
  String? get message => _message;
  String? get token => _token;
  num? get usertype => _usertype;
  Userdata? get userdata => _userdata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statuscode'] = _statuscode;
    map['message'] = _message;
    map['token'] = _token;
    map['usertype'] = _usertype;
    if (_userdata != null) {
      map['userdata'] = _userdata?.toJson();
    }
    return map;
  }

}

/// userid : 1
/// email : "rzd10@hotmail.com"
/// usertype : 0

Userdata userdataFromJson(String str) => Userdata.fromJson(json.decode(str));
String userdataToJson(Userdata data) => json.encode(data.toJson());
class Userdata {
  Userdata({
      num? userid, 
      String? email, 
      num? usertype,}){
    _userid = userid;
    _email = email;
    _usertype = usertype;
}

  Userdata.fromJson(dynamic json) {
    _userid = json['userid'];
    _email = json['email'];
    _usertype = json['usertype'];
  }
  num? _userid;
  String? _email;
  num? _usertype;
Userdata copyWith({  num? userid,
  String? email,
  num? usertype,
}) => Userdata(  userid: userid ?? _userid,
  email: email ?? _email,
  usertype: usertype ?? _usertype,
);
  num? get userid => _userid;
  String? get email => _email;
  num? get usertype => _usertype;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userid'] = _userid;
    map['email'] = _email;
    map['usertype'] = _usertype;
    return map;
  }

}