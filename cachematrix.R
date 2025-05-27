# Foreword: the comments have been translated from Italian to English,
# so I apologize for any translation errors.


# As requested and as per example, I create this "special" matrix
# that allows to cache the inverse of the matrix and itself.
# Obviously I have to define the getter and setter functions for both the matrix
# and the inverse, using the <<- operator to implement the caching.

makeCacheMatrix <- function(x = matrix()) {
    # cachedInverse will contain the inverse of the matrix, initialized to NULL
    cachedInverse <- NULL  

    # Function to set the array with the caching method
    set <- function(y) {
        x <<- y                # update the matrix
        cachedInverse <<- NULL # reset cached inverse
    }

    # Getter function to get the matrix
    get <- function() x

    # Function to set the inverse from outside
    setinverse <- function(inverse) cachedInverse <<- inverse

    # Function to get the inverse
    getinverse <- function() cachedInverse

    # Returns a list with all the functions
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
