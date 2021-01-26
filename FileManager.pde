public ArrayList<PVector> loadCSV() {
  Table table = loadTable("targetballdata.csv", "header");
  ArrayList<PVector> pos = new ArrayList<PVector>();
  for(TableRow row: table.rows()) {
    pos.add(new PVector(row.getInt("x"), row.getInt("y")));
  }
  return pos;
}

public void saveHighScores(int[] scores) {
  saveStrings("data/highscores.txt", str(scores));
}

public int[] loadHighScores() {
  File f = new File(dataPath("highscores.txt"));
  if(f.isFile()) {
    return int(loadStrings(f));
  } else {
    return new int[]{0,0,0,0,0,0,0,0,0,0};
  }
}
