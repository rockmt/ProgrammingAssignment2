## [example]
##  > mdata <- makeCacheMatrix(matrix(2:5,2,2))
##  > cacheSolve(mdata)
##  > cacheSolve(mdata)  // useing cache data

## makeCacheMatrix : return a list "matrix data"
## 1. set the matrix values
## 2. get the matrix values
## 3. set the inverse matrix values
## 4. get the inverse matrix values
makeCacheMatrix <- function(x = matrix()) {

  v <- NULL;

  # setter of matrix values
  set <- function(y) {

    x <<- y;

    v <<- NULL;

  }

  # getter of matrix values
  get <- function() {
    x;
  }

  # setter of inverse matrix values
  setInv <- function(solve) {
    v <<- solve;
  }

  # getter of inverse matrix values
  getInv <- function() {
    v;
  }

  # output data matrix
  list(set=set, get=get, setInv=setInv, getInv=getInv);

}

## cacheSolve : get the inverse matrix data.
## if the inverse matrix data is already stored, return from cache data.
cacheSolve <- function(x, ...) {

  ## Return a matrix that is the inverse of 'x'

  # get inverse matrix values
  v <- x$getInv()

  # if values not null, return values
  if (!is.null(v)) {
    message("using cached data values");
    return(v);
  }

  data <- x$get();

  v <- solve(data, ...);

  # cache inverse matrix values
  x$setInv(v);

  # return values
  v;

}
