function [u, v] = projectToImagePlane(X_c, Y_c, Z_c, f_x, f_y, c_x, c_y)
    % Function to project a 3D point (X_c, Y_c, Z_c) in the camera coordinate frame
    % onto a 2D image plane using the given focal lengths and principal point
    
    % Inputs:
    %   X_c, Y_c, Z_c - Coordinates of the 3D point in the camera coordinate frame
    %   f_x, f_y      - Focal lengths in the x and y directions
    %   c_x, c_y      - Principal point coordinates in the image plane
    
    % Outputs:
    %   u, v - The 2D coordinates of the image point on the image plane
    
    % Calculate the image coordinates (u, v)
    u = (f_x * X_c / Z_c) + c_x;
    v = (f_y * Y_c / Z_c) + c_y;
    
    % Display the result
    fprintf('The image point coordinates are: (u, v) = (%.2f, %.2f)\n', u, v);
end

% -------------- Sample Quiz 1 - Question 11 --------------
% Define the inputs
X_c = -20;
Y_c = 40;
Z_c = 90;
f_x = 952;
f_y = 936;
c_x = 524;
c_y = 376;

% Call the function
[u, v] = projectToImagePlane(X_c, Y_c, Z_c, f_x, f_y, c_x, c_y);

% -------------- Sample Quiz 1 - Question 13 --------------
% Define the new 3D point in the camera coordinate frame
X_c = 15;
Y_c = -21;
Z_c = 90;

% Use the same camera parameters from earlier (focal lengths and principal point)
f_x = 952;
f_y = 936;
c_x = 524;
c_y = 376;

% Call the function to project the point onto the image plane
[u, v] = projectToImagePlane(X_c, Y_c, Z_c, f_x, f_y, c_x, c_y);


