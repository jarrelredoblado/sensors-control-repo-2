function [X, Y, Z] = projectFromStereoCamera(x_left, y_left, x_right, f, B, c_x, c_y)
    % Function to calculate the 3D point from stereo camera image points
    % Inputs:
    %   x_left, y_left  - 2D image coordinates from the left camera
    %   x_right         - 2D image x-coordinate from the right camera
    %   f               - Focal length of the camera
    %   B               - Baseline (distance between the two cameras)
    %   c_x, c_y        - Principal point coordinates
    %
    % Outputs:
    %   X, Y, Z - The 3D coordinates of the point in the camera coordinate frame

    % Calculate the disparity
    disparity = x_left - x_right;
    
    if disparity == 0
        error('Disparity is zero, cannot calculate depth.');
    end
    
    % Calculate the Z coordinate (depth)
    Z = (f * B) / disparity;
    
    % Calculate the X and Y coordinates
    X = (x_left - c_x) * Z / f;
    Y = (y_left - c_y) * Z / f;
    
    % Display the results
    fprintf('3D point: X = %.2f, Y = %.2f, Z = %.2f\n', X, Y, Z);
end


% -------------- Sample Quiz 1 - Question 16 --------------

% Define the input values
x_left = 450;  % 2D point in the left image (x-coordinate)
y_left = 384;  % 2D point in the left image (y-coordinate)
x_right = 350; % 2D point in the right image (x-coordinate)

f = 1000;      % Focal length
B = 0.15;      % Baseline (distance between the two cameras in meters)
c_x = 512;     % Principal point x-coordinate
c_y = 384;     % Principal point y-coordinate

% Call the function to calculate the 3D point
[X, Y, Z] = projectFromStereoCamera(x_left, y_left, x_right, f, B, c_x, c_y);


% -------------- Sample Quiz 1 - Question 24 --------------

% Define the input values
x_left = 300;  % x-coordinate of the left image point
y_left = 300;  % y-coordinate of the left image point
x_right = 200; % x-coordinate of the right image point

f = 800;       % Focal length
B = 0.2;       % Baseline (distance between the cameras in meters)
c_x = 400;     % Principal point x-coordinate
c_y = 300;     % Principal point y-coordinate

% Call the function to calculate the 3D point
[X, Y, Z] = projectFromStereoCamera(x_left, y_left, x_right, f, B, c_x, c_y);

% Display the result
fprintf('3D Point in left camera frame: X = %.2f, Y = %.2f, Z = %.2f\n', X, Y, Z);
