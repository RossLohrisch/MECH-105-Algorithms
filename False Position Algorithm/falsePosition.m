function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter )

% This function estimates the root of a given function using the false
% position method.

% root = estimated root location
% fx = function evalued at root location
% ea = approximate relative error (%)
% iter = how many iterations were performed to arrive at root
% func = symbolic function user will input in command window prior to
% calling function
% xl = lower guess for root
% xu = upper guess for root
% es = desired relative error user desires
% maxiter = maximum iterations user desires


iter = 0; %set initial number of iterations performed equal to 0. 
if nargin < 3 %check amount of arguments to see if less then 3 arguments were inputted by user
    error('I cant guess your upper and lower bounds. Please input at least 3 values. Signed, computer') %display error prompting user to input at least 3 values
elseif nargin < 4 %check amount of arguments to see if less then 4 arguments were inputted by user
    es = 0.0001; %assign 0.0001 as the default desired relative error 
    maxiter = 200; %assign 200 as the default maximum number of iterations user desires 
elseif nargin <5 %check amount of arguments to see if less then 5 arguments were inputted by user
    maxiter = 200; %assign 200 as the default maximum number of iterations user desires 
end

if sign(func(xl)) == sign(func(xu)) %check if lower and upper guesses for root actually bracket the root
    error('You didnt bracket the root you fool') %inform user they did not bracket the root
end

ea = 10000; %initialize a very large approximate relative error to ensure loop does terminate early
oldroot = xu; %assign xu to a new variable "oldroot"

while es < ea && maxiter >= iter; %create conditional statement that runs loop as long as the desired relative error is smaller than the approximate relative error and as long as the maximum desired iterations is greater than or equal to the number of iterations performed thusfar. 
   root = double(xu - ((func(xu) * (xl - xu)) / (func(xl) - func(xu)))); %calculate new root estimate using upper and lower bound
   fx = double(func(root)); %calculate function value at new root
   iter = iter + 1; %create variable that keeps track of how many iterations have been performed 
   ea = abs((root - oldroot)/(root) * 100); %calculate approximate relative error using the most recent root estiamte and the previous root estimate 
   oldroot = root; %following the calculation of the approximate relative error, assign the newly calculated root to the variable oldroot 
   if sign(func(root)) ~= sign(func(xl)); %create if statement that checks if the sign of the function evaluated at the new root estimate and the sign of the function evaluated at the lower root guess are different.
       xu = root; %if the signs are not the same, assign the new root to be the new upper bound root guess
   elseif sign(func(root)) ~= sign(func(xu)); %create if statement that checks if the sign of the function evaluated at the new root estimate and the sign of the function evaluated at the upper root guess are different.
       xl = root; %if the signs are not the same, assign the new root to be the new lower bound root guess
   end
end



