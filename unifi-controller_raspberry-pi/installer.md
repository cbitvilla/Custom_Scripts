
# Installing Unifi Controller in Raspberry Pi

## Setting static networking

`sudo nano /etc/dhcpcd.conf`

Uncomment and add the following (may subject to change)



## Installing the necessary tools/packages

`sudo apt update`

`sudo apt upgrade -y`

`sudo apt install openjdk-8-jre-headless`

`sudo apt install rng-tools`

`sudo nano /etc/default/rng-tools`
Uncomment the following line `#HRNGDEVICE=/dev/hwrng`

`sudo systemctl restart rng-tools`

## Installing the UniFi Controller to the Raspberry Pi
`echo 'deb [signed-by=/usr/share/keyrings/ubiquiti-archive-keyring.gpg] https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list`

add the repositories GPG key
`curl https://dl.ui.com/unifi/unifi-repo.gpg | sudo tee /usr/share/keyrings/ubiquiti-archive-keyring.gpg >/dev/null`

`sudo apt update`

`sudo apt install unifi`

# Resources

[Youtube video](https://www.youtube.com/watch?v=rIrveJGPFrM)

[Installing the UniFi Controller on the Raspberry Pi](https://pimylifeup.com/rasberry-pi-unifi/)