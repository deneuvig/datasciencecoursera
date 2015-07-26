## The following set of two functions allows us to compute and cache the inverse of the matrix for later use. 
## The user shall first create the matrix of a cacheMatrix object using the makeCacheMatrix function. 
## The cacheSolve function will return the inverse of the preset cachecSolve object iff it is an invertible 
## matrix. An avail on the cache is done to save us some precious time. 

## Creates a special vector which allows to get/set the value of it's underlying matrix, get/set the matrix's
## inverse. No computation is carried in this environment directly. 
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  
  setInvertedMatrix <- function(m) inv <<- m
  getInvertedMatrix <- function() inv
  
  list(set = set, get = get, setInvertedMatrix = setInvertedMatrix, getInvertedMatrix = getInvertedMatrix)
}


## cacheSolve should return the inverse of any inversible matrix. Input is a makeCacheMatrix object with a set
## invertible matrix value. Will output the inverse of x, either from cache or computation. If computed, the
## result shall be cached.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInvertedMatrix()
  if(!is.null(inv)){
    return(inv)
  }

  x$setInvertedMatrix(solve(x$get()))
  x$getInvertedMatrix()

}
