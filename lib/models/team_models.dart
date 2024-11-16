class TeamModels {
  String teamName;
  String teamRole;
  String picturePath;

  TeamModels({
    required this.teamName,
    required this.teamRole,
    required this.picturePath,
  });

  static List<TeamModels> getTeam() {
    List<TeamModels> team = [];

    team.add(
      TeamModels(
        teamName: 'Reinier Luna',
        teamRole: 'Leader',
        picturePath: 'assets/team_avatar/luna.jpg',
      ),
    );

    team.add(
      TeamModels(
        teamName: 'Kim Bautista',
        teamRole: 'Member',
        picturePath: 'assets/team_avatar/kim.jpg',
      ),
    );

    team.add(
      TeamModels(
        teamName: 'Vency Capistrano',
        teamRole: 'Member',
        picturePath: 'assets/team_avatar/gyro.jpg',
      ),
    );

    team.add(
      TeamModels(
        teamName: 'Gian Gersaniba',
        teamRole: 'Member',
        picturePath: 'assets/team_avatar/gian.jpg',
      ),
    );

    return team;
  }
}
