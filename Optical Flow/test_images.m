function [I1, I2, I3, I4] = test_images()
	I1 = repmat(1:20,20,1);
	I2 = [0, 0, 0, 1:17 ];
	I2 = repmat(I2,20,1);

	I3 = I1 + I1';
	I4 = I2 + I2';
end
