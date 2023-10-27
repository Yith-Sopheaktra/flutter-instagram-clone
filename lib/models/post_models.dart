class PostModel {
  int postID;
  String name;
  String caption;
  String image;
  String NickName;

  PostModel({
    required this.postID,
    this.name = "No-Name",
    this.caption = "No-Caption",
    this.image = "No-Image",
    this.NickName = "No-NickName"
  });
}
