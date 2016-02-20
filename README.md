# One Month Rails

This is the pinteresting sample application for [*One Month Rails*](http://onemonthrails.com)

by Chloe Echikson

## Set-up for Development environment.

### Installing required software:

1) Download and Install [Vagrant](http://www.vagrantup.com/downloads.html)

2) Download and Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

3) Download and open/install the appropriate [VM Virtualbox Extension Pack](https://www.virtualbox.org/wiki/Downloads)

4) Ensure git CLI on host machine

5) If you are on Windows, see the [Set-Up Instructions For Windows](#Set-Up+Instructions+For+Windows) section below, then return here.


### Set-up and run this app:

#### Git Clone the repo wherever you'd like it.

```terminal
$ git clone https://github.com/cloworm/pinteresting.git
$ cd pinteresting
```

#### Access your Vagrant box.

Start up your Vagrant VM (provisioning may take a while the first time you `up`)
```terminal
$ vagrant up
```

Log into your Vagrant VM (via ssh)

1) ssh into your Vagrant VM (see windows instructions if you are on Windows)
```terminal
$ vagrant ssh
```

You should notice your command prompt has changed to something like this:
```terminal
vagrant@pinteresting:~$
```

#### Enter the project directory

2) Change directory into the shared project folder (shared meaning the files are shared between your Vagrant and your Host machine)
```terminal
$ cd pinteresting
```

#### Install gems.

3) Make sure all the required gems are installed:
```terminal
$ bundle install
```

#### Set up database.

4) Make sure the database is migrated to latest:
```terminal
$ rake db:migrate
```

5) Seed your database with some required values:
```terminal
$ rake db:seed
```

#### Run the app!

6) Start your rails server (specifying IP 0.0.0.0 so it works from Vagrant)
```terminal
$ rails s -b 0.0.0.0
```

7) Visit `localhost:3000` in your favorite web browser!

### Set-Up Instructions For Windows:

5) Download and Install [PuTTy](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) [putty.exe](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe)

6) Download and Install [PuTTYgen](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) [puttygen.exe](http://the.earth.li/~sgtatham/putty/latest/x86/puttygen.exe)

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

## Common Vagrant commands.

For a full list of commands type:
```terminal
vagrant -h
```

### Stop Vagrant

To suspend (sleep):
```terminal
vagrant suspend
```

To halt (shutdown):
```terminal
vagrant halt
```




