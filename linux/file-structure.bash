# we dont change
/bin : contains all linux command 
/sbin : contains all sysstem commands need sudo to be executed (iptable, adduser etc..)
/lib : hold libraries for those commands
/usr : usr location before home was created, 
/local : program that you install on your system will go there, third party apps
/opt : empty dir, that etait utilise 
/root : exclusively for the system

# we can change
/etc  : main configuration location
/dev : main devices(key, harddrive, )
/var : contains data that the system write when the system is runnng (ex: log, cache)
/tmp : if the system want to save some data temporaraly it will save there, and then it is deleted
/media : removable device