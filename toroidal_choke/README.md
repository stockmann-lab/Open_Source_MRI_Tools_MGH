# Toroidal choke 
3T (~125 MHz) Toroidal choke design and data

Design printed on dimension sst 1200es
Coils hand-wrapped with BELDEN 22 AWG magnet wire (p/n 8051)

# Coil test
Tested on 125 MHz hand-tuned coil -- design in EIT coil folder. 
Tests 1 and 2 measured resonance effects bridging over a capacitor in the coil loop for two chokes.
Test 3 measured blocking ability by connecting a twisted pair using both chokes.
Baseline was measured before and after all tests, to account for some shifts during soldering.

# FEKO model
Modeled in FEKO 2019. The model does not exactly match the data (250 MHz vs 150 MHz) -- this is likely due to small changes in capacitance, which were measured to be near 1 pF.

# Thermal data
Data was taken with FLIR-E6390. We ran 3 Amps DC through the choke for 10 minutes while covered by a cup, then immediately photographed the coil in visible and IR. 