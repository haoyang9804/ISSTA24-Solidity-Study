# README

## Bugs Classification

Please refer to [Solidity Compiler Bugs.pdf](./Solidity%20Compiler%20Bugs.pdf)

## Solidity Compiler Fuzzer Benchmark

This benchmark includes 109 historical Solidity compiler bugs distributed over 39 different versions, which are all included in `bugs` folder.

To replicate this evaluation, you can download a [docker image](https://hub.docker.com/repository/docker/mhypony/sol-fuzzer-benchmark/general) and create a container from it.

Inside this container, `AFLs` folder is all you need to execute AFL-compiler-fuzzer and solfuzzer.

So please first go into it.

```
cd AFLs
```

Specifically, `seed/files` include all test cases for `AFL-compiler-fuzzer` and `comby-decomposer/templates` and `comby-decomposer/fragments` include all templates and fragments.

To start the server required by the splice-mutation mode of AFL-compiler-fuzzer, please first

```
cd comby-decomposer
```

, and then use tmux

```
tmux new -s server
export NODE_OPTIONS="--max-old-space-size=8192"
node server.js --generate 1.0
```

, and close the tmux terminal with `ctrl + B + D`

Then, go back to the original directory, open a new tmux terminal by

```
cd ..
tmux new -s afl
afl-compiler-fuzzer/afl-fuzz-compiler -2 25 -1 75 -m 10240 -i seed/files/ -o findings/ solidity/build/solc/solc @@
```

The fuzzing results are stored in directory `findings`

To run solfuzzer,

```
tmux new -s solfuzzer
afl/afl-fuzz -m 10240 -t 2000 -i test_cases/ -o fuzzer_reports solidity/build/test/tools/solfuzzer
```

The fuzzing results are stored in directory `fuzzer_reports`

## Experimental Results

Folders `AFL-compiler-fuzzer` and `solfuzzer` contain their fuzzing results separately in 20-day execution.

Bug-triggered test cases for crashes found by `AFL-compiler-fuzzer` on the latest version of Solidity compiler are stored in `AFL-compiler-fuzzer/crashes`.
After [discussing](https://github.com/ethereum/solidity/issues/14719#issuecomment-1842628879) with a developer of Solidity compiler, it's confirmed that these ten crashes are the same bug.

The two folders all include `fuzzer_stats` and `plot_data`.
`fuzzer_stats` contains the fuzzing summary and `plot_data` is the chronological record of the fuzzing process. 