# One Month Rails

This is the pinteresting sample application for [*One Month Rails*](http://onemonthrails.com)

by Chloe Echikson

#### Set-Up Instructions For Windows:
1) Download and Install [Vagrant](http://www.vagrantup.com/downloads.html)

2) Download and Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

3) Download and open/install the appropriate [VM Virtualbox Extension Pack](https://www.virtualbox.org/wiki/Downloads)

4) Ensure git CLI on host machine

5) Download and Install [PuTTy](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) [putty.exe](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe)

6) Download and Install [PuTTYgen](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) [puttygen.exe](http://the.earth.li/~sgtatham/putty/latest/x86/puttygen.exe)

-------------

#### Git Clone the repo where ever you'd like the machine
```terminal
$ git clone https://github.com/cloworm/pinteresting.git
$ cd pinteresting
```
#### Start Vagrant

To Start up your VM in cmd or powershell
```terminal
$ vagrant up
```
#### 1) Generate SSH Keys With PuTTyGen (You only do this once)

* Open puttygen.exe

* Click the "Load" button

* To the right of Filename at the bottom change the drop down from
"PuTTy Private Key Files (*.ppk)" to "All Files (*)"

* Navigate to the cloned repo folder (example 'Desktop/Websites/pinteresting')

* Navigate to the "private_key" file in
".vagrant/machines/default/virtualbox/private_key"
and click open on this file.

* Click 'Ok' to the PuTTyGen alert window

* Click "Save Private Key"

* Click 'Yes' to the PuTTyGen alert window

* Name the .ppk file "private_key" without quotes

* Save it in the same directory as putty for organization

* Close PuTTyGen

#### To SSH in to the VM:
#### 2) SSH into Vagrant with PuTTy (This is how you will vagrant-ssh)

* Open putty.exe

##### IN SESSION:

* Set "Host Name (or IP address)" to "127.0.0.1"
* Set "Port" to "2222"
* Set "Connection Type" to "SSH"

##### IN CONNECTION/SSH/AUTH:

* Check "Display pre-authentication banner (SSH-2 only)"
* Check "Attempt authenticating using Pageant"
* Check "Attempt "keyboard-interactive" auth (SSH-2)"
* Check "Allow agent forwarding"
* Check "Allow attempted changes of username in SSH-2"
* Click Browse and navigate to the "private_key.ppk" file you
generated in the putty directory

##### IN SESSION:

* Type "vagrant" (no quotes) in the Saved Sessions input
* Click Save

To open the vagrant box from this point on you may skip the
putty setup. You will only need to open the putty.exe file and
double click "vagrant" in the saved sessions list after running
"vagrant up" in cmd or powershell.


Navigate to synced folders directory:
```terminal
$ cd /vagrant
```

#### Stop Vagrant

To suspend:
```terminal
vagrant suspend
```
To halt:
```terminal
vagrant halt
```

# Rails from Vagrant

As of Rails 4.2 you must specify the IP of 0.0.0.0 to be able to connect to your server
running in your vagrant box.

```
rails s -b 0.0.0.0
```
