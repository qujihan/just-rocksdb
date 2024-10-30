# 分布式存储之Rocksdb

## 前置条件
- ninja `apt install ninja-build`
- make `apt install make`
- clang/clang++(or gcc/g++)
    - `apt install gcc g++`
    - `apt install clang clang++`
- gflags `apt install libgflags-dev`

# 运行
```bash
# 会在 bin/目录下生成可执行文件
make
```

# 使用自己的 fork 自 facebook/rocksdb 的 rocksdb 源码

在fork facebook/rocksdb 仓库的时候应该*取消*`Copy the main branch only`选项. 

```bash
# 先 clone 本仓库
cd just-rocksdb
git submodule deinit -f rocksdb; git rm rocksdb
git submodule add https://github.com/your_rocksdb_domain/rocksdb.git rocksdb
cd rocksdb; git reset --hard v9.0.0; cd ..
```
