# Tools

### Cadence:
- [IRUN](https://picture.iczhiku.com/resource/eetop/ShIgepQHdUhOexxx.pdf)
- [Simvision](https://github.com/gs1293/pdfs/blob/main/tools/simvision.pdf) | [Source](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.433.382&rep=rep1&type=pdf) | [playlist](https://www.youtube.com/playlist?list=PLYdInKVfi0KYzCjnkgRgDXFJcKyQRz6eM)
- [IMC Coverage](https://manualzz.com/doc/33007293/incisive-coverage-user-guide)
- Command: cdnshelp // To access all the product manuals

### Synopsys:
- [VCS : Verilog Compiler Simulator](https://github.com/gs1293/pdfs/blob/main/tools/vcs.pdf) | [Source](https://inst.eecs.berkeley.edu/~eecs151/sp18/files/vcsmx_ug.pdf)
- [DVE : Discovery Visual Environment](https://github.com/gs1293/pdfs/blob/main/tools/dve.pdf) | [Source](https://inst.eecs.berkeley.edu/~eecs151/sp18/files/dve_ug.pdf)
- [DC : Design Compiler](https://github.com/gs1293/pdfs/blob/main/tools/design_compiler.pdf) | [Optimization](https://github.com/gs1293/pdfs/blob/main/tools/dc_optimization.pdf) | [Synthesis Quick Reference](https://github.com/gs1293/pdfs/blob/main/tools/synthesis.pdf)
- Spyglass Lint
- [Verdi](https://github.com/gs1293/pdfs/blob/main/tools/verdi.pdf) | [Source](https://pdfslide.net/documents/verdi-3-user-guide-and-tutorial.html) | [playlist](https://www.youtube.com/playlist?list=PLEgCreVKPx5ANYtZgq6S4nZp6lZbNpNEQ)

### Ansys:
- Power Artist

### Intel:
- Quartus

### Mentor Graphics:
- [ModelSim](https://www.microsemi.com/document-portal/doc_download/136662-modelsim-me-10-5c-user-u-s-manual-for-libero-soc-v11-8)

### Open Source:
- [Icarus Verilog](http://iverilog.icarus.com/) [(user_guide)](https://iverilog.fandom.com/wiki/User_Guide)
- [EDA Playground](https://www.edaplayground.com/)
- [Verilator](https://www.veripool.org/verilator/)
- [GTKWave](http://gtkwave.sourceforge.net/) [(user_guide)](http://inf-server.inf.uth.gr/~konstadel/resources/Icarus_Verilog_GTKWave_guide.pdf)
- [Wavedrom](https://wavedrom.com/)

# Dumps:
- VCD : Value Change Dump
- VPD : VCD Plus
- FSDB : Fast Signal DataBase
- SHM :
  ```tcl
  # Filename       : cmd.tcl, 
  # Usage with irun: -input cmd.tcl
  
  # setting waveform dump directory/name/size
  database -open -shm -into waveform/waves.shm waves -default -incsize 500M
  
  # modify top module name: "tb_top" as per usage
  probe -create tb_top -depth all -all -dynamic -memories -shm -waveform
  
  run
  exit
  ```
- https://inst.eecs.berkeley.edu/~cs250/fa09/handouts/tut4-vcs.pdf
- https://topic.alibabacloud.com/a/methods-for-generating-various-waveform-files-vcdvpdshmfsdb_8_8_30045794.html
- https://www.programmersought.com/article/6864495497/


Check each tool details and their report format
Add commands with most used flags explanation

## Commands:
- ```bash
  irun
  ```
- ```bash
  simvision
  ```
- ```bash
  vcs
  ```
- ```bash
  dve
  ```
- ```bash
  dc_shell
  ```  
