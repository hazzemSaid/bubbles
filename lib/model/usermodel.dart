class Usermodel {
  String? name;
  String? email;
  String? image;
  String? uid;
  Usermodel({this.name, this.email, this.image, this.uid});
  Usermodel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    image = json['image'];
    uid = json['uid'];
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'image': image, 'uid': uid};
  }

  @override
  String toString() {
    return 'Usermodel{name: $name, email: $email, image: $image, uid: $uid}';
  }
}
