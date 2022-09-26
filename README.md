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

After this, you can clone things using 

```
git clone https://github.com/doctorwise/psychic-fortnight.git
cd psychic-fortnight
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

To run all the tests, simply run

```
./runAllTests.sh
```

This may take a while, but it will produce new `.vcd` files in the `tests`
sub-directory of each example that you can view with GTKWave (there should
have been some from the last time I ran in the directory you've downloaded /
cloned if you want to go ahead and view). When it finishes, you should be 
able to see whether the individual tests passed or failed.

#### Running individual tests

If you want to run an individual test, navigate to the tests directory of the
module you care about and type `make`. For example, execute

```
cd hdl/4_32_mealy/tests
make
```

to run the test for the Mealy machine example from 4_32 of the text.

### Writing your own modules

Let's walk through an example of how to do write and test your own modules in
SystemVerilog and VHDL using our `psychic-fortnight` framework. 

1. Let's say we want to write and test a module called `controller` that can be
implemented using a Moore machine. Let's copy the Moore machine example to 
a new directory and we'll change that to suit our interests.

```
cd hdl # assume we started from psychic-fortnight's home directory
cp -r 4_31_moore controller # make a new directory called controller that is a copy of 4_31_moore
```

As a sanity check, let's make sure the tests still run in the copied version.

```
cd controller/tests
make
```

You should see several instances of the word `PASS` and be very happy inside.

2. Now, let's change things so that when we type `make` to run our tests,
our test framework looks for the `controller` module instead of the `moore`
module within the `4_31_moore` example. This is easy. Open `TOPLEVEL.txt`
from the `tests` directory and replace the word `moore` with the name of your
top level module that will be the device under test (DUT). That is, change
`moore` to `controller`.
If you type `make` now (to run the tests), you'll see errors like the following:
```
...
error: Unable to find the root module "controller" in the Verilog source.
...
/usr/bin/ghdl-mcode:error: cannot find entity or configuration controller
...
``` 

 This is a good thing. It just means we need to go change things so that we 
actually have a top-level module named `controller`.

3. Let's add a SystemVerilog and VHDL implementation for the `controller`
module. Note that when we type `make` our framework will look at all source 
files in `controller/hdl/sv` and `controller/hdl/vhdl` to find the toplevel
module `controller` in each language. It will also search these files to 
fullfill any definitions for submodules you include in structural designs.
As a result, to make the errors above go away, let's provide a definition for 
the `controller` module in each language.
```
# from controller/tests
cd ../hdl/sv # move to the Verilog source directory
mv moore.sv controller.sv # note that filename is really irrelevant
```

 Now open the file controller.sv in the editor of your choice and change 
all instances of the word `moore` to `controller`. That leaves us with a
valid SystemVerilog implementation corresponding to the test in
`controller/tests/test.py` that we can then modify to match our requirements.
Do the same thing in `controller/hdl/vhdl`. At this point, you should be 
able to navigate back to the test directory, run `make`, and the tests should
pass once again. 

4. Now we will create a model of the logic by navigating to
`controller/model/model.py` and modifying it accordingly. You can use a class,
function, etc. Whatever seems to fit the situation best and make it easy to 
write your test in `tests/test.py`.

5. Now that we have a model of our logic, we can write our test in terms of it.
Start with a *very* simple (set of) test case(s) and grow from there.
Navigate to `controller/tests/test.py` and modify the tests to do what you want.
I provide several examples for combinational logic and sequential logic that 
should help you get going. If you have issues, Cocotb also has great examples
to get you started.

6. Modify the `.sv` files in `controller/hdl/sv` and the `.vhd` files in
`controller/hdl/vhdl` to provide implementations of the logic you modeled in
`model/model.py` and defined a test for in `tests/test.py`.

7. Debug! At this point, you should iterate back and forth among your HDL
and your tests. Use the wave files to verify that your HDL matches the expected
behavior and to isolate cases where you might be going wrong. And sometimes,
the test can be wrong, so you may have to validate that the test is giving 
expected results.

#### References to help get you started

- Harris and Harris, *Digital Design and Computer Architecture (ARM Edition)*
- [cocotb docs](https://docs.cocotb.org/en/stable/)
- [GTKWave website](https://gtkwave.sourceforge.net/)

### Viewing wave files in GTKWave

To view a wave file in GTKWave, do something like the following:

```
# assume we start from psychic-fortnight's home directory
cd hdl/4_32_mealy/tests
gtkwave wave_sv.vcd # to view the wave file generated while testing the Verilog
gtkwave wave_vhdl.vcd # to view the wave file generated while testing the VHDL
```
#### A note on X11 forwarding (if you run remote, but want GUIs)

In the prereq stuff above we installed `x11-tools` so that you can test out your
X11 forwarding if you are on a remote machine / instance. If you did that,
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

