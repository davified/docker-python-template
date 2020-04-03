FROM python:3.6.5-slim

RUN apt-get update

WORKDIR /code

COPY requirements.txt /code/requirements.txt
RUN pip install -r requirements.txt

COPY . /code

CMD ["bash"]
