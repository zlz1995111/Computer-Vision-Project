function R = rodrigues(r)
% rodrigues:

% Input:
%   r - 3x1 vector
% Output:
%   R - 3x3 rotation matrix
theta = sqrt(r'*r);
u = r/theta;
K = [0,-u(3),u(2);u(3),0,-u(1);-u(2),u(1),0];
I = [1,0,0;0,1,0;0,0,1];
R = I+sin(theta)*K+(1-cos(theta))*(K)*(K');

end
