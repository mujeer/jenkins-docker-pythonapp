# our base image
FROM alpine:3.5

# Install python and pip
RUN apk add --update py2-pip


# tell the port number the container should expose chnaged pelase check
EXPOSE 5000

# run the application
CMD ["python", "/usr/src/app/app.py"]
