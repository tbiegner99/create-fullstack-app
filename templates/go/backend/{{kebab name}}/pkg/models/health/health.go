package models

import "time"

type HealthResponse struct {
	Status  string    `json:"status"`
	Healthy int       `json:"healthy"`
	Date    time.Time `json:"date"`
}
