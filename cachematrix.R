## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## matrix and NULL functions. 
## Also contains function to solve inverse of a matrix
## set x as matrix
## set inv as solved value for NULL

makeCacheMatrix <- function(x= matrix()){
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() {x}
  setInverse <- function(inverse) {inv <<- inverse}
  getInverse <- function() {inv}
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## Write a short comment describing this functioning
## Caching data function below
## Also checks whether inverse function returns NULL

cachesolve <- function(x, ...){
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}

## Operations to test functions

pmatrix <-makeCacheMatrix(matrix(1:16, nrow=4, ncol=4))
pmatrix$get()

pmatrix <- makeCacheMatrix(matrix(1:4, nrow=2, ncol=2))
pmatrix$get()
pmatrix$getInverse()
cachesolve(pmatrix)
cachesolve(pmatrix)

