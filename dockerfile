# Use Python as the base image
FROM python:3.9
WORKDIR /robot
RUN pip install --upgrade pip \
    && pip install robotframework \
    robotframework-seleniumlibrary \
    robotframework-requests \
    robotframework-jsonlibrary
RUN apt-get update && apt-get install -y \
    wget unzip curl \
    && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update && apt-get install -y google-chrome-stable \
    && CHROMEDRIVER_VERSION=$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE) \
    && wget -q "https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip" -O chromedriver.zip \
    && unzip chromedriver.zip -d /usr/local/bin/ \
    && rm chromedriver.zip \
    && chmod +x /usr/local/bin/chromedriver
ENV ROBOT_OPTIONS="--outputdir /robot/results"
ENV PATH="$PATH:/usr/local/bin"
COPY . /robot


