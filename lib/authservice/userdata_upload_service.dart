class UserdataUploadService {
  // Store user details across screens
  String? name;
  String? role;
  int? rollNo;
  String? email;

  // Singleton pattern so you can access the same instance from anywhere
  static final UserdataUploadService _instance =
      UserdataUploadService._internal();
  factory UserdataUploadService() => _instance;
  UserdataUploadService._internal();

  // Method to clear data
  void clear() {
    name = null;
    role = null;
    rollNo = null;
    email = null;
  }

  // Optional: Check if all fields are filled
  bool get isComplete => name != null && role != null && rollNo != null;
}
