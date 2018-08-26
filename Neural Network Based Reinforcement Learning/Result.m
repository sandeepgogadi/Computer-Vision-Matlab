clear all;
clc;

nn=ReinforcementLearning();
action_path=Prediction(nn);
number_of_actions_taken=size(action_path,1)
