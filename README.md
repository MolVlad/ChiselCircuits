# Summer@EPFL 2021, VLSC Lab

## Repository structure

- src/main/scala/elastic/ - contains source Chisel code for implemented circuits
- src/test/scala/ - contains tests generating .v files and waveforms for implemented circuits
- tested/ - contains generated .v, .fir and .vcd for implemented circuits
- notebooks/ - contains .ipynb notebooks for testing how some algorithms behave
- annotations/ - contains .anno.json files for simulation
- simulation/ - contains input and output data of simulation

Descriptions in draw.io are available [here](https://drive.google.com/file/d/188H2ymluxmOLU3NYcowvTezDm3KV12Ll/view?usp=sharing)

## Implemented circuits

### Rotation

![rotation](/pics/rotation.png)

- N cyclic shifts of M bits register. Elastic input/output interfaces. Can be replaced by one shift.

- Description in draw.io: [link](https://drive.google.com/file/d/1ZJaClURfavJDERpspQ7ucHhV-1-SBw-p/view?usp=sharing)

- Source file: src/main/scala/elastic/simple/Rotation.scala

- Tester file: src/test/scala/simple/TestRotation.scala

- Generated Verilog code: tested/Rotation/Rotation.v

- File with waveforms: tested/Rotation/simple.TestRotation2077595529/Rotation.vcd

- FIR file: tested/Rotation/simple.TestRotation2077595529/Rotation.lo.fir

- Annotation file: annotations/Rotation.anno.json

- Simulation input/output directory: simulation/Rotation

### Computing

![computing](/pics/computing.png)

- N iterations of the same computations on (x,y) input vector. Elastic input/output interfaces. Can be replaced by one iteration of resulting computation.

- Description in draw.io: [link](https://drive.google.com/file/d/1KCATx1qMiwqr44wRrVnU7MRL8tNAJyF0/view?usp=sharing)

- Source file: src/main/scala/elastic/simple/Computing.scala

- Tester file: src/test/scala/simple/TestComputing.scala

- Generated Verilog code: tested/Computing/Computing.v

- File with waveforms: tested/Computing/simple.TestComputing1506453487/Computing.vcd

- FIR file: tested/Computing/simple.TestComputing1506453487/Computing.lo.fir

- Annotation file: annotations/Computing.anno.json

- Simulation input/output directory: simulation/Computing

### Multiplier

![multiplier](/pics/multiplier.png)

- 2N bits x 2N bits multiplier through one NxN multiplier. Elastic input/output interfaces. Can be replaced by one 2Nx2N multiplier.

- Description in draw.io: [link](https://drive.google.com/file/d/1ZOu5aroX90wGEzHSHMdpd5KaGDYEAWZi/view?usp=sharing)

- Source file: src/main/scala/elastic/simple/Multiplier.scala

- Tester file: src/test/scala/simple/TestMultiplier.scala

- Generated Verilog code: tested/Multiplier/Multiplier.v

- File with waveforms: tested/Multiplier/simple.TestMultiplier920381798/Multiplier.vcd

- FIR file: tested/Multiplier/simple.TestMultiplier920381798/Multiplier.lo.fir

- Annotation file: annotations/Multiplier.anno.json

- Simulation input/output directory: simulation/Multiplier

### Dot product

![dot_product](/pics/dot_product.png)

- Dot product with decoupled processing element (PE) inside. Elastic input/output interfaces. Can be replaced by the same with non-decoupled PE.

- Description in draw.io: [link](https://drive.google.com/file/d/1ma7tVbVkCrrIjvRdquVK7UjK_EdOL_Qn/view?usp=sharing)

- Source file: src/main/scala/elastic/dotProduct/DotProduct.scala

- Tester file: src/test/scala/dotProduct/TestDotProduct.scala

- Generated Verilog code: tested/DotProduct/DotProduct.v

- File with waveforms: tested/DotProduct/dotProduct.TestDotProduct1356469383/DotProduct.vcd

- FIR file: tested/DotProduct/dotProduct.TestDotProduct1356469383/DotProduct.lo.fir

- Annotation file: annotations/DotProduct.anno.json

- Simulation input/output directory: simulation/DotProduct

### Smith-Waterman FSM (Finite State Machine)

![smith_waterman_FSM](/pics/smith_waterman_FSM.png)

- Smith-Waterman algorithm with decoupled input/output interfaces. There is one PE inside, data is provided to it in state machine fashion. It can be replaced by pipelined version.

- Description in draw.io: [link](https://drive.google.com/file/d/1K2xo2UY3slTuP70wcAS1ndhKzJ4cuQF_/view?usp=sharing)

- Source file: src/main/scala/elastic/watermanFSM/WatermanFSM.scala

- Tester file: src/test/scala/waterman/TestWatermanFSM.scala

- Generated Verilog code: tested/WatermanFSM/WatermanFSM.v

- File with waveforms: tested/WatermanFSM/waterman.TestWatermanFSM645630855/WatermanFSM.vcd

- FIR file: tested/WatermanFSM/waterman.TestWatermanFSM645630855/WatermanFSM.lo.fir

- Annotation file: annotations/WatermanFSM.anno.json

- Simulation input/output directory: simulation/WatermanFSM

### Smith-Waterman Systolic

![smith_waterman_systolic](/pics/smith_waterman_systolic.png)

- Smith-Waterman algorithm with decoupled input/output interfaces. There are several PE inside, each PE has decoupled interfaces which introduce additional delays. These PEs can be replaced by those with non-decoupled interfaces.

- Description in draw.io: [link](https://drive.google.com/file/d/1VzJwCw8k09dzeBKJI_lbo1gNZ5CLUY8N/view?usp=sharing)

- Source file: src/main/scala/elastic/watermanSystolic/WatermanSystolic.scala

- Tester file: src/test/scala/waterman/WatermanSystolic.scala

- Generated Verilog code: tested/WatermanSystolic/WatermanSystolic.v

- File with waveforms: tested/WatermanSystolic/waterman.TestWatermanSystolic1603113079/WatermanSystolic.vcd

- FIR file: tested/WatermanSystolic/waterman.TestWatermanSystolic1603113079/WatermanSystolic.lo.fir

- Annotation file: annotations/WatermanSystolic.anno.json

- Simulation input/output directory: simulation/WatermanSystolic

### MD4 FSM

![md4_fsm](/pics/MD4_FSM.png)

- MD4 algorithm with decoupled input/output interfaces. There is one PE inside, data is provided to it in state machine fashion. It can be replaced by pipelined version.

- Description in draw.io: [link](https://drive.google.com/file/d/1asGKA9Lv1CrF5sAAwIt1P0GEh06kBszr/view?usp=sharing)

- Python notebook for testing MD4 algorithm: notebooks/md4-md5_testing.ipynb

- Source file: src/main/scala/elastic/MD4FSM/MD4FSM.scala

- Tester file: src/test/scala/md4/TestMD4FSM.scala

- Generated Verilog code: tested/MD4FSM/MD4FSM.v

- File with waveforms: tested/MD4FSM/md4.TestMD42115332283/MD4FSM.vcd

- FIR file: tested/MD4FSM/md4.TestMD42115332283/MD4FSM.lo.fir

- Annotation file: annotations/MD4FSM.anno.json

- Simulation input/output directory: simulation/MD4FSM

### MD4 Pipelined

![md4_pipelined](/pics/MD4_Pipelined.png)

- Fully pipelined MD4 algorithm, it produces data every clock cycle. Several PEs are connected by chain, each has elastic input/output interfaces. For each PE, new data and input valid are going through registers when output ready is high.

- Description in draw.io: [link](https://drive.google.com/file/d/188H2ymluxmOLU3NYcowvTezDm3KV12Ll/view?usp=sharing)

- Python notebook for testing MD4 algorithm: notebooks/md4-md5_testing.ipynb

- Source file: src/main/scala/elastic/MD4Pipelined/MD4Pipelined.scala

- Tester file: src/test/scala/md4/TestMD4MD4Pipelined.scala

- Generated Verilog code: tested/MD4Pipelined/MD4Pipelined.v

- File with waveforms: tested/MD4Pipelined/md4.TestMD4Pipelined484164083/MD4Pipelined.vcd

- FIR file: tested/MD4Pipelined/md4.TestMD4Pipelined484164083/MD4Pipelined.lo.fir

- Annotation file: annotations/MD4Pipelined.anno.json

- Simulation input/output directory: simulation/MD4Pipelined

### MD4 Pipelined with Elastic Buffers

![md4_pipelined_eb](/pics/MD4_Pipelined_ElasticBuffer.png)

- Fully pipelined MD4 algorithm, it produces data every clock cycle. Several PEs are connected by chain, each has elastic buffer.

- Description in draw.io: [link](https://drive.google.com/file/d/1STAYhhtQKTaDKzMzF8fTS9iIDfUcato1/view?usp=sharing)

- Python notebook for testing MD4 algorithm: notebooks/md4-md5_testing.ipynb

- Source file: src/main/scala/elastic/MD4PipelinedElasticBuffer/MD4PipelinedElasticBuffer.scala

- Tester file: src/test/scala/md4/TestMD4MD4PipelinedElasticBuffer.scala

- Generated Verilog code: tested/MD4PipelinedElasticBuffer/MD4PipelinedElasticBuffer.v

- File with waveforms: tested/MD4PipelinedElasticBuffer/md4.TestMD4PipelinedElasticBuffer1673942488/MD4PipelinedElasticBuffer.vcd

- FIR file: tested/MD4PipelinedElasticBuffer/md4.TestMD4PipelinedElasticBuffer1673942488/MD4PipelinedElasticBuffer.lo.fir

- Annotation file: annotations/MD4PipelinedElasticBuffer.anno.json

- Simulation input/output directory: simulation/MD4PipelinedElasticBuffer

### DES FSM

![des_fsm](/pics/DES_FSM.png)

- DES algorithm with decoupled input/output interfaces. There is one PE inside, data is provided to it in state machine fashion. It can be replaced by pipelined version.

- Description in draw.io: [link](https://drive.google.com/file/d/1qyi094yXwJSNWcT84F3N5_Lw9e3XAwLY/view?usp=sharing)

- Python notebook for testing DES algorithm: notebooks/des_testing.ipynb

- Source file: src/main/scala/elastic/DES_FSM/DES_FSM.scala, encryption/decryption mode is controlled by parameter "encrypt"

- Encryption (parameter "encrypt = true")

  - Tester file: src/test/scala/des/TestDES_EncryptionFSM.scala

  - Generated Verilog code: tested/DES_EncryptionFSM/DES_EncryptionFSM.v

  - File with waveforms: tested/DES_EncryptionFSM/des.TestDES_EncryptionFSM1678657633/DES_EncryptionFSM.vcd

  - FIR file: tested/DES_EncryptionFSM/des.TestDES_EncryptionFSM1678657633/DES_EncryptionFSM.lo.fir

  - Annotation file: annotations/DES_EncryptionFSM.anno.json

  - Simulation input/output directory: simulation/DES_EncryptionFSM

- Decryption (parameter "encrypt = false")

  - Tester file: src/test/scala/des/TestDES_DecryptionFSM.scala

  - Generated Verilog code: tested/DES_DecryptionFSM/DES_DecryptionFSM.v

  - File with waveforms: tested/DES_DecryptionFSM/des.TestDES_DecryptionFSM458267627/DES_DecryptionFSM.vcd

  - FIR file: tested/DES_DecryptionFSM/des.TestDES_DecryptionFSM458267627/DES_DecryptionFSM.lo.fir

  - Annotation file: annotations/DES_DecryptionFSM.anno.json

  - Simulation input/output directory: simulation/DES_DecryptionFSM

### DES Pipelined

![des_pipelined](/pics/DES_Pipelined.png)

- Fully pipelined DES algorithm, it produces data every clock cycle. Several PEs are connected by chain, each has elastic input/output interfaces. For each PE, new data and input valid are going through registers when output ready is high.

- Description in draw.io: [link](https://drive.google.com/file/d/1bCJpjtndiDAI2TwOutxtzAH3EaMUsVlG/view?usp=sharing)

- Python notebook for testing DES algorithm: notebooks/des_testing.ipynb

- Source file: src/main/scala/elastic/DES_Pipelined/DES_Pipelined.scala, encryption/decryption mode is controlled by parameter "encrypt"

- Encryption (parameter "encrypt = true")

  - Tester file: src/test/scala/des/TestDES_EncryptionPipelined.scala

  - Generated Verilog code: tested/DES_EncryptionPipelined/DES_EncryptionPipelined.v

  - File with waveforms: tested/DES_EncryptionPipelined/des.TestDES_EncryptionPipelined539217567/DES_EncryptionPipelined.vcd

  - FIR file: tested/DES_EncryptionPipelined/des.TestDES_EncryptionPipelined539217567/DES_EncryptionPipelined.lo.fir

  - Annotation file: annotations/DES_EncryptionPipelined.anno.json

  - Simulation input/output directory: simulation/DES_EncryptionPipelined

- Decryption (parameter "encrypt = false")

  - Tester file: src/test/scala/des/TestDES_DecryptionPipelined.scala

  - Generated Verilog code: tested/DES_DecryptionPipelined/DES_DecryptionPipelined.v

  - File with waveforms: tested/DES_DecryptionPipelined/des.TestDES_DecryptionPipelined1837930601/DES_DecryptionPipelined.vcd

  - FIR file: tested/DES_DecryptionPipelined/des.TestDES_DecryptionPipelined1837930601/DES_DecryptionPipelined.lo.fir

  - Annotation file: annotations/DES_DecryptionPipelined.anno.json

  - Simulation input/output directory: simulation/DES_DecryptionPipelined

### DES Pipelined with Elastic Buffers

![des_pipelined_eb](/pics/DES_Pipelined_ElasticBuffer.png)

- Fully pipelined DES algorithm, it produces data every clock cycle. Several PEs are connected by chain, each has elastic buffer.

- Description in draw.io: [link](https://drive.google.com/file/d/1ftyiThqYystGDlD5wh7KOv0j-q5tSUoY/view?usp=sharing)

- Python notebook for testing DES algorithm: notebooks/des_testing.ipynb

- Source file: src/main/scala/elastic/DES_PipelinedElasticBuffer/DES_PipelinedElasticBuffer.scala, encryption/decryption mode is controlled by parameter "encrypt"

- Encryption (parameter "encrypt = true")

  - Tester file: src/test/scala/des/TestDES_EncryptionPipelinedElasticBuffer.scala

  - Generated Verilog code: tested/DES_EncryptionPipelinedElasticBuffer/DES_EncryptionPipelinedElasticBuffer.v

  - File with waveforms: tested/DES_EncryptionPipelinedElasticBuffer/des.TestDES_EncryptionPipelinedElasticBuffer1941163556/DES_EncryptionPipelinedElasticBuffer.vcd

  - FIR file: tested/DES_EncryptionPipelinedElasticBuffer/des.TestDES_EncryptionPipelinedElasticBuffer1941163556/DES_EncryptionPipelinedElasticBuffer.lo.fir

  - Annotation file: annotations/DES_EncryptionPipelinedElasticBuffer.anno.json

  - Simulation input/output directory: simulation/DES_EncryptionPipelinedElasticBuffer

- Decryption (parameter "encrypt = false")

  - Tester file: src/test/scala/des/TestDES_DecryptionPipelinedElasticBuffer.scala

  - Generated Verilog code: tested/DES_DecryptionPipelinedElasticBuffer/DES_DecryptionPipelinedElasticBuffer.v

  - File with waveforms: tested/DES_DecryptionPipelinedElasticBuffer/des.TestDES_DecryptionPipelinedElasticBuffer1600652620/DES_DecryptionPipelinedElasticBuffer.vcd

  - FIR file: tested/DES_DecryptionPipelinedElasticBuffer/des.TestDES_DecryptionPipelinedElasticBuffer1600652620/DES_DecryptionPipelinedElasticBuffer.lo.fir

  - Annotation file: annotations/DES_DecryptionPipelinedElasticBuffer.anno.json

  - Simulation input/output directory: simulation/DES_DecryptionPipelinedElasticBuffer

### AES FSM

![aes_fsm](/pics/AES_FSM.png)

- AES algorithm with decoupled input/output interfaces. There is one PE inside, data is provided to it in state machine fashion. It can be replaced by pipelined version.

- Description in draw.io: [link](https://drive.google.com/file/d/1Aurpc6aTFGVBySETfzVmbtWjTzm3DWRI/view?usp=sharing)

- Python notebook for testing AES algorithm: notebooks/aes_testing.ipynb

- Source file: src/main/scala/elastic/AES_FSM/AES_FSM.scala, encryption/decryption mode is controlled by parameter "encrypt"

- Encryption (parameter "encrypt = true")

  - Tester file: src/test/scala/aes/TestAES_EncryptionFSM.scala

  - Generated Verilog code: tested/AES_EncryptionFSM/AES_EncryptionFSM.v

  - File with waveforms: tested/AES_EncryptionFSM/aes.TestAES_EncryptionFSM1339290024/AES_EncryptionFSM.vcd

  - FIR file: tested/AES_EncryptionFSM/aes.TestAES_EncryptionFSM1339290024/AES_EncryptionFSM.lo.fir

  - Annotation file: annotations/AES_EncryptionFSM.anno.json

  - Simulation input/output directory: simulation/AES_EncryptionFSM

- Decryption (parameter "encrypt = false")

  - Tester file: src/test/scala/aes/TestAES_DecryptionFSM.scala

  - Generated Verilog code: tested/AES_DecryptionFSM/AES_DecryptionFSM.v

  - File with waveforms: tested/AES_DecryptionFSM/aes.TestAES_DecryptionFSM1039530880/AES_DecryptionFSM.vcd

  - FIR file: tested/AES_DecryptionFSM/aes.TestAES_DecryptionFSM1039530880/AES_DecryptionFSM.lo.fir

  - Annotation file: annotations/AES_DecryptionFSM.anno.json

  - Simulation input/output directory: simulation/AES_DecryptionFSM

### AES Pipelined

![aes_pipelined](/pics/AES_Pipelined.png)

- Fully pipelined AES algorithm, it produces data every clock cycle. Several PEs are connected by chain, each has elastic input/output interfaces. For each PE, new data and input valid are going through registers when output ready is high.

- Description in draw.io: [link](https://drive.google.com/file/d/1RcMFO86cWR91zgyWpx92epilgOiUe32V/view?usp=sharing)

- Python notebook for testing AES algorithm: notebooks/aes_testing.ipynb

- Source file: src/main/scala/elastic/AES_Pipelined/AES_Pipelined.scala, encryption/decryption mode is controlled by parameter "encrypt"

- Encryption (parameter "encrypt = true")

  - Tester file: src/test/scala/aes/TestAES_EncryptionPipelined.scala

  - Generated Verilog code: tested/AES_EncryptionPipelined/AES_EncryptionPipelined.v

  - File with waveforms: tested/AES_EncryptionPipelined/aes.TestAES_EncryptionPipelined1053211738/AES_EncryptionPipelined.vcd

  - FIR file: tested/AES_EncryptionPipelined/aes.TestAES_EncryptionPipelined1053211738/AES_EncryptionPipelined.lo.fir

  - Annotation file: annotations/AES_EncryptionPipelined.anno.json

  - Simulation input/output directory: simulation/AES_EncryptionPipelined

- Decryption (parameter "encrypt = false")

  - Tester file: src/test/scala/aes/TestAES_DecryptionPipelined.scala

  - Generated Verilog code: tested/AES_DecryptionPipelined/AES_DecryptionPipelined.v

  - File with waveforms: tested/AES_DecryptionPipelined/des.TestAES_DecryptionPipelined936211586/AES_DecryptionPipelined.vcd

  - FIR file: tested/AES_DecryptionPipelined/des.TestAES_DecryptionPipelined936211586/AES_DecryptionPipelined.lo.fir

  - Annotation file: annotations/AES_DecryptionPipelined.anno.json

  - Simulation input/output directory: simulation/AES_DecryptionPipelined

### AES Pipelined with Elastic Buffers

![aes_pipelined_eb](/pics/AES_Pipelined_ElasticBuffer.png)

- Fully pipelined AES algorithm, it produces data every clock cycle. Several PEs are connected by chain, each has elastic buffer.

- Description in draw.io: [link](https://drive.google.com/file/d/1DnzecNL4Bhfi0aIFdRfpH1dfxbCUuQUF/view?usp=sharing)

- Python notebook for testing AES algorithm: notebooks/aes_testing.ipynb

- Source file: src/main/scala/elastic/AES_PipelinedElasticBuffer/AES_PipelinedElasticBuffer.scala, encryption/decryption mode is controlled by parameter "encrypt"

- Encryption (parameter "encrypt = true")

  - Tester file: src/test/scala/aes/TestAES_EncryptionPipelinedElasticBuffer.scala

  - Generated Verilog code: tested/AES_EncryptionPipelinedElasticBuffer/AES_EncryptionPipelinedElasticBuffer.v

  - File with waveforms: tested/AES_EncryptionPipelinedElasticBuffer/aes.TestAES_EncryptionPipelinedElasticBuffer2085811091/AES_EncryptionPipelinedElasticBuffer.vcd

  - FIR file: tested/AES_EncryptionPipelinedElasticBuffer/aes.TestAES_EncryptionPipelinedElasticBuffer2085811091/AES_EncryptionPipelinedElasticBuffer.lo.fir

  - Annotation file: annotations/AES_EncryptionPipelinedElasticBuffer.anno.json

  - Simulation input/output directory: simulation/AES_EncryptionPipelinedElasticBuffer

- Decryption (parameter "encrypt = false")

  - Tester file: src/test/scala/aes/TestAES_DecryptionPipelinedElasticBuffer.scala

  - Generated Verilog code: tested/AES_DecryptionPipelinedElasticBuffer/AES_DecryptionPipelinedElasticBuffer.v

  - File with waveforms: tested/AES_DecryptionPipelinedElasticBuffer/aes.TestAES_DecryptionPipelinedElasticBuffer1868645269/AES_DecryptionPipelinedElasticBuffer.vcd

  - FIR file: tested/AES_DecryptionPipelinedElasticBuffer/aes.TestAES_DecryptionPipelinedElasticBuffer1868645269/AES_DecryptionPipelinedElasticBuffer.lo.fir

  - Annotation file: annotations/AES_DecryptionPipelinedElasticBuffer.anno.json

  - Simulation input/output directory: simulation/AES_DecryptionPipelinedElasticBuffer
