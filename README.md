# autorip
Software to turn your raspberry pi into a CD ripping appliance.

## Usage
Install with

```
sudo ./install.sh 
```

May need to reconfigure locales since Raspbian is set to GB:
```
sudo dpkg-reconfigure locales
```

Then simply attach a USB cddrive, plug in a USB flash drive.  CDs will autorip to the USB flash drive, and all mounting/unmounting, metadata, album covers, etc are taken care of.

## Monitor
You can monitor logs at the included web server on port 8080.

## Recommendations

* Plug your CD drive into a powered USB hub.  The Raspberry pi usb ports have trouble supplying enough voltage.
* Use a Rasbpberr pi 3 or better
