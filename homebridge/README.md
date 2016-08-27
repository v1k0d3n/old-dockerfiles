[![Docker Repository on Quay](https://quay.io/repository/v1k0d3n/homebridge/status "Docker Repository on Quay")](https://quay.io/repository/v1k0d3n/homebridge)

# Homebridge
As you could imagine, this is a container to run your homebridge services. As an example, you may want to run them on your Synology Diskstation, as documented [on my website JinkIT.com](http://www.jinkit.com/docker-on-synology/). Currently it supports the following homebridge services:

- IFTTT
- Liftmaster
- Luxtron
- Nest
- Ninjablock (Temp, Humidity, Alarm)
- Philips Hue

If you would like to see additional packages installed, follow me on [Twitter](https://twitter.com/v1k0d3n) and/or send me a message.

To run:

```
docker run -d --net=host --name=homebridge -v /path/to/your/homebridge/directory:/root/.homebridge -p 51826:51826 v1k0d3n/homebridge
```
