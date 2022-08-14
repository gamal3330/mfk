class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  List? bmi;

  UserModel({this.name, this.email, this.phone , this.uId , this.bmi});

  Map<String, dynamic> toJson() => {
        'uId' : uId,
        'name': name,
        'email': email,
        'phone': phone,
         'bmi' : bmi
      };

  static UserModel fromJson(Map<String, dynamic>? json) => UserModel(
        uId: json?['uId'] ,
        name: json?['name'],
        email: json?['email'],
        phone: json?['phone'],
        bmi: json?['bmi'],

      );
}
