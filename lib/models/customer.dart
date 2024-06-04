
class Customer {
  final int? cID;
  final String cName;
  final String cEmail;
  final String cState;

  Customer({
    this.cID,
    required this.cName,
    required this.cEmail,
    required this.cState
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      cID: json['C_ID']??0,
      cName: json['C_Name']?? '',
      cEmail: json['C_Email']?? '',
      cState: json['C_State']?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'c_name': cName,
      'c_email': cEmail,
      'c_state': cState,
    };

  }
  Map<String, dynamic> toJsonALL() {
    return {
      'C_ID': cID,
      'C_Name': cName,
      'C_Email': cEmail,
      'C_State': cState,
    };

  }
}
