# The purpose of these two function is to inverte a matrix and store the result; 
#in such a way if it is need to invert the same matrix again, the function do not do computation, 
#but recall the cached result.

# This function generate a list:
# set the matrix;
# get the matrix;
# set the inverse of the matrix;
# get the inverse of the matrix;

MakeCacheMatrix<- function(x=matrix()){
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function()x
  setinverse<-function(inverse) m<<-inverse
  getinverse<-function()m
  list(set=set, get=get, setinverse=setinverse, 
       getinverse=getinverse)
  
    
  
}

#The following function calculates the inverse of the matrix . However, it first checks to see if the mean has already 
#been calculated. If so, it gets the inverse from the cache and skips the computation.
#Otherwise, it calculates the inverse of the data and sets the invert matrix 
#in the cache via the setmean function.

cacheSolve<- function(x,...){
  m<-x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-solve(data,...)
  x$setinverse(m)
  m
  
}
