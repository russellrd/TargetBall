public ArrayList<Position> loadCSV() {
  Table table = loadTable("targetballdata.csv", "header");
  ArrayList<Position> pos = new ArrayList<Position>();
  for(TableRow row: table.rows()) {
    pos.add(new Position(row.getInt("x"), row.getInt("y")));
  }
  return pos;
}

public void saveHighScores(int[] scores) {
  saveStrings("highscores.txt", str(scores));
}

public int[] loadHighScores() {
  return int(loadStrings("highscores.txt"));
}
