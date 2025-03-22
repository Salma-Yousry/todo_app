class MyUser{
  static const String collectionName = 'users';
  String? name;
  String? id;
  String? email;
  MyUser({required this.id,required this.name,required this.email});

  //json => object
MyUser.fromFireStore(Map<String,dynamic>?date):this(
  id: date!['id'] as String,
  name: date!['name'] as String,
  email: date!['email'] as String
);
 //object => json
Map<String,dynamic> toFireStore(){
  return{
    'id':id,
    'name':name,
    'email':email
  };
}
}