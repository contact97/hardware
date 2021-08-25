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
  ```systemverilog
  initial
  begin
      $dumpfile("waveform.vcd");
      $dumpvars;
  end
  
  // Extra useful commands:
  $dumpfile("file.dump"); // Open a VCD database for logging
  $dumpvars(level,start_module); // The signal to be recorded, level=0 means record all
  $dumpflush; // Save VCD data to disk (do not understand)
  $dumpoff; // stop recording
  $dumpon; // restart recording
  $dumplimit(); // Limits the size of the VCD file in bytes
  $dumpall; // records all specified signal values
  
  $dumpvars; // Dump all levels of signal
  $dumpvars(1, top); // All signals in the Dump top module
  $dumpvars(2, top.u1); // Dump instance top. u1 and the signal below it
  $dumpvars(0, top.u2, top.u1.u13.q); // Dump top.u2 and all of its signals below, and the signal top.u1.u13.q.
  $dumpvars(3, top.u2, top.u1); // Dump top.u1 and top.u2 and all signals in the next two layers.
  
  ```
- VPD : VCD Plus
  ```systemverilog
  `ifdef WAVES_VPD
  initial
  begin
      $vcdpluson;
      $vcdplusmemon;
  end
  ```
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
  irun -i \
      -v 19.03 \
      -sv \
      -override_timescale \
      -timescale 1ns/1ns \
      -64bit \
      -nospecify \
      -licqueue \
      -profile \
      +xmaccess+rw \
      -nowarn TSNSPK \
      -nowarn WBVNEM \
      -nowarn FUNTSK \
      -nowarn CUVIHR \
      -nowarn DSEMEL \
      -nowarn DSEM2009 \
      -nowarn ICDPAVW \
      -uvmnoautocompile \
      -define SVT_UVM_TECHNOLOGY \
      -define CADENCE \
      +define+UVM_PACKER_MAX_BYTES=1500000 \
      +incdir+../tb \
      +incdir+../tests \
      -define I_RUN \
      -define $block \
      -f top_file \
      -input cmd.tcl \
      -svseed $seed_number \
      -logfile ./log/"$1""_""$block""_""$seed_number"".log" \
      -uvmhome $UVM_HOME \
      +C_RUN=$c_run \
      +DIRECTED_FRAME=$directed_frame \
      +GOLDEN_FRAME=$golden_frame \
      +RANDOM_FRAME=$random_frame \
      +WIDTH=$image_width \
      +HEIGHT=$image_height \
      +UVM_TESTNAME=$1 \
      +UVM_VERBOSITY=$verbosity  
 
  // Other options:
  +access+rwc
  -fast
  -licq
  -seed random
  -compile
  ```
- ```bash
  vcs -i \
      -v 1906.sp2.12 \
      -lca \
      -cm line+cond+fsm+tgl \
      -cm_dir coverage/"$1""_""$block""_""$seed_number"".vdb" \
      -sverilog +v2k -V \
      -override_timescale=1ns/1ns \
      -ntb_opts uvm \
      -debug_pp \
      -notice \
      -full64 \
      +plusarg_save \
      +memcbk \
      +nospecify \
      +notimingcheck \
      +vcs+lic+wait \
      +incdir+../tb \
      +incdir+../tests \
      +define+UVM_PACKER_MAX_BYTES=1500000 \
      +define+WAVES_VPD \
      +define+VCS_RUN \
      +define+$block \
      +DIRECTED_FRAME=$directed_frame \
      +GOLDEN_FRAME=$golden_frame \
      +RANDOM_FRAME=$random_frame \
      +WIDTH=$image_width \
      +HEIGHT=$image_height \
      +C_RUN=$c_run \
      -f top_file \
      +UVM_TESTNAME=$1
  
  simv -i \
      -v 1906.sp2.12 \
      -lca \
      -cm line+cond+fsm+tgl \
      -cm_dir coverage/"$1""_""$block""_""$seed_number"".vdb" \      
      +vcs+lic+wait \
      +nospecify \
      +notimingcheck \
      +ntb_stop_on_constraint_solver_error=1 \
      +ntb_random_seed=$seed_number \
      +vpdfile+waveform/"$1""_""$block""_""$seed_number"".vpd" \
      -l log/"$1""_""$block""_""$seed_number"".log" \
      run \
      +UVM_TESTNAME=$1 \
      +UVM_VERBOSITY=$verbosity      
  ```
- ```bash
  pa_shell -i -v 2020.r2.1 -dc_version 2017.09.sp5 -wait -artist -gui &
  ```
- ```csh
  set DATE = "`date '+%y%m%d'`"
  setenv DATE $DATE
  
  setenv SNPSLMD_QUEUE true
  
  dc_shell -i \
      -v 2018.06.sp2 \
      -f "./0_block_syn_script/dc.tcl" \
      -checkout "Test-Compiler" \
      -checkout "DesignWare" \
      -checkout "Power-Optimization" \
      -checkout "DC-Ultra-Opt" \
      -checkout "DC-Ultra-Features" \
      -no_local_init \
      -x "date" \
      -wait 14400 \
      -64bit \
      -output_log_file "./5_log/$DATE/syn.log"
  ```
- ```bash
  simvision -v 19.03 -i
  ```  
- ```bash
  # For Debugging:
  dve -v 1809.sp2.6 -full64 -global -i
  
  # For Code Coverage:
  dve -v 1809.sp2.6 -full64 -global -i -cov
  ``` 
- ```bash
  verdi -v 2016.06.sp2.3 -global -i
  ```   

## SpyGlass Lint Errors/Warnings:
- https://chipressco.wpcomstaging.com/2019/05/16/what-are-the-most-critical-errors-in-lint/
- https://www.techdesignforums.com/practice/guides/lint-rtl/
