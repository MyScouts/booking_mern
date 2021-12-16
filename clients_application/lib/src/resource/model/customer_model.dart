import 'package:flutter_app/src/resource/model/serializable.dart';

class CustomerModel extends Serialzeliable {
  String? id;
  String? customerName;
  String? customerSlogan;
  String? address;
  String? email;
  String? description;
  String? logo;

  CustomerModel(
      {this.id,
      this.address,
      this.customerName,
      this.customerSlogan,
      this.description,
      this.email,
      this.logo});

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
        id: json['_id'],
        address: json['address'],
        customerName: json['customer_name'],
        customerSlogan: json['customer_slogan'],
        description: json['description'],
        email: json['email'],
        logo: json['logo']);
  }

  @override
  Map<String, dynamic> toJson() => {
        "id": this.id,
        "address": this.address,
        "customerName": this.customerName,
        "customerSlogan": this.customerSlogan,
        "description": this.description,
        "email": this.email,
        "logo": this.logo
      };

  static CustomerModel fromJsonModel(Map<String, dynamic> json) =>
      CustomerModel.fromJson(json);
}
