FROM python:3

WORKDIR /src
COPY api_client_lib.py client.py standalone_client.py requirements.txt ./
RUN pip install virtualenv && \
    virtualenv venv && \
    . ./venv/bin/activate && \
    ./venv/bin/pip install -r requirements.txt

CMD ["./venv/bin/python", "client.py"]

EXPOSE 5000