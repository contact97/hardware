# Techniques for Designing a Counter:

## Flops:

Each flip-flop stores a single bit of data, which is emitted through the Q output on the east side. Normally, the value can be controlled via the inputs to the west side. In particular, the value changes when the clock input, marked by a triangle on each flip-flop, rises from 0 to 1; on this rising edge, the value changes according to the corresponding table below.

D Flip-Flop	T Flip-Flop	J-K Flip-Flop	S-R Flip-Flop
D	Q
0	0
1	1
T	Q
0	Q
1	Q'
J	K	Q
0	0	Q
0	1	0
1	0	1
1	1	Q'
S	R	Q
0	0	Q
0	1	0
1	0	1
1	1	??
Another way of describing the different behavior of the flip-flops is in English text.
D Flip-Flop: When the clock rises from 0 to 1, the value remembered by the flip-flop becomes the value of the D input (Data) at that instant.
T Flip-Flop: When the clock rises from 0 to 1, the value remembered by the flip-flop either toggles or remains the same depending on whether the T input (Toggle) is 1 or 0.
J-K Flip-Flop: When the clock rises from 0 to 1, the value remembered by the flip-flop toggles if the J and K inputs are both 1, remains the same if they are both 0, and changes to the K input value if J and K are not equal. (The names J and K do not stand for anything.)
R-S Flip-Flop: When the clock rises from 0 to 1, the value remembered by the flip-flop remains unchanged if R and S are both 0, becomes 0 if the R input (Reset) is 1, and becomes 1 if the S input (Set) is 1. The behavior in unspecified if both inputs are 1. (In Logisim, the value in the flip-flop remains unchanged.)
