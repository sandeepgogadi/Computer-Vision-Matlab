function is_goal=isGoal(S)
    % Check if a current state is a goal state
    %
    % Input:
    % - S: n x m matrix that stores a current state
    % Output:
    % - is_goal: a binary variable with a value of 1 if S is the goal state, and 0 otherwise

    if S(6,6) == 0 & S(5,6) == 1 & S(7,6) == 1
      is_goal= S(7, 7);
    else
      is_goal = 0;
    end

end
