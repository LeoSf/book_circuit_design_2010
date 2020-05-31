# Repository: Repository of the book

Leandro D. Medus  
University of Valencia  
[ April 2020 ]

---
**Summary**  
TBD

## Table of Content
TBD

## I CIRCUIT-LEVEL VHDL
### Ch1. Circuit-Level VHDL

### Ch2. Code structure
* Example 2.1: Compare-Add Circuit
* Example 2.2: D-type Flip Flop (DFF)
* Example 2.3: Registered Comp-Add Circuit
* Example 2.4: Generic Address Decoder

### Ch3. Data Types
**Examples Index**
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

### Ch4. Operators and Attributes
**Examples Index**
* Example 4.1: Using Predefined Scalar Attributes
* Example 4.2: DFF with Several Event-Based Attributes
* Example 4.3: Specifying Device Pins with the chip-pin Attribute
* Example 4.4: Construction of a Delay Line with the keep Attribute
* Example 4.5: Keeping Redundant Registers with preserve and noprune Attributes

**Proof of Concepts Index**
* PoC: alias usage

### Ch5. Code structure
**Examples Index**
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
**Examples Index**
* Example 6.1: DFFs with Reset and Clear
* Example 6.2: Basic Counter
* Example 6.3: Shift Register
* Example 6.4: Carry-Ripple Adder
* Example 6.5: Leading Zeros
* Example 6.6: Slow 0-to-9 Counter with SSD

### Ch7. SIGNAL and VARIABLE
**Examples Index**
* Example 7.1: Counter with SHARED VARIABLE
* Example 7.2: Analysis (not present here)
* Example 7.3: Counters with SIGNAL and VARIABLE
* Example 7.4: DFF with q and qbar
* Example 7.6: Dual-Edge Flip-Flop
* Example 7.7: Generic Hamming Weight with Concurrent Code

**Proof of Concepts Index**
* PoC 7.7: parity detector

## II SYSTEM-LEVEL VHDL
### Ch8. PACKAGE and COMPONENT
**Examples Index**
* Example 8.1: PACKAGE with FUNCTION and Deferred CONSTANT
* Example 8.2: Circular Shift Register with COMPONENT
* Example 8.3: Parity Detector with COMPONENT and GENERIC MAP
* Example 8.4: Shift Register with COMPONENT and GENERATE
* Example 8.5: Latch Implemented with a Guarded BLOCK (not synthesized)

**Proof of Concepts Index**
* PoC : configuration (simulation is not working properly)
-- entity in component instantiation with name changed

### Ch10. Simulation with VHDL Testbenches
**Examples Index**
* Example 10.1: Writing Values to a File
* Example 10.2: Reading Values from a File
* Example 10.3: Stimuli Generation
* Example 10.4: Type I Testbench for a Registered Mux
* Example 10.5: Type II Testbench for a Registered Mux
    -- same as ex_10.4 but the project is configured for the post-implementation timing simulation
* Example 10.6: Type IV Testbench for a Registered Mux
* Example 10.7: Type IV Testbench with a Record Type
* Example 10.8: Type IV Testbench with a Data File

## III EXTENDED AND ADVANCED DESIGNS

### Ch11. VHDL Design of State Machines
**Examples Index**
* Example 11.1: Vending-Machine Controller
* Example 11.2: Glitch-Free Vending-Machine Controller
* Example 11.3: Zero-to-Nine Counter
* Example 11.4: Car Alarm with Bypasses Prevented by a Flag
* Example 11.5: Car Alarm with Bypasses Prevented by Additional States
* Example 11.6: FSM with Embedded Timer
* Example 11.7: Traffic-Light Controller
* Example 11.8: Pushbutton Sequence Detector  

**Proof of Concepts Index**
* PoC :  poc_timing
* PoC :  poc_glitch


## Notes:

``tcl
D:\Repos\FPGA\book_circuit_design_2010\scripts>

vivado -mode batch -source auto_generate_project.tcl -tclargs --origin_dir ../ch5 --project_name ex_5.1  --module_name mux
``

``sh
D:\Repos\FPGA\book_circuit_design_2010\scripts>

python generate_test_bench.py ..\ch4\poc_alias\src\poc_alias.vhd

 python generate_test_bench.py ../ch7/ex_7.6/src/dual_edge.vhd
``
