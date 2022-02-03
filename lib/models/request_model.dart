class RequestModel {
  bool status;
  Data data;

  RequestModel({this.status, this.data});

  RequestModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  Customer customer;
  DropLocation dropLocation;
  String deliveryNotes;
  String recordVoice;
  int status;
  String createdAt;

  Data(
      {this.id,
      this.customer,
      this.dropLocation,
      this.deliveryNotes,
      this.recordVoice,
      this.status,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    dropLocation = json['drop_location'] != null
        ? new DropLocation.fromJson(json['drop_location'])
        : null;
    deliveryNotes = json['delivery_notes'];
    recordVoice = json['record_voice'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    if (this.dropLocation != null) {
      data['drop_location'] = this.dropLocation.toJson();
    }
    data['delivery_notes'] = this.deliveryNotes;
    data['record_voice'] = this.recordVoice;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Customer {
  int id;
  int userId;
  Null rate;
  Null gender;
  Null address;
  int status;
  String createdAt;
  String updatedAt;
  Pivot pivot;
  User user;

  Customer(
      {this.id,
      this.userId,
      this.rate,
      this.gender,
      this.address,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.pivot,
      this.user});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    rate = json['rate'];
    gender = json['gender'];
    address = json['address'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['rate'] = this.rate;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Pivot {
  int orderId;
  int orderableId;
  String orderableType;

  Pivot({this.orderId, this.orderableId, this.orderableType});

  Pivot.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderableId = json['orderable_id'];
    orderableType = json['orderable_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['orderable_id'] = this.orderableId;
    data['orderable_type'] = this.orderableType;
    return data;
  }
}

class User {
  int id;
  String name;
  Null email;
  String phone;
  Null emailVerifiedAt;
  Null passphrase;
  Null passphraseExpiry;
  String fcmToken;
  Null expiresAt;
  String password;
  int role;
  Null qrCode;
  Null currentTeamId;
  Null profilePhotoPath;
  int isNew;
  Null deletedAt;
  String createdAt;
  String updatedAt;
  String profilePhotoUrl;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.emailVerifiedAt,
      this.passphrase,
      this.passphraseExpiry,
      this.fcmToken,
      this.expiresAt,
      this.password,
      this.role,
      this.qrCode,
      this.currentTeamId,
      this.profilePhotoPath,
      this.isNew,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.profilePhotoUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    passphrase = json['passphrase'];
    passphraseExpiry = json['passphrase_expiry'];
    fcmToken = json['fcm_token'];
    expiresAt = json['expires_at'];
    password = json['password'];
    role = json['role'];
    qrCode = json['qr_code'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    isNew = json['is_new'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['passphrase'] = this.passphrase;
    data['passphrase_expiry'] = this.passphraseExpiry;
    data['fcm_token'] = this.fcmToken;
    data['expires_at'] = this.expiresAt;
    data['password'] = this.password;
    data['role'] = this.role;
    data['qr_code'] = this.qrCode;
    data['current_team_id'] = this.currentTeamId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['is_new'] = this.isNew;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}

class DropLocation {
  String name;
  Coordinates coordinates;

  DropLocation({this.name, this.coordinates});

  DropLocation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates.toJson();
    }
    return data;
  }
}

class Coordinates {
  double lat;
  double lng;

  Coordinates({this.lat, this.lng});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
