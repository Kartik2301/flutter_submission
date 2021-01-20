class user_class {
  bool identifier;
  String username;
  String actual_name;
  String description;
  String imageUrl;
  user_class(bool identifier, String username, String actual_name, String description, String imageUrl) {
    this.identifier = identifier;
    this.username = username;
    this.actual_name = actual_name;
    this.description = description;
    this.imageUrl = imageUrl;
  }
}