package main
 
import (
    "fmt"
    "log"
    "net/http"
	"os"
)
 
func main() {
 
    // API routes
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "dummy application:\n")
		fmt.Fprintf(w, os.Getenv("Title"))
    })
 
    port := ":80"
    fmt.Println("Server is running on port" + port)
 
    // Start server on port specified above
    log.Fatal(http.ListenAndServe(port, nil))
}