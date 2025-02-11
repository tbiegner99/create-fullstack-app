package app

import (
	HealthController "{{kebab-name}}/internal/controllers/health"
)

type Controllers struct {
	Health HealthController.Controller
}

type Services struct {
}

type Datasources struct {
}

type Dependencies struct {
	Controllers *Controllers
	Services    *Services
	Datasources *Datasources
}

func initializeDependencies() *Dependencies {

	healthController := HealthController.NewController()

	return &Dependencies{
		Controllers: &Controllers{
			Health: healthController,
		},
		Services:    &Services{},
		Datasources: &Datasources{},
	}
}
