# ---------------------------------------- PEER REVIEW ----------------------------------------
# I have identified [6] problems with your code. Please read my critique and fix.


# [1]
# MakeCacheMatrix is supposed to be a function which creates a special matrix and...
# should return a list displaying all its attributes/ behaviours.
# If you have expereince coding in C++, then you have heard of a "Class" object.
# If you have no idea what I am refering to, please review here:
# 	https://www3.ntu.edu.sg/home/ehchua/programming/cpp/cp3_OOP.html
# This special matrix is a special object with its own set of behaviours/ attributes

makeCacheMatrix <- function(x = matrix())
{						# [2]	
	j<- NULL 				# <-- j is last variable and will be returned.
						#     you are returning a matrix--you should return...
						#     a list!!!
}
						# [3]
get<-function()x 				# <--
setInverse<-function(inverse)j<<-inverse        #     Why are getters, setters, and list object not...
getInverse<- function()j                        #     included in makeCacheMatrix?
 					        # <-- Also, you have "set=set" but you have no set function...
list(set=set, get=get,  			#     above (get, setInverse, and getInverse).
setInverse=setInverse,                          #
getInverse=getInverse)                          # <--


# [4]
# cacheSolve can only access a matrix of type makeCacheMatrix.
# So the getters, setters, and list being within the function makeCacheMatrix...
# is crucial for the '$' extrator operator to work.

cacheSolve <- function(x, ...)
{						# [5]
   j<-x$getInverse() 				# <-- Error will produce becuase when [x] is assigned...
   						#     the object returned from makeCacheMatrix,...
   						#     it will contain no attributes.
   						#     You cannot access any getters or setters because...
   						#     these attributes are not contained within makeCahceMatrix!!!
   if(!is.null(j))
   {
	message("getting cached data")
	return(j)
   }
   						# [6]
   mat<-x$get()					# <-- same issue as [5]
   j<-solve(mat,...)
   x$setInverse(j)
   j
}



# ---------------------------------------- EXAMPLE --------------------------------------------
# This example implements your code and will support my feedback above. 
# NOTE: in R terminal use source("cachematrix.r") -- make sure your working directory contains this file!!!

# 1 - create square matrix
message("\nCreating matrix...")
message("------------------------------------------------")
MAT <- matrix(rnorm(16), nrow=4, ncol=4)
print(MAT)

# 2 - create special matrix of type makeCacheMatrix--assign to myDS (my datastruct)
message("\n\n[Attempt]: Converting matrix to special matrix with attributes...")
message("------------------------------------------------")
myDS <- makeCacheMatrix(MAT)
print(myDS)

# 3 - determine type of object returned
message("\n\nIdentifying object type...")
message("------------------------------------------------")
print(class(myDS))

# 4 - calculate inverese of given matrix
message("\n\n[Attempt]: Calculating matrix inverse...")
message("------------------------------------------------")
myDS_i <- cacheSolve(myDS)
print(myDS_i)
