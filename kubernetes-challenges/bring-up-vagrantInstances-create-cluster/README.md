
#To bring up the instance, run below command from location where vagranfile is
```
]#vagrant up
Bringing machine 'master' up with 'virtualbox' provider...
Bringing machine 'node1' up with 'virtualbox' provider...
Bringing machine 'node2' up with 'virtualbox' provider...
==> master: Importing base box 'centos/7'...
.....
......
```

Once complete to view the vagrant box status

```
]#vagrant status
Current machine states:

master                    running (virtualbox)
node1                     running (virtualbox)
node2                     running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```

To login to vagrant box
```
]#vagrant ssh master
[vagrant@master ~]$
```

For graceful shutdown 
```
]#vagrant halt
```

To bringup the shutdown instance
```
]#vagrant up
```

To remove VM altogether from your machine
```
]#vagrant destroy
```