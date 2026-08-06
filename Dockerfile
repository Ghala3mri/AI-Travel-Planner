FROM python:3.11-slim

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

CMD ["jupyter", "nbconvert", "--to", "notebook", "--execute", "--inplace", "project.ipynb"]
