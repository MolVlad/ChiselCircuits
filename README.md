# Summer@EPFL 2021, VLSC Lab

## Repository structure

- src/main/scala/elastic/ - contains source Chisel code for implemented circuits
- src/test/scala/ - contains tests generating .v files and waveforms for implemented circuits
- tested/ - contains generated .v files, .fir and .vcd for implemented circuits
- notebooks/ - contains .ipynb notebooks for testing how some algorithms behave
- annotations/ - contains .anno.json files for simulation
- simulation/ - contains input and output data of simulation

## Implemented circuits

### Rotation

- Source file: src/main/scala/elastic/simple/Rotation.scala

- Tester file: src/test/scala/simple/TestRotation.scala

- N cyclic shifts of M bits register. Elastic input/output interfaces. Can be replaced by one shift.

- Description in draw.io: [link](https://drive.google.com/file/d/1ZJaClURfavJDERpspQ7ucHhV-1-SBw-p/view?usp=sharing)

- Generated Verilog code: tested/Rotation/Rotation.v

- File with waveforms: tested/Rotation/simple.TestRotation2077595529/Rotation.vcd

- FIR file: tested/Rotation/simple.TestRotation2077595529/Rotation.lo.fir

- Annotation file: annotations/Rotation.anno.json

- Simulation input/output directory: simulation/Rotation

### Computing

- Source file: src/main/scala/elastic/simple/Computing.scala

- Tester file: src/test/scala/simple/TestComputing.scala

- N iterations of the same computations on (x,y) input vector. Elastic input/output interfaces. Can be replaced by one iteration of resulting computation.

- Description in draw.io: [link](https://drive.google.com/file/d/1KCATx1qMiwqr44wRrVnU7MRL8tNAJyF0/view?usp=sharing)

- Generated Verilog code: tested/Computing/Computing.v

- File with waveforms: tested/Computing/simple.TestComputing1506453487/Computing.vcd

- FIR file: tested/Computing/simple.TestComputing1506453487/Computing.lo.fir

- Annotation file: annotations/Computing.anno.json

- Simulation input/output directory: simulation/Computing

### Multiplier

- Source file: src/main/scala/elastic/simple/Multiplier.scala

- Tester file: src/test/scala/simple/TestMultiplier.scala

- N iterations of the same computations on (x,y) input vector. Elastic input/output interfaces. Can be replaced by one iteration of resulting computation.

- Description in draw.io: [link](https://drive.google.com/file/d/1ZOu5aroX90wGEzHSHMdpd5KaGDYEAWZi/view?usp=sharing)

- Generated Verilog code: tested/Multiplier/Multiplier.v

- File with waveforms: tested/Multiplier/simple.TestMultiplier920381798/Multiplier.vcd

- FIR file: tested/Multiplier/simple.TestMultiplier920381798/Multiplier.lo.fir

- Annotation file: annotations/Multiplier.anno.json

- Simulation input/output directory: simulation/Multiplier

### Dot product

### 



## Simulator settings

![Simulator](/pics/simulation.png)
Format: ![Alt Text](url)

