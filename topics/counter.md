# Techniques for Designing a Counter:

## Flip-Flops:

- Each flip-flop stores a single bit of data, which is emitted through the Q output.
- Normally, the value can be controlled via the inputs to the flip-flop.
- In particular, the value changes at the active clock edge according to the corresponding table below:

**D Flip-Flop**
| D | Q |
| :---: | :---: |
| 0 | 0 |
| 1 | 1 |

**T Flip-Flop**
| T | Q  |
| :---: | :---: |
| 0 | Q  |
| 1 | Q' |

**J-K Flip-Flop**
| J | K | Q  |
| :---: | :---: | :---: |
| 0 | 0 | Q  |
| 0 | 1 | 0  |
| 1 | 0 | 1  |
| 1 | 1 | Q' |

**S-R Flip-Flop**
| S | R | Q  |
| :---: | :---: | :---: |
| 0 | 0 | Q  |
| 0 | 1 | 0  |
| 1 | 0 | 1  |
| 1 | 1 | ?? |
