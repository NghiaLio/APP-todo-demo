// ignore_for_file: non_constant_identifier_names

class User{
  String ID;
  String name;
  String NumberPhone;
  Address address;
  String email;
  String Country;
  User({
    required this.ID,
    required this.name, required this.NumberPhone, required this.email, 
    required this.Country, required this.address
  });
}


class Address{
  String address1;
  String address2;
  String address3;
  Address({required this.address1, required this.address2, required this.address3});
}