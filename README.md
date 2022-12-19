# Custom_Scripts
Folder containing custom scripts, such as automated package installer

## UB-22 Package Installer Script:
**NOTE:** This has been used in Ubunutu 22 OS. This has not been tested in any other linux distro. 
The following script will install the following major packages...
1. Nala (front-end for libapt-pkg) [GitLab - Nala](https://gitlab.com/volian/nala)
2. Docker-CE
3. Docker-Compose
4. ZSH & Oh-My-ZSH

## Future Goals For Scripts:
### UB-22 Package Installer
- Have script be able to detect what OS distro you are running and install `docker` & `docker-compose` based on the machines distro. 
- Be able to give the user the option to install the above packages by selecting a number and agreeing to install them
  - `(1) install nala`
  - `(2) install docker`
  - `(3) install docker-compose` 
  - `(4) install zsh & oh-my-zsh` 
