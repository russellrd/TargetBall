public ArrayList<PVector> loadCSV() {
  Table table = loadTable("targetballdata.csv", "header");
  ArrayList<PVector> pos = new ArrayList<PVector>();
  for(TableRow row: table.rows()) {
    pos.add(new PVector(row.getInt("x"), row.getInt("y")));
  }
  return pos;
}

public void saveHighScores(int[] scores) {
  saveStrings("highscores.txt", str(scores));
}

public int[] loadHighScores() {
  return int(loadStrings("highscores.txt"));
}
