clear all;
clc;

[I1, I2, I3, I4] = test_images();
[I_x, I_y] = grad2d(I2);
I_t = I1-I2;

I_x = I_x(:,2:end-1);
I_y = I_y(:,2:end-1);
I_t = I_t(:,2:end-1);

d = estimate_displacement(I_x,I_y,I_t)
