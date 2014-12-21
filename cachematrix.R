## The two functions below are used concurrently to find the inverse of a matrix . 
## If the inverse has already been found, it is returned without the need to recal-
## culate the inverse.

## The function creates an R object that initialises a matirx named matrix1 and
## provides function get() to obtain "raw" matrix; provides function setImatrix() 
## to assign computed inverse matrix to matrix1; provides function getImatrix() to 
## obtain the cached inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
   matrix1 <- NULL
   get <- function() x
   setImatrix <- function(Imatrix) m <<- Imatrix
   getImatrix <- function() matrix1
   list(get=get, setImatrix=setImatrix, getImatrix=getImatrix)
}



## The function does the actual inversing of matrix.  It first checks if the in-
## verse matrix has been found; if yes, returns the result and quits. If not, the 
## inverse of x is calculated, saved to cached, and returned.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        matrix1 <- x$getImatrix()
   if(!is.null(matrix1)){
      message("Cached data found")
      return(matrix1)
   }
   else {
      message("No cached data found")
      data <- x$get() 
      matrix1 <- solve(data) 
      x$setImatrix(matrix1) 
      message("Done.")
      return(matrix1)
   }
}
