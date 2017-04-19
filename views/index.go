package views

import (
	"fotu/templates"
	"net/http"
	"time"
	log "github.com/Sirupsen/logrus"
)

type context struct {
	Name string
	Time time.Time
}

func Index(w http.ResponseWriter, r *http.Request) {
	c := context{Name: "Fotu", Time: time.Now()}
	err := templates.IndexTemplate.Execute(w, c)
	if err != nil {
		log.Error("Error in executing template")
		panic(err)
	}

}

