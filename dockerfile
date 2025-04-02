FROM python:3.12

#install ssh client
RUN apt-get update && apt-get install -y openssh-client

# ser env variables
ENV PYTHONUNBUFFERED=1

#set the working directory
WORKDIR /app

# copy the requirements file into the container at /app
COPY requirements.txt /app/requirements.txt

# install the dependencies
RUN pip install -r requirements.txt

# copy the rest of the application code into the container at /app
COPY . /app

#start the ssh
CMD python manage.py runserver 0.0.0.0:8000