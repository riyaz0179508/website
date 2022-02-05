class UserModel{
  String? name;
  String? phone;
  String? email;
  String? uid;


  UserModel({this.name,
     this.phone,
     this.email, this.uid
    });

  factory UserModel.fromMap(map){
    return UserModel(
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      uid: map['uid'],
    );
  }

  Map<String , dynamic> toMap(){
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone':phone,

    };
  }

}