# Finite-State-Machine(FSM) 

# Key Features

Mealy Overlapping and Non-Over lapping

Moore Overlapping and Non-Over lapping

# Mealy FSM

 In Mealy FSM output depends on "Current state + Input".
 
     No of states= No of bits.

# Moore FSM

In Moore FSM output depends only on current state.

     No of states =No of bits + 1.

# Mealy Overlapping Sequence Detector

In overlapping sequence detection, part of a sequence can be reused to detect the next sequence.

Example: Detecting the sequence "1011".

Input: 1011011

The first occurrence ends at position 4.

The detector can reuse the last ‘1’ of the first sequence as the start of the next sequence, so the second occurrence is detected ending at position 7.

✅ Advantage: Efficient, detects sequences earlier.

⚡ Output may be asserted more frequently due to overlap.

# Mealy Non-Overlapping Sequence Detector

In non-overlapping detection, once a sequence is detected, the machine resets or moves to the initial state before detecting the next occurrence.

Example: Detecting the sequence "1011".

Input: 1011011

The detector finds the first 1011 ending at position 4.

It does not reuse the last ‘1’. Instead, it restarts detection, so the next valid detection happens only after starting fresh.

✅ Advantage: Simpler, avoids multiple triggers for overlapping sequences.

⚡ Detection rate is slower, since overlaps are ignored.

# Moore Overlapping Sequence Detector

In overlapping sequence detection, the FSM can reuse part of the detected sequence to continue detecting the next sequence.

Example: Detect sequence "1011".

Input: 1011011

First detection occurs at bit position 4.

Since overlap is allowed, the last ‘1’ of the first sequence can be reused to begin checking the next sequence.

The next detection occurs at bit position 7.

✅ Advantage: Faster, detects back-to-back sequences.

⚡ Still one clock cycle delayed compared to Mealy because output is tied to state.

# Moore Non-Overlapping Sequence Detector

In non-overlapping detection, once a sequence is found, the FSM resets to the initial state before starting to look for the next sequence.

Example: Detect sequence "1011".

Input: 1011011

First detection happens at bit position 4.

After detection, the FSM resets instead of reusing the last bits.

So, the second detection will not occur immediately; it waits for a new, separate "1011" sequence.

✅ Advantage: Simpler and avoids multiple detections from the same overlap.

⚡ Detection rate is slower than overlapping mode.
