function S=MakeState(n,m,walls,cur_row,cur_col,rot_idx)
    % Create a current state
    %
    % Input:
    % - n: number of rows in the environment grid
    % - m: number of columns in the environment grid
    % - walls: d x 2 matrix containing (row,column) positions of the walls in the grid
    % - cur_row: the row position of a robot's centroid
    % - cur_col: the column position of a robot's centroid
    % - rot_idx: a scalar indicating which rotation position the robot is currently in
    % Output:
    % - S: n x m matrix storing the state: wall locations should have the values of -1, every position occupied by a robot should have values
    % of 1, the rest of the gridd cells should have zero values. If the
    % provided state is not valid then all the values in S should have zero
    % values

    S=zeros(n,m);

    % Fill in The Wall values
    % ...
    for k=1:size(walls, 1)
      S(walls(k,1), walls(k,2)) = -1;
    end

    coord = zeros(5, 2);

    % Find the locations in the grid occupied by a robot
    if rot_idx==1
       % ...

       coord(1,:) = [cur_row, cur_col];
       coord(2,:) = [cur_row-1, cur_col];
       coord(3,:) = [cur_row-1, cur_col+1];
       coord(4,:) = [cur_row+1, cur_col];
       coord(5,:) = [cur_row+1, cur_col+1];

    elseif rot_idx==2

       coord(1,:) = [cur_row, cur_col];
       coord(2,:) = [cur_row, cur_col-1];
       coord(3,:) = [cur_row, cur_col+1];
       coord(4,:) = [cur_row+1, cur_col-1];
       coord(5,:) = [cur_row+1, cur_col+1];

       % ...
    elseif rot_idx==3

       coord(1,:) = [cur_row, cur_col];
       coord(2,:) = [cur_row-1, cur_col];
       coord(3,:) = [cur_row+1, cur_col];
       coord(4,:) = [cur_row-1, cur_col-1];
       coord(5,:) = [cur_row+1, cur_col-1];
       % ...
    elseif rot_idx==4
        % ...
        coord(1,:) = [cur_row, cur_col];
        coord(2,:) = [cur_row, cur_col-1];
        coord(3,:) = [cur_row, cur_col+1];
        coord(4,:) = [cur_row-1, cur_col-1];
        coord(5,:) = [cur_row-1, cur_col+1];

    end

    for i=1:size(coord, 1)
        row = coord(i, 1);
        col = coord(i, 2);

        if row > n | row < 1
          S = zeros(n,m);
          break;
        elseif col > m | col < 1
          S = zeros(n,m);
          break;
        elseif S(row,col) == -1
          S = zeros(n,m);
          break
        else
          S(row, col) = 1;
    end

end
