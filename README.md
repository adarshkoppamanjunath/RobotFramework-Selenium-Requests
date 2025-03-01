# Robotframework Selenium RequestLibray
This repo has few examples how to use robotframework to automate UI and API interfaces. 


# To Use this locally
- git clone `https://github.com/adarshkoppamanjunath/RobotFramework-Selenium-Requests.git`
- Open ENV file and change the base url to `https://python-flask-apis.onrender.com/`
- Install Python and PiP
- From `RobotFramework-Selenium-Requests` folder, run `pip install -r requirements.txt`
- From `RobotFramework-Selenium-Requests` folder, rum `robot -V env.py --outputdir reports/api_results tests/api_tests.robot`

# To run it as container
- git clone `https://github.com/adarshkoppamanjunath/RobotFramework-Selenium-Requests.git`
- Open ENV file and change the base url to `https://python-flask-apis.onrender.com/`
- From `RobotFramework-Selenium-Requests` folder, run `docker build -t <image-name>` .
- `docker run -i -t <docker-image-name>`

