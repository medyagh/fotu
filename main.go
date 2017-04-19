package main

import (
	log "github.com/Sirupsen/logrus"
	"time"
	"fotu/templates"
)

var (
	VersionNumber string
	BuildNumber   string
)


func main() {
	log.SetLevel(log.DebugLevel)
	log.Info(VersionNumber)
	log.Info(BuildNumber)
	time.Sleep(1 * time.Second)
	templates.PopulateTemplates()
	startRouter()

}