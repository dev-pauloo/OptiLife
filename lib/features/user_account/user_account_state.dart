class UserAccountState {
  String name;
  String? profilePictureUrl;
  String weight;
  String height;
  var dob;

  UserAccountState(
      {required this.name,
      this.profilePictureUrl,
      required this.weight,
      required this.height,
      required this.dob});
}
