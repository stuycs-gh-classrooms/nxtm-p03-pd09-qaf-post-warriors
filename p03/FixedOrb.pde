class FixedOrb extends Orb
{

  /**
used for making fixed orbs with a fixed colour that you want to place and give specific mass to
   */
  FixedOrb(float x, float y, float s, float m)
  {
    super(x, y, s, m);
     color r=color(255,0,0);
    color g=color(0,255,0);
    color c0 = lerpColor(r,g,charge/6+0.5);
c = c0;
  }

  /**
used for making fixed orbs with a fixed colour placed randomly
   */
  FixedOrb()
  {
    super();
     color r=color(255,0,0);
    color g=color(0,255,0);
    color c0 = lerpColor(r,g,charge/6+0.5);
c = c0;
  }

  /**
overrides move so that the fixed orb never moves
   */
  void move(boolean bounce)
  {
    //do nothing
  }
}//fixedOrb
