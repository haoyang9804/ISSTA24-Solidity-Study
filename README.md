# README

## Bugs Classification

Please refer to [Solidity Compiler Bugs.pdf](./Solidity%20Compiler%20Bugs.pdf)

## Solidity Compiler Fuzzer Benchmark

This benchmark includes 109 historical Solidity compiler bugs distributed over 39 different versions, which are all included in `bugs` folder.

Here is the summary:

+ Semantic Analysis Error: 3414, 2764, 3796, 4535, 4832, 5459, 5518, 5551, 9028, 9050, 9229, 9231, 9752, 9957, 10524, 10831, 10975, 11445, 11356, 11497, 11855, 12379, 12718, 14182 (24)
+ Formal Verification Error: 4565, 6574, 6575, 6864, 7163, 7164, 7305, 8407, 8419, 8817, 9016, 9087, 9233, 9296, 9425, 9505, 9506, 9519, 9595, 9741, 10058, 10252, 10439, 10523, 10525, 10526, 10657, 10666, 10914, 11005, 11336, 11341, 13432, 13477, 13735, 14181 (36)
+ Code Generation Error: 2104, 3293, 2977, 5055, 6525, 6754, 6783, 7378, 8210, 10105, 10667 (11)
+ Type System Error: 2655, 2739, 4706, 6901, 7155, 7448, 8991, 9134, 10870, 11677, 11959 (11)
+ Exception Handling Error: 6509, 7549, 8406, 9666, 10106, 10958, 12222, 13732 (8)
+ Memory-Related Error: 2915, 4051, 5501, 8947, 8971, 10186, 10433, 10874, 11611, 11929, 12159, 13266 (12)
+ Syntax Analysis Error: 3291, 5730, 8368 (3)
+ Doc Error: 9947, 10881, 11194 (3)

## Evaluation Replication

To replicate this evaluation, you can download a [docker image](https://hub.docker.com/repository/docker/mhypony/sol-fuzzer-benchmark/general) and create a container from it.

Inside this container, `AFLs` folder is all you need to execute AFL-compiler-fuzzer, solfuzzer, and Fuzzol.

So please first enter it: `cd AFLs`

afl-compiler-fuzzer supports the use of comby-decomposer to splice up collected code templates and fragments. To obtain these fragment, please first

```
cd comby-decomposer
```

, and then use tmux to launch the server

```
tmux new -s server
export NODE_OPTIONS="--max-old-space-size=8192"
node server.js --generate 1.0
```

, and close the tmux terminal with `ctrl + B + D`.

Then, go into afl-compiler-fuzzer folder by `cd afl-compiler-fuzzer` and `sudo make install`.

Finally, go back to `~/AFLs`, and run

```
afl-fuzz-compiler -2 25 -1 75 -m 10240 -i acf-seeds -o findings/ solidity/build-acf/solc/solc @@
```

To run solfuzzer,

First drop by afl folder `cd afl` and `sudo make install`, then

```
afl-fuzz -m 10240 -t 2000 -i solfuzzer-seeds -o findings solidity/build-solfuzzer/test/tools/solfuzzer
```

To run Fuzzol, conduct these commands in `~/AFLs`

```
cd Fuzzol
sudo make install
cd ..
afl-fuzz -m 10240 -i fuzzol-seeds -o findings solidity/build-fuzzol/solc/solc @@
```

For all these three execution, the experimental results are all located in `~/AFLs/findings`, your can change `findings` to other names in the above execution commands.

## Experimental Results

Folders `AFL-compiler-fuzzer`, `solfuzzer`, and `Fuzzol` contain their fuzzing results separately in 20-day execution.

Bug-triggered test cases for crashes found by `AFL-compiler-fuzzer` on the latest version of Solidity compiler are stored in `AFL-compiler-fuzzer/crashes`.
After [discussing](https://github.com/ethereum/solidity/issues/14719#issuecomment-1842628879) with a developer of Solidity compiler, it's confirmed that these ten crashes are the same bug.

The two folders all include `fuzzer_stats` and `plot_data`.
`fuzzer_stats` contains the fuzzing summary and `plot_data` is the chronological record of the fuzzing process. 
