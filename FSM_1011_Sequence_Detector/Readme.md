# 1011 Pattern Detector FSMs in Verilog

This project contains Mealy and Moore implementations of a 1011 pattern detector with Overlapping and Non-Overlapping detection.

## Files
- `Melay_1011_Overlap.v` – Mealy FSM, overlapping pattern
- `Melay_1011_NonOverlap.v` – Mealy FSM, non-overlapping pattern
- `Moore_1011_Overlap.v` – Moore FSM, overlapping pattern
- `Moore_1011_NonOverlap.v` – Moore FSM, non-overlapping pattern
- `testbench.v` – Testbench simulating all four FSM
- `1011_Sequence_Detector_Waveform.png` - Waveform for all four FSM
- 
## Note
- Mealy FSM: output reacts immediately to the input.  
- Moore FSM: output updates one clock cycle later because it depends on the state transition.
