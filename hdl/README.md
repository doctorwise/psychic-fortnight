## Notes on dependencies

To run these examples, you'll want to install ghdl (for vhdl simulation), icarus (for verilog), 
and cocotb (for running the testbenches). ghdl and icarus should be easily installable via your
package manager on mainstream Linux distributions, while cocotb should be installed via pip3.

## Layout

To work with these examples, I've organized things in just as they do with cocotb's examples.
Each example is numbered by its corresponding section in the textbook (at least if it came 
from the textbook, which all of them did at the time this was written). Each example folder
comprises three folders hdl, model, and tests.

Example:

	4_1_sillyfunction
		|
		|____  hdl 
		|	|
		|	|____ sv (SystemVerilog source files)
		|	|
		|	|____ vhdl (VHDL source files)
		|
		|
		|____  model (contains a Python-exposed model)
		|
		|
		|
		|____  tests
			 |
			 |____ Makefile (type make to run the tests)
			 |
			 |____ TOPLEVEL.txt (specify the name of the toplevel vhdl and verilog entity / module)
                         |
                         |____ test.py (the top-level cocotb test)


## Running tests

You can run all the tests at once with the top level command `./runAllTests.sh`.

## Conclusion

Hopefully, these examples will provide you with an easy means of getting started working 
through developing your own projects. If you have any questions, comments, or recommendations,
please don't hesitate to reach out via michael.wise@uah.edu.

Happy coding,

Dr. Wise
