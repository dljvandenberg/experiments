library(plumber)

#* @apiTitle Simple API

#* Gives echo of provided text
#* @param text The text to be echoed in the response
#* @get /echo
function(text = "") {
  list(
    message_echo = paste("The text is:", text)
  )
}


# Run using command:
# plumber::plumb("plumber-api.R")$run(port = 5762)

# Test by using browser URL:
# http://127.0.0.1:5762/echo?text=test

# Or using curl:
# curl -X GET "http://127.0.0.1:9679/echo?text=test" -H  "accept: application/json"
