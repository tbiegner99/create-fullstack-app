package main

import (
	"inspections/internal/app"
)

const port = ":8080"

func main() {
	a := app.App{}

	a.Initialize()
	a.Run(port)
}
