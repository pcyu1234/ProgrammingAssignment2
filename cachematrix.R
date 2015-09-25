##This tow functions enables us to cache potentially time-consuming 
##computations. In this example, we want to caculate inverse of a matrix,
##and it sometimes would be complex and time conusming if an n by n matrix
##is big; therefore, functions here are used to deal with this problem.
##They are used to create a special object that stores a a matrix
##and cache's its inverse. 

##The first fucntion showed below creats a speical matrix, which 
##is a list contains
##1) set values of a matrix
##2) get values of a matrix
##3) set a inverse of a matrix
##4) get a inverse of a matrix
makeCacheMatrix <- function(x = matrix()) {
        inv <- null
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) inv <<- solve
        getinverse <- function() inv
        list(set=set, get=get, 
             setinverse=setinverse, 
             getinverse=getinverse)

}



##This function tried to compute the inverse of a special matrix from the 
##first function. However, before caculating, it checks whether the inverse 
##has already been calcluated. If it has already been calculated, 
##it gets the inverse from the cache and skips the computation. 
##Else, it calculates the inverse of the maatrix and 
##sets the value of the inverse in the cache via the setinvrse function.

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        m
        ## Return a matrix that is the inverse of 'x'
}
