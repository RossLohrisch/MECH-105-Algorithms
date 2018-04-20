# Function Description: 
This function calculates the integral of experimental data using the Simpson's 1/3 rule. If there are an odd number of intervals, the trapezoidal rule is used on the last interval

# Inputs:

**x** - This is an input of x values/independent variable measurements the user inputs

**y** - This is an input of the corresponding y values/dependent variable measurements 

# Outputs:

**I** - This output represents the calculated integral value using the Simpsons 1/3 rule (combined with trapezoidal if odd number of intervals)

# Limitations

Each interval must be of the same length for this function to work (x values are evenly spaced

If there are an odd number of intervals, a single application of the trapezoidal rule will be used on the last interval
