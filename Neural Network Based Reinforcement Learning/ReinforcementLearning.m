function nn=ReinforcementLearning
    % A full neural network based reinforcement learning pipeline
    %
    % Output:
    % - nn: a variable storing a neural network with the updated weights after full training.

    %% Initial Parameters
    epsilon=0.5;

    rows=7; cols=7;
    walls=[2 4; 3 4; 4 4; 5 4];
    cur_row=2; cur_col=1; rot_idx=1;

    %% Create A Start state
    start_S=MakeState(rows,cols,walls,cur_row,cur_col,rot_idx);

    %% Network Initialization
    load('RL_nn_500.mat');

    N=100;

    %% loop N times
    for i=1:N
        %% Resetting to a start state
        S= start_S;
        cur_row= 2; cur_col= 1; rot_idx= 1;

        while isGoal(S) == 0

            %% Picking action
            action= pickAction(S,cur_row,cur_col,rot_idx,nn,epsilon);

            %% Getting a reward
            reward= GetReward(S,cur_row,cur_col,rot_idx,action);

            %% Transitioning to a New State
            [new_S,new_rot_idx,new_row,new_col]= MakeNextState(S,cur_row,cur_col,rot_idx,action);

            %% Deep Q-Learning
            nn= DeepQLearning(action,reward,S,new_S,nn);

            %% Updating state and other variables
            if reward >= 0
                S= new_S;
                cur_row= new_row;
                cur_col= new_col;
                rot_idx= new_rot_idx;
            end

        end

    end


end
