import 'package:equatable/equatable.dart';

class User extends Equatable{

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

  User({
       required this.id,
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