import 'package:cleanoauth2/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final int? version;
  final bool? active;
  final int? createdBy;
  final String? createdDate;
  final int? lastModifiedBy;
  final String? lastModifiedDate;
  final bool? principal;
  final String? sid;

  //final Cooperator cooperator;
  final String? isEnabled;
  final String? username;
  final String? provider;

  //final List<GroupMap> groupMaps;
  final bool? enabled;
  final bool? accountNonExpired;
  final bool? accountNonLocked;
  final bool? credentialsNonExpired;
  final String? modifiedDate;
  final String? fullName;

  UserModel(
      {required this.id,
      this.version,
      this.active,
      this.createdBy,
      this.createdDate,
      this.lastModifiedBy,
      this.lastModifiedDate,
      this.principal,
      this.sid,
      this.isEnabled,
      this.username,
      this.provider,
      this.enabled,
      this.accountNonExpired,
      this.accountNonLocked,
      this.credentialsNonExpired,
      this.modifiedDate,
      this.fullName});

  //Convierte un JSON en un UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"],
        version: json["version"],
        active: json["active"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        lastModifiedBy: json["lastModifiedBy"],
        lastModifiedDate: json["lastModifiedDate"],
        principal: json["principal"],
        sid: json["sid"],
        isEnabled: json["isEnabled"],
        username: json["username"],
        provider: json["provider"],
        enabled: json["enabled"],
        accountNonExpired: json["accountNonExpired"],
        accountNonLocked: json["accountNonLocked"],
        credentialsNonExpired: json["credentialsNonExpired"],
        modifiedDate: json["modifiedDate"],
        fullName: json["fullNamejson"]);
  }

  //Convierte un UserModel en un JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "version": version,
      "active": active,
      "createdBy": createdBy,
      "createdDate": createdDate,
      "lastModifiedBy": lastModifiedBy,
      "lastModifiedDate": lastModifiedDate,
      "principal": principal,
      "sid": sid,
      "isEnabled": sid,
      "username": username,
      "provider": provider,
      "enabled": enabled,
      "accountNonExpired": accountNonExpired,
      "accountNonLocked": accountNonLocked,
      "credentialsNonExpired": credentialsNonExpired,
      "modifiedDate": modifiedDate,
      "fullName": fullName
    };
  }

  // Convierte un UserModel en una entidad User
  User toEntity() {
    return User(
        id: id,
        version: version,
        active: active,
        createdBy: createdBy,
        createdDate: createdDate,
        lastModifiedBy: lastModifiedBy,
        lastModifiedDate: lastModifiedDate,
        principal: principal,
        sid: sid,
        isEnabled: isEnabled,
        username: username,
        provider: provider,
        enabled: enabled,
        accountNonExpired: accountNonExpired,
        accountNonLocked: accountNonLocked,
        credentialsNonExpired: credentialsNonExpired,
        modifiedDate: modifiedDate,
        fullName: fullName);
  }

  @override
  List<Object?> get props => [
        id,
        version,
        active,
        createdBy,
        createdDate,
        lastModifiedBy,
        lastModifiedDate,
        principal,
        sid,
        isEnabled,
        username,
        provider,
        enabled,
        accountNonExpired,
        accountNonLocked,
        credentialsNonExpired,
        modifiedDate,
        fullName
      ];
}
