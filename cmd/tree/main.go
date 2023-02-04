package main

import (
	"log"
	"os"
)

func main() {
	entries, err := os.ReadDir(os.Getenv("DIR_PATH"))
	if err != nil {
		log.Fatal(err)
	}
	for _, v := range entries {
		log.Println(v.Name())
	}
}
