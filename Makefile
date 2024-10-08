.PHONY: run
run:
	PORT=:3000 go run main.go

# make release version=...
.PHONY: release
release:
	gh release create v$(version) --title "v$(version)" --notes "Initial release" --repo anddimario/simple-http
	go build -o simple-http main.go
	tar -czf simple-http.tar.gz simple-http
	gh release upload v$(version) simple-http.tar.gz --repo anddimario/simple-http
	rm simple-http simple-http.tar.gz
