# DOCKER-VERSION 1.0.0
FROM trevmurray/rpi-raspbian-java8

# install required packages
RUN apt-get update
RUN apt-get install -y wget unzip

#Get openHBA and addons/extras
RUN wget -O distribution-runtime.zip https://github.com/openhab/openhab/releases/download/v1.6.2/distribution-1.6.2-runtime.zip
RUN wget -O distribution-addons.zip https://github.com/openhab/openhab/releases/download/v1.6.2/distribution-1.6.2-addons.zip
RUN wget -O distribution-demo-configuration.zip https://github.com/openhab/openhab/releases/download/v1.6.2/distribution-1.6.2-demo-configuration.zip

# Install openHBA core
RUN mkdir /opt/openhab
RUN cd /opt/openhab/; unzip /distribution-runtime.zip
RUN cd /opt/openhab/addons; unzip /distribution-addons.zip
RUN cd /opt/openhab/; cp configurations/openhab_default.cfg configurations/openhab.cfg
RUN cd /opt/openhab; unzip -o /distribution-demo-configuration.zip
RUN cd /opt/openhab; chmod +x start.sh

WORKDIR /opt/openhab

CMD ./start.sh
