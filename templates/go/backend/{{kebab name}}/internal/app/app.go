package app

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type App struct {
	Router       *mux.Router
	Dependencies *Dependencies
}

func (app *App) Initialize() {

	app.Dependencies = initializeDependencies()
	app.Router = mux.NewRouter()
	initializeRoutes(app.Router, app.Dependencies)
}

func (app *App) Run(port string) {
	log.Println(fmt.Sprintf("{{kebab name}} started on port %s", port))

	err := http.ListenAndServe(port, app.Router)

	if err != nil {
		log.Println(fmt.Sprintf("Error starting server on port %s", port), err.Error())
		panic(err)
	}
}
