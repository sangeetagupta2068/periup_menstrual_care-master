class MenstrualStoryPost {
  String authorName;
  String userEmail;
  String photoUrl;
  String content;
  String dateTimeOfPost;
  bool likeFlag = false;
  int likeCount = 0;

  MenstrualStoryPost(
      {this.authorName,
      this.userEmail,
      this.photoUrl,
      this.content,
      this.dateTimeOfPost});
}
