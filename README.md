# Psychic Fortnight: Repo for CPE 221 with Dr. Wise (Fall 2022)

This repo (at the moment) comprises two folders `arm` and `hdl`.
The `arm` folder provides examples and a workspace to easily develop,
simulate, and test ARM assembly programs. The `hdl` folder provides
examples and a convenient environment to develop, simulate, and test
logic in SystemVerilog and VHDL. We utilize cocotb for our testing framework.

## Getting started

I assume that you're running on a reasonably new Linux distro (either
Fedora / CentOS / RHEL or Ubuntu / Debian, etc.). Further, I assume that
you've installed the main development / build tools such as git, etc.
Furthermore, I assume that python3 is installed as well as pip.
If you still need to do these things, run the following: (in Debian-style
syntax, though Fedora style is just as easy with `dnf`, "Development Tools",
etc.):

```
sudo apt update
sudo apt install -y build-essential python3 python3-pip
```

## ARM (coming soon)

Check back here for updates as soon as we get to this portion of the course.

## HDL  

For SystemVerilog, I opted to use Icarus Verilog as the simulator since it 
was easy to install, free, and interfaced well with cocotb. For VHDL, I opted
for GHDL for the same reasons. Finally, GTKWave is a useful tool to view
generated wave files from testbenches you run.

### Prerequisites

To get install prerequisites, run 

```
sudo apt update # if you haven't already
sudo apt install ghdl iverilog gtkwave x11-apps
```

### Running tests


### A note on X11 forwarding (if you run remote, but want GUIs)

Note that above, I installed x11-tools so that you can test out your X11 
forwarding if you are on a remote machine / instance. At this point,
you should be able to type and run `xeyes` from the command line and see 
a lovely pair of comical eyes following your cursor as you move it around
the screen. Not creepy at all... If you don't see this and you are ssh'ed into
a remote machine, exit out to your local shell and add the `-X` flag to your 
ssh command. For example,

```
ssh -X doctorwise@themostamazingserverintheworld.awesomesauce.com
```

will log you back in and make sure things are set up locally. (If you are on
a Mac, you'll also need to install XQuartz for this to work). If this still
doesn't work, you will need to modify `/etc/ssh/sshd_config`. Search for 
the phrase `X11Forwarding`. Most likely, if things aren't working, you'll see

```
...
X11Forwarding no
...
```

Change the `no` to a `yes`. Then restart the ssh service by running

```
sudo systemctl restart sshd
```

Log out, log back in, and try to run `xeyes` again (you may not even have
to log out, actually).  
