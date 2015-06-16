function [ w ] = observationLikelihood( x, observation )
% ------------------------------------------------------------------------------------------------------
% function [ w ] = observationLikelihood( x, observation )
%
%  J.L. Blanco - University of Malaga, Spain
% ------------------------------------------------------------------------------------------------------

% ------------------------------------------------------------------------------------------------------
% Copyright (c) 2007  Jose Luis Blanco Claraco.
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy of
% this software and associated documentation files (the "Software"), to deal in
% the Software without restriction, including without limitation the rights to
% use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
% of the Software, and to permit persons to whom the Software is furnished to do
% so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
% ------------------------------------------------------------------------------------------------------

global sensorNoiseStd;

M = size(x,1);
N = size(x,2);  
N0 = N - 3; % The first index of the last "triplet"



errsSq = sum( ( [x(:,N0+1)-observation(1) x(:,N0+2)-observation(2) ] ).^2, 2 );

w = exp(-0.5 * errsSq / (sensorNoiseStd.^2) );

