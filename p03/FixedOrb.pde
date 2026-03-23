class FixedOrb extends Orb
{

  /**
used for making fixed orbs with a fixed colour that you want to place and give specific mass to
   */
  FixedOrb(float x, float y, float s, float m)
  {
    super(x, y, s, m);
    c = color(255, 0, 0);
  }

  /**
used for making fixed orbs with a fixed colour placed randomly
   */
  FixedOrb()
  {
    super();
    c = color(255, 0, 0);
  }

  /**
overrides move so that the fixed orb never moves
   */
  void move(boolean bounce)
  {
    //do nothing
  }
}//fixedOrb
