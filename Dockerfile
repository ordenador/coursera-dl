FROM python:3-slim
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc g++ libssl-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get purge -y --auto-remove gcc g++ libssl-dev
WORKDIR /src
COPY . /src
RUN pip install --upgrade pip
RUN pip install -r /src/requirements.txt
RUN pip install -e . --no-deps
WORKDIR /courses
ENTRYPOINT ["coursera-dl"]
CMD ["--help"]
