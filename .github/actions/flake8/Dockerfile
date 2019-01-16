from python:3.7-slim


LABEL "name"="Flake8"
LABEL "maintainer"="Oliver Bristow <oliver+github@oliverbristow.com>"
LABEL "version"="0.1.0"

LABEL "com.github.actions.icon"="check-square"
LABEL "com.github.actions.color"="yellow"
LABEL "com.github.actions.name"="Flake8"
LABEL "com.github.actions.description"="This is to lint python packages using flake8."

RUN pip install twine==1.12.1

ENTRYPOINT ["flake8"]
