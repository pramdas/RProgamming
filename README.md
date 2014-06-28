### Introduction

makeCacheMatrix and cacheSolve functions are helper functions when used 
together helps cache the computation intense inverse operation on a 
square (these functions assume square matrix is passed) matrix. 
Typical usage of these functions are
    Step 1: Create matrix and call makeCacheMatrix to create a list with
          - helper functions - set, get, getInverse, setInverse
    Step 2: Call cacheSolve with the list created in Step 1 to
          - Computes the inverse operation of the matrix
          - Cache the inverse value
    Step 3: Subsequent calls to cacheSolve for this matrix the value is 
            returned from cache


### Example: Caching the Mean of a Vector

In this example we introduce the `<<-` operator which can be used to
assign a value to an object in an environment that is different from the
current environment. Below are two functions that are used to create a
special object that stores a numeric vector and caches its mean.

The first function, `makeCacheMatrix` creates a special "matrix", which is
really a list containing a function to

1.  set the value of the matrix
2.  get the value of the matrix
3.  set the value of the inverse
4.  get the value of the inverse


The second function `cacheSolve` calculates the inverse of the special "matrix"
created with the above function. However, it first checks to see if the
inverse has already been calculated. If so, it `get`s the inverse from the
cache and skips the computation. Otherwise, it calculates the inverse of
the data and sets the value of the inverse in the cache via the `setInverse`
function.
