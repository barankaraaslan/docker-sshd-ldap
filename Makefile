all: build

build:
	sudo docker build --tag ldap-os --build-arg URI='ldap://172.17.0.1/' \
									 --build-arg BASE='cn=users,dc=example,dc=org' \
									 --build-arg BINDDN='cn=admin,dc=example,dc=org' \
									 --build-arg BINDPW='admin' .
build_test:
	# sudo docker build --no-cache --tag ldap-os-test --build-arg URI=ldap://localhost:389 --build-arg BASE=cn=users,dc=example,dc=org .
	# sudo docker build --no-cache --tag ldap-os-test --build-arg URI=asd .
run:
	sudo docker run --init -d -p 22:22 --name ldap-os-bg ldap-os
rm:
	sudo docker stop ldap-os-bg
	sudo docker rm ldap-os-bg
bash:
	sudo docker run --init --rm -p 22:22 -it ldap-os bash
exec-bash:
	sudo docker exec -it ldap-os-bg bash