function [I] = Simpson(x,y)
%This function calculates the integral of experimental data using the Simpson's 
%1/3 rule. If there are an odd number of intervals, the trapezoidal rule will be used
%on the last interval. 


d = diff(x) %compute a matrix containing the individuals interval lengths between the inputted data points. 

if (~(range(d) < 0.0000001) && (range(d) > 0.0000001)) %create an if statement that ensures the difference between the largest and smallest interval length is practically** zero (very small range created to avoid subtractive cancellatiob errors.
  error('x values are not evenly spaced')%inform user if inputted x values are not evenly spaced.
end

if length(x) ~= length(y) %check if the inputted x and y matrix have the same lengths.
    error('there should be an even number of data points because x and y data points are paired') %inform user if each x value does not have a corresponding y value (and vice versa)
end

if rem(length(x),2) == 0 %check to see if there are an odd number of intervals by checking how many data points there are.
    warning('the trapezoidal rule has to be used on the last interval') %if there are an even number of data points, ensure user trapezoidal rule needs to be used b/c odd number of intervals
end

if rem(length(x),2) == 1 %check to see if there are an even number of intervals 
    h = d(1) / 3 %compute h value
    even = 4 * sum((y(2:2:(length(y)-1)))) %calculate sum of the interior function values at even spaced x values (excluding first and last function values). Weight the function values by 4
    odd = 2 * sum((y(3:2:(length(y)-2)))) %calculate sum of the interior function values at odd spaced x values (excluding first and last function values). Weight the function values by 2
    fx_sum = (y(1) + even + odd + y(length(y))) %calculate the total sum of the interior function values properly weighted as well as the first and last function values
    I = h * fx_sum %Compute the integral by multiplying the sum of the function values by the previously calculated h value (according to the Simpsons 1/3 formula)
end 

if rem(length(x),2) == 0 %check to see if there are an odd number of intervals  
    h = d(1) / 3 %compute h value
    even = 4 * sum((y(2:2:(length(y)-2)))) %do same as done in the above if statement,however, not including the last interval
    odd = 2 * sum((y(3:2:(length(y)-3)))) %do same as done in the above if statement,however, not including the last interval
    fx_sum = (y(1) + even + odd + y(length(y)-1)) %do same as done in the above if statement,however, not including the last interval
    I = h * fx_sum %calculate the integral for every interval but the last interval 
    
    last_int_dx = (x(length(x))-x(length(x)-1)) %calculate the length of the last interval
    last_int_dy = (y(length(y))+(y(length(y)-1)))/2 %calculate the average "height" of the last interval by taking the average of the function values at the two endpoints.
    last_int_area = (last_int_dx)*(last_int_dy) %calculate the area using the trapezoidal rule formula 
    last_int_area = (last_int_area)
    I = (h * fx_sum) + (last_int_area) %add the sum of the last interval to the previously calculated sum of every other interval

end

end

