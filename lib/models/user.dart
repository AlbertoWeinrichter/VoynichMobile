class User {
  final String uid;
  final String username;
  final String email;
  final String avatar;

  User(
      {this.uid,
        this.username,
        this.avatar,
        this.email,
      });

  factory User.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    } else {
      final String uid = data['uid'];
      final String username = data['username'] ?? '';
      final String email = data['email'] ?? '';
      final String avatar = data['avatar'] ?? '';

      return User(
        uid: uid,
        username: username,
        email: email,
        avatar: avatar,
      );
    }
  }

  Map<String , dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'avatar': avatar,
    };
  }
}