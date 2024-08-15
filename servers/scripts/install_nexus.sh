#!/bin/bash

sudo apt update -y
# # Install Java 17+
 sudo apt install openjdk-17-* -y


# # Create necessary directories
 cd /opt  

sudo wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz -O nexus.tar.gz

sleep 10

# Extract the downloaded Nexus package
EXTOUT=$(sudo tar xzvf nexus.tar.gz)

NEXUSDIR=$(echo $EXTOUT | head -n 1 | cut -d '/' -f1)

sudo mv /opt/$NEXUSDIR /opt/nexus

sudo rm nexus.tar.gz

sudo useradd nexus

sudo chown -R nexus:nexus /opt/$NEXUSDIR 

sudo chown -R nexus:nexus /opt/sonatype-work

sudo echo "nexus ALL=(ALL) NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo

# # Set Nexus to run as the nexus user
sudo bash -c "echo 'run_as_user=\"nexus\"' > /opt/$NEXUSDIR/bin/nexus.rc"

sudo bash -c "cat <<EOT > /etc/systemd/system/nexus.service
[Unit]
Description=Nexus service
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/$NEXUSDIR/bin/nexus start
ExecStop=/opt/$NEXUSDIR/bin/nexus stop
User=nexus
Restart=on-abort

[Install]
WantedBy=multi-user.target
EOT"


sudo systemctl daemon-reload
sudo systemctl start nexus
sudo systemctl enable nexus



# sudo bash -c "cat <<EOT > /opt/nexus/bin/nexus.vmoptions
# -Xms1024m
# -Xmx1024m
# -XX:MaxDirectMemorySize=1024m
# -XX:LogFile=./sonatype-work/nexus3/log/jvm.log
# -XX:-OmitStackTraceInFastThrow
# -Djava.net.preferIPv4Stack=true
# -Dkaraf.home=.
# -Dkaraf.base=.
# -Dkaraf.etc=etc/karaf
# -Djava.util.logging.config.file=etc/karaf/java.util.logging.properties
# -Dkaraf.data=./sonatype-work/nexus3
# -Dkaraf.log=./sonatype-work/nexus3/log
# -Djava.io.tmpdir=./sonatype-work/nexus3/tmp
# EOT"



