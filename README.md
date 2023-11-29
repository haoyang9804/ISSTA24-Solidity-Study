# Solidity Compiler Fuzzer Benchmark

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