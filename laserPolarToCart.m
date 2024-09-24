function [X, Y] = convertPolarToCartesian(scanData, fov)
    % Input: scanData is the range values, fov is the field of view in degrees
    % Output: X, Y coordinates in Cartesian system
    
    n = length(scanData);                % Number of data points
    angles = linspace(fov(1), fov(2), n);% Generate the corresponding angles
    
    X = zeros(1, n);  % Initialize X array
    Y = zeros(1, n);  % Initialize Y array
    
    % Convert each polar coordinate to Cartesian
    for i = 1:n
        angle_rad = angles(i) * pi / 180;  % Convert angle to radians
        X(i) = scanData(i) * cos(angle_rad); % X = r * cos(theta)
        Y(i) = scanData(i) * sin(angle_rad); % Y = r * sin(theta)
    end
end


% -------------- Sample Quiz 2 - Question 8 --------------

disp("-------------- Sample Quiz 2 - Question 8 --------------");

% Laser scan data and field of view
scanData = [17, 16, 15, 13, 14, 15, 16, 17];
fov = [-78, 78];  % Field of view in degrees

% Call the function to convert to Cartesian coordinates
[X, Y] = convertPolarToCartesian(scanData, fov);

% Display the result
disp('X coordinates:');
disp(X);
disp('Y coordinates:');
disp(Y);


% -------------- Quiz 2 - Question 1--------------

disp("-------------- Quiz 2 - Question 1- --------------");

% Laser scan data and field of view
scanData = [4.242, 3.543, 3.178, 3.018, 3.018, 3.178, 3.543, 4.242];
fov = [-45, 45];  % Field of view in degrees

% Call the function to convert to Cartesian coordinates
[X, Y] = convertPolarToCartesian(scanData, fov);

% Display the result
disp('X coordinates:');
disp(X);
disp('Y coordinates:');
disp(Y);
