// Load x and y coordinates form csv file into a pvector arraylist
public ArrayList<PVector> loadCSV() {
  Table table = loadTable("targetballdata.csv", "header");
  ArrayList<PVector> pos = new ArrayList<PVector>();
  for(TableRow row: table.rows()) {
    pos.add(new PVector(row.getInt("x"), row.getInt("y")));
  }
  return pos;
}

// Save an array of scores in a text file
public void saveHighScores(int[] scores) {
  saveStrings("data/highscores.txt", str(scores));
}

// Load an array of scores from a text file
public int[] loadHighScores() {
  File f = new File(dataPath("highscores.txt"));
  if(f.isFile()) {
    return int(loadStrings(f));
  } else {
    return new int[]{0,0,0,0,0,0,0,0,0,0};
  }
}
