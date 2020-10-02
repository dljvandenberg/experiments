# Truncates all character columns in df to max_length, putting postfix string
# at end indicating that content has been removed
truncate_texts_from_df <- function(df, max_length = 50, postfix = "...") {
  df_truncated <- df
  
  for(col in colnames(df_truncated)) {
    if("character" %in% class(df_truncated[[col]])) {
      df_truncated[[col]] <- stringr::str_trunc(df_truncated[[col]], max_length, ellipsis = postfix)
    }
  }
  
  return(df_truncated)
}