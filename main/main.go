package main

import (
	"github.com/gin-gonic/gin"
	log "github.com/sirupsen/logrus"
)

func main() {
	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.String(200, "Hello World")
	})
	r.PUT("")
	r.Run("18080") // listen and serve on 0.0.0.0:8080
}

func init() {
	log.Info("[OSS-SERVER] init...")
}
