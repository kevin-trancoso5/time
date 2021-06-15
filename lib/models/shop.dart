import 'package:equatable/equatable.dart';

class Shop extends Equatable {
  final int? id;
  final String? verified;
  final String? name;
  final String? address;
  final List<double>? position;
  final int? idUser;
  final String? type;
  final List<DateTime>? hours;

  const Shop({
    this.id,
    this.verified,
    this.name,
    this.address,
    this.position,
    this.idUser,
    this.type,
    this.hours,
  });

  Shop copyWith(
      {int? id,
      String? verified,
      String? name,
      String? address,
      List<double>? position,
      int? idUser,
      String? type,
      List<DateTime>? hours}) {
    return Shop(
      id: id ?? this.id,
      verified: verified ?? this.verified,
      name: name ?? this.name,
      address: address ?? this.address,
      position: position ?? this.position,
      idUser: idUser ?? this.idUser,
      type: type ?? this.type,
      hours: hours ?? this.hours,
    );
  }

  Shop.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        verified = json['verified'],
        name = json['name'],
        address = json['address'],
        position = json['position'],
        idUser = json['idUser'],
        type = json['type'],
        hours = json['hours'];

  @override
  String toString() {
    return 'Shop { id: $id,' + ' | name: $name' + ' | address: $address}';
  }

  @override
  List<Object?> get props => [
        this.id,
        this.verified,
        this.name,
        this.address,
        this.position,
        this.idUser,
        this.type,
        this.hours,
      ];
}
