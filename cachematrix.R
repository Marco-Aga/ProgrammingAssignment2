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

# Again as requested and as an example, I create the function to calculate
# the inverse of the "special" matrix above
# First I take the inverse from the cache, if it exists I do not do any calculation,
# otherwise I take the original stored matrix and calculate the inverse using the solve() function.

cacheSolve <- function(x, ...) {
    # Get the cached inverse
    inverseMatrix <- x$getinverse()

    # If the inverse has already been computed and was therefore already in cache, return it without needing to be recomputed
    if (!is.null(inverseMatrix)) {
        message("Using cached inverse matrix")
        return(inverseMatrix)
    }

    # Otherwise, take the original matrix
    data <- x$get()

    # Calculate the inverse of the matrix 
    inverseMatrix <- solve(data, ...)

    # Save the computed inverse in the cache for future use
    x$setinverse(inverseMatrix)

    # Returns the calculated inverse
    inverseMatrix
}
