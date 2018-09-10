build:
	docker build -t foo/rails:latest .
up:
	docker run -p 127.0.0.1:3000:3000 --env-file .env -it foo/rails:latest
