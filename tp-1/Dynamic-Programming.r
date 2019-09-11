backtrack_lcs <- function(backtrack_matrix,sequence_origin,size_sequence_origin,size_sequence_target){
  if (size_sequence_origin==0 | size_sequence_target==0) return(NULL)
  if (backtrack_matrix[size_sequence_origin+1,size_sequence_target+1] == '\\'){
    return(c(sequence_origin[size_sequence_origin],backtrack_lcs(backtrack_matrix,sequence_origin,size_sequence_origin-1,size_sequence_target-1)))
  }else if(backtrack_matrix[size_sequence_origin+1,size_sequence_target+1] == '|'){
    backtrack_lcs(backtrack_matrix,sequence_origin,size_sequence_origin-1,size_sequence_target)
  }else{
    backtrack_lcs(backtrack_matrix,sequence_origin,size_sequence_origin,size_sequence_target-1)
  }
}
library(compiler)
find_lcs <- cmpfun(function(sequence_origin,sequence_target){
  
  options(expressions=10000)
  
  sequence_origin <- unlist(strsplit(sequence_origin,''))
  sequence_target <- unlist(strsplit(sequence_target,''))
  
  size_sequence_origin <- length(sequence_origin)
  size_sequence_target <- length(sequence_target)
  
  backtrack_key <- c('|','--','\\')
  score_matrix <- matrix(0,length(sequence_origin)+1,length(sequence_target)+1,dimnames=list(c('',sequence_origin),c('',sequence_target)))
  backtrack_matrix <- matrix('',length(sequence_origin)+1,length(sequence_target)+1,dimnames=list(c('',sequence_origin),c('',sequence_target)))
  
  for (i in seq(2,size_sequence_origin+1)){
    for (j in seq(2,size_sequence_target+1)){
      
      score_up <- score_matrix[i-1,j]
      score_left <- score_matrix[i,j-1]
      score_diagonal <- score_matrix[i-1,j-1] + 1
      
      if (sequence_origin[i-1]==sequence_target[j-1]) scores <- c(score_up,score_left,score_diagonal) else scores <- c(score_up,score_left)
      
      backtrack_update <- which.max(scores)
      score_update <- max(scores)
      
      score_matrix[i,j] <- score_update
      backtrack_matrix[i,j] <- backtrack_key[backtrack_update]
      
    }
  }
  
  lcs <- backtrack_lcs(backtrack_matrix,sequence_origin,size_sequence_origin,size_sequence_target)
  
  return(list(lcs=paste0(rev(lcs),collapse=''),
              length=score_matrix[length(score_matrix)],
              score=score_matrix,
              backtrack=backtrack_matrix))
  
})