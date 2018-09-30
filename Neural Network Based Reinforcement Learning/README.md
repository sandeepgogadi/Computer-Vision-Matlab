[back to Robotics Playground](https://github.com/sandeepgogadi/Robotics-Playground)

[back to Computer Vision Matlab](https://github.com/sandeepgogadi/Computer-Vision-Matlab)

# Neural Network based Reinforcement Learning

Imagine a robot that is deployed in an unfamiliar environment and has to reach a certain goal by navigating in this environment. The entire environment where the robot navigates can be viewed as a 2D grid illustrated below:

![alt text](https://github.com/sandeepgogadi/Computer-Vision-Matlab/blob/master/Neural%20Network%20Based%20Reinforcement%20Learning/2d_map_start.png "Start")

where the yellow structure indicates a robot itself, and a blue color indicates the wall that the robot cannot pass through. Our goal is to achieve the following state:

![alt text](https://github.com/sandeepgogadi/Computer-Vision-Matlab/blob/master/Neural%20Network%20Based%20Reinforcement%20Learning/2d_map_finish.png "Finish")

At every step, the robot can move {up, down, right, left}. Furthermore, the robot can also rotate to one of the following four positions displayed below. The valid transitions include rotating from rotation position 1 to positions 2 and 4, rotating from rotation position 2 to positions 1 and 3, rotating from rotation position 3 to positions 2 and 4, and rotating from rotation position 4 to positions 3 and 1.

![alt text](https://github.com/sandeepgogadi/Computer-Vision-Matlab/blob/master/Neural%20Network%20Based%20Reinforcement%20Learning/rotations.bmp "Positions")

Then, the robot needs to dynamically figure out what is the best way to reach its goal state by continuously exploring the environment and learning about it. We will achieve this goal using a neural network based reinforcement learning scheme.

Intuitively, the main principle of reinforcement learning is as follows. The robot is allowed to navigate across the grid and explore the environment. However, every time the robot hits the wall it receives a negative feedback from the environment. Furthermore, every time the robot reaches the goal state, it receives a reward. Then, our goal is to train a neural network that would examine a current robot's state, and decide what the next action should be. Ideally, we want to select actions, which would have a high probability of leading to the reward and low probability of leading to the negative feedback. In the context of our problem, we want the robot to learn to navigate the environment (select actions) such that it could reach the goal state (reward) without hitting the walls (negative feedback).

### Pipeline

![alt text](https://github.com/sandeepgogadi/Computer-Vision-Matlab/blob/master/Neural%20Network%20Based%20Reinforcement%20Learning/pipeline.png "Pipeline")
