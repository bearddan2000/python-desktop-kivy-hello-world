# sbtscala/scala-sbt:eclipse-temurin-17.0.4_1.7.1_3.2.0
FROM ubuntu

ENV USERNAME developer

ENV DISPLAY :0

RUN apt update

RUN apt install -yq \
    pip sudo xclip \
    libmtdev1 \
    libxrender-dev \
    mesa-common-dev

RUN echo "backus ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN useradd --no-log-init --home-dir /home/$USERNAME --create-home --shell /bin/bash $USERNAME
RUN adduser $USERNAME sudo

USER $USERNAME

WORKDIR /home/$USERNAME

COPY bin .

RUN pip install -r requirements.txt

CMD ["python3", "./main.py"]
