# Repository: Repository of the book

Leandro D. Medus  
University of Valencia  
[ April 2020 ]

---
**Summary**  
TBD

## Table of Content
TBD

### Ch1. Circuit-Level VHDL
### Ch2. Code structure
* Example 2.1: Compare-Add Circuit
* Example 2.2: D-type Flip Flop (DFF)
* Example 2.3: Registered Comp-Add Circuit
* Example 2.4: Generic Address Decoder
### Ch3. Code structure
Examples Index
* Example 3.1: Tri-state Buffer
* Example 3.2: Circuit with "Don’t Care" Outputs
* Example 3.3: Unsigned/Signed Multiplier \#1
* Example 3.4: Unsigned/Signed Multiplier \#2
* Example 3.5: Slicing a 1Dx1D Array of Integers
* Example 3.6: Slicing a 1Dx1D Array of Bit Vectors
* Example 3.7: Slicing a 2D Array of Bits
* Example 3.8: Multiplexer with 1Dx1D PORT
* Example 3.9: Recommended Signed Multiplier Implementation (for Integers)
Proof of Concepts Index
* PoC: fixed point
* PoC: floating point
* PoC: Records
### Ch4. Code structure
Examples Index
* Example 4.1: Using Predefined Scalar Attributes
* Example 4.2: DFF with Several Event-Based Attributes
* Example 4.3: Specifying Device Pins with the chip-pin Attribute
* Example 4.4: Construction of a Delay Line with the keep Attribute
* Example 4.5: Keeping Redundant Registers with preserve and noprune Attributes
Proof of Concepts Index
* PoC: alias usage
### Ch5. Code structure
Examples Index
* Example 5.1: Multiplexer Implemented with Operators
* Example 5.2: Multiplexer Implemented with WHEN and SELECT
* Example 5.3: ALU
* Example 5.4: Generic Address Decoder with GENERATE
* Example 5.5: COMPONENT Instantiation with GENERATE
* Example 5.6: DFF Implemented with Concurrent Code
    (Implementing Sequential Circuits with Concurrent Code)
* Example 5.7: Recommended Adder/Subtracter Implementation
* Example 5.8: Short-Pulse Generator with the keep Attribute
### Ch6. Sequential Code
Examples Index
* Example 6.1: DFFs with Reset and Clear
* Example 6.2: Basic Counter
* Example 6.3: Shift Register


Notes:

``tcl
D:\Repos\FPGA\book_circuit_design_2010\scripts>vivado -mode batch -source auto_generate_project.tcl -tclargs --origin_dir ../ch5 --project_name ex_5.1  --module_name mux
``

``sh
D:\Repos\FPGA\book_circuit_design_2010\scripts>python generate_test_bench.py ..\ch4\poc_alias\src\poc_alias.vhd
``
