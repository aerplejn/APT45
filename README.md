# APT45.Tools

APT45.Tools is a collection of scripts I came across on a sketchy forum. Aimed at vehicle diagnostics, phone research, and hacking. These scripts are tailored for use on [Gentoo Linux](https://gentoo.org).

## How To Install

### Install Full Desktop

To Install The Full Desktop:

```bash
cd APT45Tools
sudo chmod +x *.sh
./workstationinstall.sh
```

### Install Tools Only

To Install Only The Tools:

```bash
cd APT45Tools
sudo chmod +x *.sh
./toolinstall.sh
```

## OBDII Adapters
* Required for Vehicle Diagnostics: Ensure your OBDII adapter supports the protocol used by your vehicle. Common protocols include ISO 9141-2, ISO 14230-4 (KWP2000), and ISO 15765-4 (CAN bus).


## Recommended Reading
To deepen your understanding of vehicle hacking and CAN bus protocols, consider the following resources:

* Car Hacker's Handbook by Craig Smith: [Available at Internet Archive](https://archive.org/details/car-hackers-handbook-the-craig-smith)
* SocketCAN Documentation: [Found on LinkLayer Wiki](https://wiki.linklayer.com/index.php/SocketCAN)

## WARNING
* Use at Your Own Risk: The author is not liable for any damage to vehicles, phones, or other devices resulting from the use of these tools.
* Security and Legal Considerations: These tools should not be used for unauthorized access or tampering. Always be aware of the legal implications in your jurisdiction before using such software.
