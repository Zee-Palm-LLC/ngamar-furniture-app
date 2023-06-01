import 'package:ngamar/app/data/constants/app_assets.dart';

class UserModel {
  String id;
  String name;
  String email;
  String profilePic;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePic,
  });
}

UserModel dummyUser = UserModel(
  id: '1',
  name: 'Jhone Arent',
  email: '',
  profilePic: AppAssets.kProfilePic,
);
