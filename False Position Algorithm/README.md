# **Function Description** 
This function estimats the root of a given function using the false position numerical method

# Inputs

**func** - This input is the symbolic function for which the root will be found for

**xl** This input represents the lower guess for the root

**xu** This input represents the lower guess for the root

**es** This input represnts the desired relative error the user desires
 
**maxiter** - This input represents the maximum number of iterations the user desires 

# Outputs

**root** - This output represents the estimated root location

**fx** This output represents the function evaluated at the root estimate 

**ea** - This output represents the approximate percent relative error of the root estimate

**iter** This output represents how many iterations were perfomed to arrive at the root with the appropriate desired relative error
