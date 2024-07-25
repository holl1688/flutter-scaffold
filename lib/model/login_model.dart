class LoginModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? refreshToken;
  User? user;

  LoginModel({this.accessToken, this.tokenType, this.expiresIn, this.refreshToken, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    refreshToken = json['refresh_token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['refresh_token'] = refreshToken;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? aud;
  String? role;
  String? email;
  String? emailConfirmedAt;
  String? phone;
  String? confirmedAt;
  String? lastSignInAt;
  AppMetadata? appMetadata;
  UserMetadata? userMetadata;
  List<Identities>? identities;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.aud,
      this.role,
      this.email,
      this.emailConfirmedAt,
      this.phone,
      this.confirmedAt,
      this.lastSignInAt,
      this.appMetadata,
      this.userMetadata,
      this.identities,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aud = json['aud'];
    role = json['role'];
    email = json['email'];
    emailConfirmedAt = json['email_confirmed_at'];
    phone = json['phone'];
    confirmedAt = json['confirmed_at'];
    lastSignInAt = json['last_sign_in_at'];
    appMetadata = json['app_metadata'] != null ? AppMetadata.fromJson(json['app_metadata']) : null;
    userMetadata = json['user_metadata'] != null ? UserMetadata.fromJson(json['user_metadata']) : null;
    if (json['identities'] != null) {
      identities = <Identities>[];
      json['identities'].forEach((v) {
        identities!.add(Identities.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['aud'] = aud;
    data['role'] = role;
    data['email'] = email;
    data['email_confirmed_at'] = emailConfirmedAt;
    data['phone'] = phone;
    data['confirmed_at'] = confirmedAt;
    data['last_sign_in_at'] = lastSignInAt;
    if (appMetadata != null) {
      data['app_metadata'] = appMetadata!.toJson();
    }
    if (userMetadata != null) {
      data['user_metadata'] = userMetadata!.toJson();
    }
    if (identities != null) {
      data['identities'] = identities!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class AppMetadata {
  String? provider;
  List<String>? providers;
  String? tenantId;
  String? uId;

  AppMetadata({this.provider, this.providers, this.tenantId, this.uId});

  AppMetadata.fromJson(Map<String, dynamic> json) {
    provider = json['provider'];
    providers = json['providers'].cast<String>();
    tenantId = json['tenant_id'];
    uId = json['u_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['provider'] = provider;
    data['providers'] = providers;
    data['tenant_id'] = tenantId;
    data['u_id'] = uId;
    return data;
  }
}

class UserMetadata {
  String? phone;
  int? referrerId;
  int? tenantId;

  UserMetadata({this.phone, this.referrerId, this.tenantId});

  UserMetadata.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    referrerId = json['referrer_id'];
    tenantId = json['tenant_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['referrer_id'] = referrerId;
    data['tenant_id'] = tenantId;
    return data;
  }
}

class Identities {
  String? id;
  String? userId;
  IdentityData? identityData;
  String? provider;
  String? lastSignInAt;
  String? createdAt;
  String? updatedAt;

  Identities({this.id, this.userId, this.identityData, this.provider, this.lastSignInAt, this.createdAt, this.updatedAt});

  Identities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    identityData = json['identity_data'] != null ? IdentityData.fromJson(json['identity_data']) : null;
    provider = json['provider'];
    lastSignInAt = json['last_sign_in_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    if (identityData != null) {
      data['identity_data'] = identityData!.toJson();
    }
    data['provider'] = provider;
    data['last_sign_in_at'] = lastSignInAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class IdentityData {
  String? email;
  String? sub;

  IdentityData({this.email, this.sub});

  IdentityData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    sub = json['sub'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['sub'] = sub;
    return data;
  }
}
