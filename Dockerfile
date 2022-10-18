From ubuntu:latest
run apt update
run apt install python3-flask -y
run export FLASK_APP=/var/FlaskProject/app.py
cmd flask run -h 0.0.0.0