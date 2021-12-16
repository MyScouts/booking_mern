class ActivityModel {
  final String userName;
  final String imageUrl;
  ActivityModel({required this.imageUrl, required this.userName});
}

fakeActivityData() {
  return [
    new ActivityModel(
        imageUrl: "assets/images/user1.jpg", userName: "Huy Hoang Tran"),
    new ActivityModel(imageUrl: "assets/images/user2.jpg", userName: "Jhon"),
    new ActivityModel(
        imageUrl: "assets/images/user3.jpg", userName: "Maria Cultala"),
    new ActivityModel(
        imageUrl: "assets/images/user4.jpg", userName: "Alex Regex"),
    new ActivityModel(
        imageUrl: "assets/images/user5.jpg", userName: "David Ken"),
    new ActivityModel(
        imageUrl: "assets/images/user6.jpg", userName: "Maria Cultala"),
    new ActivityModel(
        imageUrl: "assets/images/user7.jpg", userName: "Alex Regex"),
    new ActivityModel(
        imageUrl: "assets/images/user8.jpg", userName: "David Ken"),
    new ActivityModel(
        imageUrl: "assets/images/user9.jpg", userName: "Maria Cultala"),
    new ActivityModel(
        imageUrl: "assets/images/user10.jpg", userName: "Alex Regex")
  ];
}
