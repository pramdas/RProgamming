## makeCacheMatrix and cacheSolve functions are helper functions when used 
## together helps cache the computation intense inverse operation on a 
## square (these functions assume square matrix is passed) matrix. 
## Typical usage of these functions are
##    Step 1: Create matrix and call makeCacheMatrix to create a list with
##          - helper functions - set, get, getInverse, setInverse
##    Step 2: Call cacheSolve with the list created in Step 1 to
##          - Computes the inverse operation of the matrix
##          - Cache the inverse value
##    Step 3: Subsequent calls to cacheSolve for this matrix the value is 
##            returned from cache


## makeCacheMatrix is a helper function that takes a square matrix as 
## an argument and constructs a special matrix which is a list of four functions
##     - set, get
##     - setInverse, getInverse

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function (y) {
        x <<- y
        inverse <<- NULL
    }
    
    get <- function () x
    setInverse <- function (inv) inverse <<- inv
    getInverse <- function () inverse
    list (set = set, get = get,
          setInverse = setInverse,
          getInverse = getInverse)
}


## cacheSolve is a helper function which calculates the inverse of the 
## special matrix construted from a regular square matrix with the make function 
## above. This function returns the inverse calculation from cache if it is 
## available else it computes the value and caches the inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getInverse()
    if(!is.null(inv)){
        message ("getting cached data")
        return (inv)
    }
    matrixData <- x$get()
    inv <- solve (matrixData, ...)
    x$setInverse (inv)
    inv
}
