
# Installing Unifi Controller in Raspberry Pi

## Setting static networking

`sudo nano /etc/dhcpcd.conf`

Uncomment and add the following (may subject to change)

```
# Static IP configuration:
interface eth0
static ip_address=192.168.17.5/24
#static ip6_address=fd51:42f8:caae:d92e::ff/64
static routers=192.168.17.1
static domain_name_servers=192.168.17.1
```

Best to just reboot the server to make these changes up and running. 


## Installing the necessary tools/packages

`sudo apt update`

`sudo apt upgrade -y`

`sudo apt install openjdk-8-jre-headless -y`

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