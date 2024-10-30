# 分布式存储之Rocksdb

## 前置条件
- ninja
- make
- clang/clang++(or gcc/g++)

# 运行
```bash
# 会在 bin/目录下生成 main 文件
make
```

# 使用其他rocksdb fork的仓库

在fork facebook/rocksdb 仓库的时候应该取消`Copy the main branch only`选项. 
## 如果已经初始化仓库(fork自本仓库) 
```bash
git submodule deinit -f rocksdb; git rm rocksdb
git submodule add https://github.com/your_rocksdb_domain/rocksdb.git rocksdb
cd rocksdb; git reset --hard v9.0.0; cd ..
```
