class UserModel{
  String? name;
  String? phone;
  String? email;
  String? uid;
  String? sellerCategory;
  String? sellerLocation;
  String? sellerName;
  String? sellerAddress;
  String? sellerPhone;
  String? sellerPonno;
  String? sellerCondition;
  String? sellerPrice;
  String? sellerDescription;



  UserModel({this.name,
     this.phone,
     this.email,
    this.uid,
    this.sellerCategory,
    this.sellerLocation,
    this.sellerName,
    this.sellerAddress,
    this.sellerPhone,
    this.sellerPonno,
    this.sellerPrice,
    this.sellerDescription,

    });

  factory UserModel.fromMap(map){
    return UserModel(
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      uid: map['sellerLocation'],
      sellerName: map['sellerName'],
      sellerAddress: map['sellerAddress'],
      sellerPhone: map['sellerPhone'],
      sellerPonno: map['sellerPonno'],
      sellerPrice: map['sellerPrice'],
      sellerDescription: map['sellerDescription'],
      sellerCategory: map['sellerCategory'],
    );
  }

  Map<String , dynamic> toMap(){
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone':phone,
      'sellerDescription':sellerDescription,
      'sellerPrice':sellerPrice,
      'sellerPonno':sellerPonno,
      'sellerPhone':sellerPhone,
      'sellerAddress':sellerAddress,
      'sellerName':sellerName,
      'sellerLocation':sellerLocation,
      'sellerCategory':sellerCategory,

    };
  }

}