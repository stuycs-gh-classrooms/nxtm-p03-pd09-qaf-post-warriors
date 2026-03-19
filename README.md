[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/OwTRjgv_)
## Project 00
### NeXTCS
### Period: 9
## Thinker0: Jaima Zara
## Thinker1: Siqing Huang 
## Thinker2: Andrew Olszak 
---

This project will be completed in phases. The first phase will be to work on this document. Use github-flavoured markdown. (For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) )

All projects will require the following:
- Researching new forces to implement.
- Method for each new force, returning a `PVector`  -- similar to `getGravity` and `getSpring` (using whatever parameters are necessary).
- A distinct demonstration for each individual force (including gravity and the spring force).
- A visual menu at the top providing information about which simulation is currently active and indicating whether movement is on or off.
- The ability to toggle movement on/off
- The ability to toggle bouncing on/off
- The user should be able to switch _between_ simluations using the number keys as follows:
  - `1`: Gravity
  - `2`: Spring Force
  - `3`: Drag
  - `4`: Custom Force
  - `5`: Combination


## Phase 0: Force Selection, Analysis & Plan
---------- 

#### Custom Force: Electric Force

### Custom Force Formula
What is the formula for your force? Including descriptions/definitions for the symbols. (You may include a picture of the formula if it is not easily typed.)

F=(|q1|*|q2|)/r^2 * ke
r= distance between objects
q= charge of each object
ke= Electrostatic constant = 9.0 x 10^9

### Custom Force Breakdown
- What information that is already present in the `Orb` or `OrbNode` classes does this force use?
  - Position of the orbs to calculate distance

- Does this force require any new constants, if so what are they and what values will you try initially?
  - ke, the electrostatic constant which will be 9.0x10^9

- Does this force require any new information to be added to the `Orb` class? If so, what is it and what data type will you use?
  - Yes, the charge which will be an int

- Does this force interact with other `Orbs`, or is it applied based on the environment?
  - It interacts with other orbs

- In order to calculate this force, do you need to perform extra intermediary calculations? If so, what?
  - No

--- 

### Simulation 1: Gravity
Describe how you will attempt to simulate orbital motion.

There will be a fixed orb in the center with a high mass and all orbs gravitate towards each other using the gravity equation.
Orbs are placed randomly around the screen and can be added or removed.

--- 

### Simulation 2: Spring
Describe what your spring simulation will look like. Explain how it will be setup, and how it should behave while running.

Visible springs will connect each orb to its 2 (or 1) "neighbour(s)". If the orbs are closer to each other than the spring length, they are pushed apart, 
if they are farther than the spring length they are pulled in, and they won't be moved if they are the spring length away from each other.
Orbs are either placed spring length away from each other or randomly around the screen, and can be added or removed.

--- 

### Simulation 3: Drag
Describe what your drag simulation will look like. Explain how it will be setup, and how it should behave while running.

Orbs are placed around the screen randomly and their velocity will decrease according to the drag equation.

--- 

### Simulation 4: Custom force
Describe what your Custom force simulation will look like. Explain how it will be setup, and how it should behave while running.

Orbs are placed around the screen randomly with their colour denoting their charge. They will attract or repel each other according to their charge
and the electrostatic equation.

--- 

### Simulation 5: Combination
Describe what your combination simulation will look like. Explain how it will be setup, and how it should behave while running.

Orbs are placed around the screen randomly and multiple forces will act on the orbs.

