package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", SvcServer)
	http.ListenAndServe(":8080", nil)
}

func SvcServer(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Service up and running!")
}
