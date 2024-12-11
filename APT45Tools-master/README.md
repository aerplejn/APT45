# CarHacking.Tools

CarHacking.Tools is a scripts collection of scripts to help jump start car research (and hacking?). All the scripts are designed and update to run on [Ubuntu 20.04](ubuntu.com).

## How To Install

### Install Full Desktop

To Install The Full Desktop:

```bash
Git clone https://github.com/jgamblin/carhackingtools
cd CarHackingTools
sudo chmod +x *.sh
./workstationinstall.sh
```

### Install Tools Only

To Install Only The Tools:

```bash
git clone https://github.com/jgamblin/carhackingtools
cd carhackingtools
sudo chmod +x *.sh
./toolinstall.sh
```

## OBDII Adapters

You will need an OBDII adapter to get started.  

Here are three of my favorites that I own and test with:

| Tool Name | Link | Notes |
| ------------- | ------------- | ----- |
| USB ELM327 | <http://a.co/7YrtPui> | Best for getting started and virtual environments. |
| Veepeak Bluetooth | <http://a.co/80FLIMV> | Great for permanent installs and using with your phone. |
| Cantact | <https://hackerwarehouse.com/product/cantact-bundle/> | An amazing open-source project for advanced users. |
| $10 Veepeak Bluetooth | <http://a.co/ajFbcZ4> |  Great for getting started has some limitations. |

## Included Tools

The following tools are installed and configured automatically:

| Tool Name | Link | Notes |
| ------------- | ------------- | ----- |
| Can-Utils | <https://github.com/linux-can/can-utils> | Basic CAN tool. |
| Canbus-Utils |  <https://github.com/digitalbond/canbus-utils> | Basic CAN tool. |
| Cantact-App |  <https://github.com/linklayer/cantact-app/> | Built to work with the Cantact Harware. I have not got it to work yet. |
| Caringcaribou | <https://github.com/CaringCaribou/caringcaribou> |  |
| GNUradio | <https://www.gnuradio.org/> | If you want to look at door locks and TPM modules. |
| c0f |  <https://github.com/zombieCraig/c0f> | |
| ICSim |  <https://github.com/zombieCraig/ICSim> | Basic simulator for testing without a car.  |
| KatyOBD |  <https://github.com/YangChuan80/KatyOBD> | A really neat project that provides a GUI. I want to fork this and make it better. |
| Kayak |  <http://kayak.2codeornot2code.org/> | |
| OBD-Monitor |  <https://github.com/dchad/OBD-Monitor> | A rally neat project that provides a GUI. Needs some documentation work. |
| PyOBD |  <http://www.obdtester.com/pyobd> | Super old tool, still works, kinda. |
| Python-OBD |  <https://github.com/brendan-w/python-OBD> | Use over PIP install. |
| SavvyCAN |  <http://www.savvycan.com/> | Basic CAN tool. |
| Scantool |  <https://www.scantool.net/> | Super old tool but still works. |
| UDSim |  <https://github.com/zombieCraig/UDSim> | Basic simulator for testing without a car. |
| Wireshark |  <https://www.wireshark.org/> | Great for capturing OBDII data just like you would ethernet data. |  

## Stuff To Read

The following sites have been useful to me:

| Link | Notes |
| ------------- | ------------- |
| <https://archive.org/details/car-hackers-handbook-the-craig-smith> | Car Hacking Handbook |
| <https://wiki.linklayer.com/index.php/SocketCAN> | I use this when I forget how to enable can0 |

## Warning

I likely don't know what I am doing and this could be done faster, better and simpler some other way. These scripts could also break your car (seriously) and make you cry.

## Github Action Badges

![Lint Code Base](https://github.com/jgamblin/CarHackingTools/workflows/Lint%20Code%20Base/badge.svg)
