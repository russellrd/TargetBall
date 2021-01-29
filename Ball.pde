class Ball {

  private PVector acceleration = new PVector(0, 0);
  private PVector position = new PVector(0, 0);
  private PVector velocity = new PVector(0, 0);
  private PVector force = new PVector(0, 0);
  private float drag = 0;
  private float mass = 0;

  public Ball(PVector a, PVector p, PVector v) {
    this.acceleration = a;
    this.position = p;
    this.velocity = v;
  }


  public void update() {
  }

  public PVector getA() {
    return this.acceleration;
  }

  public PVector getP() {
    return this.position;
  }

  public PVector getV() {
    return this.velocity;
  }
}
