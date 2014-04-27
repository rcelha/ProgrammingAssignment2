## Put comments here that give an overall description of what your
## functions do

## sample:
#   myMatrix <- makeCacheMatrix(matrix(data = 1))
#   myMatrix$set(matrix(data = rnorm(100), ncol=10, nrow=10))
#   print(myMatrix$get())
#   cacheSolve(myMatrix)
#   print(myMatrix$getinverse())

## Creates a Matrix object with cacheable inverse value
makeCacheMatrix <- function(x = matrix()) {
    inversevalue <- NULL
    get <- function () x
    
    set <- function (value) {
        x <<- value
        inversevalue <<- NULL
    }
    
    getinverse <- function () {
        inversevalue
    }
    
    setinverse <- function (value) {
        inversevalue <<- value
    }
    
    list(get=get,
         set=set,
         getinverse=getinverse,
         setinverse=setinverse)
}


## Returns a cached version of the matrix created by makeCacheMatrix function,
#   if it doesn't exists, creates a cached version of it and returns it

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    val <- x$getinverse()
    
    if (!is.null(val)) {
        print("cached version")
        return(val)
    }
    val <- solve(x$get())
    x$setinverse(val)
    val
}

