import 'user.dart';

class Doctor extends User {
  String registrationNumber;
  String hospitalName;
  String specialization;
  bool likeFlag;
  int likeCount;

  Doctor({this.registrationNumber, this.hospitalName, this.specialization,
      String userName, String email, String city, DateTime dateOfBirth, String fullName,
      String type, String bio = ""}) : super(
    userName : userName,
    dateTimeOfBirth : dateOfBirth,
    fullName : fullName,
    email : email,
    location : city,
    bio : bio
  );
}
