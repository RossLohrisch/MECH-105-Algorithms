function[L,U,P] = luFactor(A)
%This function performs the LU Factorization of a square matrix
%given the input of a square matrix. The returned outputs include the lower
%triangular matrix, upper triangular matrix, and pivot matrix.

if nargin ~= 1 %Check to see how many arguments were input by user
    error('Only 1 input argument should be entered') %Display error if any amount other than 1 argument were entered
end

[m,n] = size(A); %Create variables m and n that represent number of rows and columns, respectively

if m ~= n %Check that the number of rows and columns is equal (square matrix was entered)   
    error('Matrix A must be a square matrix') %Display error is square matrix was not entered
end

size1 = size(A); %Create variable that stores the size of matrix A
P = eye(size1); %Create idenditity matrix to serve as pivoting matrix
L = zeros(size1); %Create matrix of zeros for lower triangular matrix (will be filled in later)
U = A; %Create upper matrix that contains the values of martix A (will be modified as A is decomposed)

for a = 1:(length(A))-1 %Create for loop to pivot rows 
    column = U(a:n,a) %Create a variable that makes a column vector corresponing to each coefficient
    [maxi,index] = max(abs(column)); %Determine the maximum coefficient for each variable as well as its index location
    IndexRow1 = U(index+(a-1),:); %Create a variable that stores the row containing maximum coefficient
    U(index+(a-1),:) = U(a,:) %Pivot the index row to be the top row 
    U(a,:) = IndexRow1 %Pivot the previous top row to where the pivoted row originally was   
    
    %Pivot the premade P matrix to keep track of how the rows have been
    %pivoted
    
    IndexRow1 = P(index+(a-1),:); 
    P(index+(a-1),:) = P(a,:)
    P(a,:) = IndexRow1   
    
    %Pivot the premade L matrix to keep track of the numbers that were used
    %to cancel out variables in the upper triangular matrix 
    
    IndexRow1 = L(index+(a-1),:);
    L(index+(a-1),:) = L(a,:)
    L(a,:) = IndexRow1    

    for b = (a+1):length(A) %create for loop to cancel variables and update the upper triangular matrix
        Cancel1 = U(b,a)/U(a,a) %calculate the value the previous row needs to multiplied by to cancel
        L(b,a) = Cancel1;
        U(b,:) = U(b,:) - U(a,:)*Cancel1 %subtract the previous row multiplied by the factor determined earlier from the 
        %current row to cancel  the desired variable. Repeat until the
        %upper triangular matrix has been created.
    end
end

%Assign 1's to the diagonal positions in the lower matrix
for diagonal = 1:length(L) 
    L(diagonal,diagonal) = 1
end   
end

