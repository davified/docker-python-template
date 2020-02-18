FROM python:3.6.5-slim

RUN apt-get update

WORKDIR /code
COPY . /code

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["bash"]
