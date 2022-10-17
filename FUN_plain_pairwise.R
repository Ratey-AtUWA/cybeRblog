# function inputs output object from Pedro Martinez Arbizu's pairwise.adonis2()
# code at https://github.com/pmartinezarbizu/pairwiseAdonis
plainPW <- function(PWobj) {
  UL_PW_perm <- unlist(PWobj) # convert list to long named vector
  names_PW_perm <- names(UL_PW_perm) # extract the names...
  rows_pvals <- grep("F)1",names_PW_perm) # find the rows we need
  justThePW <- # use the row indices to find the rown in the long vector
    data.frame(Comparison = str_remove(names(UL_PW_perm[rows_pvals]),
                                       fixed(".Pr(>F)1")),
               P_value = as.numeric(UL_PW_perm[rows_pvals]))
  return(justThePW) # and the resulting data frame is the output!
}