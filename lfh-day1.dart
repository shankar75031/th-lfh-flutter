List<User> users = [];

class User {
  String name;
  List<String> intrests = [];
  bool isMentor;
  DateTime timeAvailable;

  User(String name) {
    this.name = name;
    this.intrests = [];
    this.isMentor = false;
    this.timeAvailable = null;
  }

  void addStack(String intrest) {
    this.intrests.add(intrest);
  }

  void setMentorOrLearner(bool isMentor) {
    this.isMentor = isMentor;
  }

  void setAvailableTime(DateTime timeAvailable) {
    this.timeAvailable = timeAvailable;
  }
}

List<User> getMentor(String intrest, DateTime requiredTime) {
  var resultList = users.where((user) => (user.isMentor &&
      user.timeAvailable == requiredTime &&
      user.intrests.any((element) => element == intrest)));
  return resultList.toList();
}

void main() {
  var mentorA = User("Mentor A");
  mentorA.addStack("Flutter");
  mentorA.addStack("Android Development");
  mentorA.addStack("Game Development");
  mentorA.setMentorOrLearner(true);
  mentorA.setAvailableTime(new DateTime.now());
  users.add(mentorA);

  var learnerA = User("Learner A");
  learnerA.addStack("Web Development");
  learnerA.setMentorOrLearner(false);
  users.add(learnerA);

  var mentorB = User("Mentor B");
  mentorB.addStack("Web Development");
  mentorB.setMentorOrLearner(true);
  mentorB.setAvailableTime(new DateTime.now());
  users.add(mentorB);

  var learnerB = User("Learner B");
  learnerB.addStack("Flutter");
  learnerB.setMentorOrLearner(false);
  users.add(learnerB);

  var mentorC = User("Mentor C");
  mentorC.addStack("Flutter");
  mentorC.addStack("Web Development");
  mentorC.addStack("Python Django");
  mentorC.addStack("Node.js");
  mentorC.setMentorOrLearner(true);
  mentorC.setAvailableTime(DateTime.parse("1969-07-20 20:18:04Z"));
  users.add(mentorC);

  var learnerC = User("Learner C");
  learnerC.addStack("Flutter");
  learnerC.setMentorOrLearner(false);
  users.add(learnerC);

  var resultList = getMentor("Flutter", DateTime.parse("1969-07-20 20:18:04Z"));
  for (var user in resultList) {
    print(user.name);
  }
}
