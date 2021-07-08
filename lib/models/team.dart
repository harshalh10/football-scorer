class GoalByPlayer {
  int goalByPlayer = 0;
  List times = [];
  GoalByPlayer(this.goalByPlayer);
}

class Team {
  final String name;
  final int inTeamPlayers;
  final int subs;
  Team(this.name, this.inTeamPlayers, this.subs);
  int passes = 0;
  int fouls = 0;
  int yellowCards = 0;
  int redCards = 0;
  int offsides = 0;
  int corners = 0;
  Map<String, GoalByPlayer> goals = new Map();
  int teamGoals = 0;

  // void addGoal(String playerName) {
  //   bool containsKey = this.goals.containsKey(playerName);
  //   if (containsKey) {
  //     this.goals.update(playerName, (value) {
  //       value.goalByPlayer = value.goalByPlayer + 1;
  //       return value;
  //     });
  //   } else {
  //     this.goals[playerName] = new GoalByPlayer(1);
  //   }
  //   this.teamGoals = 0;
  //   this.goals.values.forEach((element) {
  //     this.teamGoals = this.teamGoals + element.goalByPlayer;
  //   });
  // }
}
