// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContactModel {
  String? name;
  String? email;
  String? subject;
  String? message;

  ContactModel({this.name, this.email, this.subject, this.message});

  ContactModel copyWith({
    String? name,
    String? email,
    String? subject,
    String? message,
  }) {
    return ContactModel(
      name: name ?? this.name,
      email: email ?? this.email,
      subject: subject ?? this.subject,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'subject': subject,
      'message': message,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      subject: map['subject'] != null ? map['subject'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactModel.fromJson(String source) =>
      ContactModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ContactModel(name: $name, email: $email, subject: $subject, message: $message)';
  }

  @override
  bool operator ==(covariant ContactModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.subject == subject &&
        other.message == message;
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ subject.hashCode ^ message.hashCode;
  }
}
