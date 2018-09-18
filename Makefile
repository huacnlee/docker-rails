build:
	docker build -t my/rails:latest .
start:
	# docker run -p 127.0.0.1:3000:3000 --env-file .env -it my/rails:latest
	docker-compose up -d
stop:
	docker-compose down
restart:
	docker-compose restart
install:
	docker-compose run app bundle exec rails assets:precompile
