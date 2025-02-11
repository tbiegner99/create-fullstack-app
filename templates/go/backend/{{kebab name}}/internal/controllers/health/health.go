package health

import (
	"net/http"
)

type Controller interface {
	GetHealth(res http.ResponseWriter, req *http.Request)
}

type ControllerImpl struct {
}

func NewController() Controller {
	return &ControllerImpl{}
}

func (ctrl *ControllerImpl) GetHealth(res http.ResponseWriter, req *http.Request) {
	res.WriteHeader(204)
}
