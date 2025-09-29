class KycModel {
  int? id;
  String hospitalName;
  String doctorName;
  String specialization;
  String hospitalType;
  String country;
  String state;
  String city;
  String hospitalAddress;
  String contact;
  String email;
  String notes;

  KycModel({
    this.id,
    required this.hospitalName,
    required this.doctorName,
    required this.specialization,
    required this.hospitalType,
    required this.country,
    required this.state,
    required this.city,
    required this.hospitalAddress,
    required this.contact,
    required this.email,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'hospitalName': hospitalName,
      'doctorName': doctorName,
      'specialization': specialization,
      'hospitalType': hospitalType,
      'country': country,
      'state': state,
      'city': city,
      'hospitalAddress': hospitalAddress,
      'contact': contact,
      'email': email,
      'notes': notes,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  factory KycModel.fromMap(Map<String, dynamic> map) {
    return KycModel(
      id: map['id'],
      hospitalName: map['hospitalName'],
      doctorName: map['doctorName'],
      specialization: map['specialization'],
      hospitalType: map['hospitalType'],
      country: map['country'],
      state: map['state'],
      city: map['city'],
      hospitalAddress: map['hospitalAddress'],
      contact: map['contact'],
      email: map['email'],
      notes: map['notes'],
    );
  }
}
