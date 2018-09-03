FROM node

ENV CHROME=/usr/bin/google-chrome
ENV DISPLAY=:99.0


# Install Chrome
RUN apt-get update && \
    apt-get install -y xvfb libgconf2-4 libnss3-1d libxss1

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

RUN export SCREEN_WIDTH=3840
RUN export SCREEN_HEIGHT=2160
# Set a working directory
WORKDIR /usr/src/app

# Run the container under "node" user by default
USER node

CMD [ "/usr/bin/Xvfb", ":99", "-ac", "-screen", "0", "1024x768x16" ]
