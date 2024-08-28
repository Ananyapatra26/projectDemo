class SignUpModelClass {
  String? fullName;
  String? email;
  String? phone;
  String? password;
  String? role;
  String? businessName;
  String? informalName;
  String? address;
  String? city;
  String? state;
  int? zipCode;
  String? registrationProof;
  BusinessHours? businessHours;
  String? deviceToken;
  String? type;
  String? socialId;

  SignUpModelClass(
      {this.fullName,
        this.email,
        this.phone,
        this.password,
        this.role,
        this.businessName,
        this.informalName,
        this.address,
        this.city,
        this.state,
        this.zipCode,
        this.registrationProof,
        this.businessHours,
        this.deviceToken,
        this.type,
        this.socialId});

  SignUpModelClass.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    role = json['role'];
    businessName = json['business_name'];
    informalName = json['informal_name'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    registrationProof = json['registration_proof'];
    businessHours = json['business_hours'] != null
        ? new BusinessHours.fromJson(json['business_hours'])
        : null;
    deviceToken = json['device_token'];
    type = json['type'];
    socialId = json['social_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['role'] = this.role;
    data['business_name'] = this.businessName;
    data['informal_name'] = this.informalName;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['registration_proof'] = this.registrationProof;
    if (this.businessHours != null) {
      data['business_hours'] = this.businessHours!.toJson();
    }
    data['device_token'] = this.deviceToken;
    data['type'] = this.type;
    data['social_id'] = this.socialId;
    return data;
  }
}

class BusinessHours {
  List<String>? mon;
  List<String>? tue;
  List<String>? wed;
  List<String>? thu;
  List<String>? fri;
  List<String>? sat;
  List<String>? sun;

  BusinessHours(
      {this.mon, this.tue, this.wed, this.thu, this.fri, this.sat, this.sun});

  BusinessHours.fromJson(Map<String, dynamic> json) {
    mon = json['mon'].cast<String>();
    tue = json['tue'].cast<String>();
    wed = json['wed'].cast<String>();
    thu = json['thu'].cast<String>();
    fri = json['fri'].cast<String>();
    sat = json['sat'].cast<String>();
    sun = json['sun'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mon'] = this.mon;
    data['tue'] = this.tue;
    data['wed'] = this.wed;
    data['thu'] = this.thu;
    data['fri'] = this.fri;
    data['sat'] = this.sat;
    data['sun'] = this.sun;
    return data;
  }
}
