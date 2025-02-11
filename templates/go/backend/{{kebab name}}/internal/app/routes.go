package app

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func notFoundHandler(response http.ResponseWriter, r *http.Request) {
	log.Println(r.URL.Path)
	response.WriteHeader(404)
}

func initializeRoutes(router *mux.Router, dependencies *Dependencies) {

	router.NotFoundHandler = http.HandlerFunc(notFoundHandler)

	router.HandleFunc("/api/{{kebab name}}/health",
		dependencies.Controllers.Health.GetHealth).Methods(http.MethodGet)

}
