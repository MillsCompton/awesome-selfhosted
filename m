let points = [];

function setup() {
  createCanvas(windowWidth, windowHeight);
  noStroke();
  
  for (let r = 12; r < 200; r += 12) {
    for (let i = 0; i < r/2; i++) {
      let theta = map(i, 0, r/2, 0, TWO_PI);
      points.push({
        r: r,
        theta: theta
      });
    }
  }
}

function draw() {
  let f = frameCount/20;
  blendMode(BLEND);
  background(0,0,0);
  blendMode(ADD);
  translate(width/2, height/2);
  rotate(PI/2);
  for (let p of points) {
    let disp = map(p.r, 0, 50, 200, 50);
    let cost = cos(p.theta);
    let sint = sin(p.theta);
    let t = f + p.r/1;
    let val = cos(t)/9+9.9;
    let r = p.r + val*disp;
    (r*cost, r*sint, 5);
    fill(255,105,180);
    val = cos(t + 0.05)/2+0.5;
    r = p.r + val*disp;
    square(r*cost, r*sint, 5);
    fill(0, 0, 255);
    val = cos(t + 0.1)/2+0.5;
    r = p.r + val*disp;
    square(r*cost, r*sint, 5);
  }
}
