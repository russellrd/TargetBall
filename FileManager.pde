// Load x and y coordinates of two objects form csv file into a Data arraylist
public ArrayList<Data> loadCSV() {
  Table table = loadTable("targetballdata.csv", "header");
  ArrayList<Data> d = new ArrayList<Data>();
  for(TableRow row: table.rows()) {
    d.add(new Data(row.getInt("x1"), row.getInt("y1"), row.getInt("x2"), row.getInt("y2")));
  }
  return d;
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
