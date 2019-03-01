# CHINA-ISP-IPSET
  
China ISP ip address collection with shell script to load from txt file.

## Following IPv4 address collection files: 

---

* telecom.txt -- for CHINA TELECOM 
* cmcc.txt    -- for China Mobile 
* unicom.txt  -- for China Unicom




## Load script "" usage:

---

```
load_ipset.sh  <ip-file>  <set-name>
```

## How to use

---

Add those lines to start-up file in LINUX-like system:

/etc/rc.local

```
/etc/load_ipset.sh  /etc/cmcc.txt  cmcc
/etc/load_ipset.sh  /etc/unicom.txt  unicom
...
```



