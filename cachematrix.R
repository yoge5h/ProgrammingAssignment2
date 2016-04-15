## Functions to set a matrix and cache the inverse of the created matrix

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix = function(x = matrix()) {
	inv = NULL
	set = function(y){
		x <<- y
		inv <<- NULL
	}
	get = function() x
	setInv = function(inverse) inv <<- inverse
	getInv = function() inv
	list(set = set, get = get,
             setInv = setInv,
             getInv = getInv) 
}	


## The following function calculates the inverse of the matrix created
## with the above function. However, it first checks to see if the inverse
## has already been calculated. If so, it gets the inverse from the cache 
## and skips the computation.

cacheSolve = function(x, ...) {
	inv = x$getInv()
	if(!is.null(inv)){
		message("getting cached data.")
		return(inv)
	}
	data = x$get()
	inv = solve(data)
	x$setInv(inv)
	inv
}
