#include <Rcpp.h>
using namespace Rcpp;
#include <Rcpp/Benchmark/Timer.h>

// [[Rcpp::export]]
int test_cpp(int n) {
  
  // start the timer
  Timer timer;
  timer.step("start");        // record the starting point
  
  NumericVector x = runif(n);
  
  for (int i=0; i < n; ++i) {
    x[i] += 1;
  }
  
  timer.step("end");   // record the final step    
  
  
  NumericVector res(timer);   // 
  for (int i=0; i<res.size(); i++) {
    res[i] = res[i] / n;
  }
  return (res[1]-res[0]); // Milliseconds    
  
  //return x;
}