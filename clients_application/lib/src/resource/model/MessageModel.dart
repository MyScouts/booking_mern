class MessageModel {
  final String messageName;
  final String message;
  final String imageUrl;
  MessageModel(
      {required this.imageUrl,
      required this.message,
      required this.messageName});
}

fakeListMessages() {
  return [
    new MessageModel(
        messageName: "Huy Hoang Tran",
        imageUrl: "assets/images/user1.jpg",
        message: "Ipsum occaecat id labore duis mollit cupidatat."),
    new MessageModel(
        messageName: "Maria Cultala",
        imageUrl: "assets/images/user2.jpg",
        message:
            "Veniam pariatur voluptate sint irure Lorem consequat dolore veniam consequat. Ut labore consectetur aliquip qui reprehenderit velit laboris consectetur. Tempor mollit duis quis anim sint deserunt sunt ullamco fugiat aute aliquip aute non proident. Ea consequat eu ipsum non."),
    new MessageModel(
        messageName: "Alex Regex",
        imageUrl: "assets/images/user3.jpg",
        message:
            "Sunt est voluptate esse proident esse eiusmod est adipisicing esse mollit voluptate. Excepteur ut non dolor culpa aliqua dolore. Esse adipisicing id consectetur anim sunt mollit dolore amet. Dolor ex tempor ipsum nisi et et sit sint voluptate mollit labore duis ut. Et sint cupidatat ipsum sint consequat."),
    new MessageModel(
        messageName: "David Ken",
        imageUrl: "assets/images/user4.jpg",
        message:
            "Fugiat reprehenderit non do eiusmod Lorem nulla duis aliqua fugiat consectetur fugiat deserunt anim laboris."),
    new MessageModel(
        messageName: "Maria Cultala",
        imageUrl: "assets/images/user5.jpg",
        message: "Fugiat amet laborum Lorem irure amet et."),
    new MessageModel(
        messageName: "Alex Regex",
        imageUrl: "assets/images/user6.jpg",
        message:
            "Enim sit sint duis exercitation deserunt adipisicing laboris exercitation quis consequat et officia aliquip aliquip."),
    new MessageModel(
        messageName: "David Ken",
        imageUrl: "assets/images/user7.jpg",
        message:
            "Aliquip sit anim magna aliquip sit laborum laborum consequat sunt minim sunt consequat."),
    new MessageModel(
        messageName: "Maria Cultala",
        imageUrl: "assets/images/user8.jpg",
        message: "Consequat ullamco amet eu aliqua Lorem esse."),
    new MessageModel(
        messageName: "Huy Hoang Tran",
        imageUrl: "assets/images/user9.jpg",
        message: "Voluptate consectetur duis laborum nulla et."),
    new MessageModel(
        messageName: "David Ken",
        imageUrl: "assets/images/user10.jpg",
        message:
            "Qui fugiat qui ipsum aliqua dolore sit irure magna non nostrud.")
  ];
}
