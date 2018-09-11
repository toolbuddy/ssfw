# P4 Troubleshooting

由於 P4 的版本仍再更新當中，所以可能會出現當時安裝腳本時，出現一些安裝相依性的錯誤。以下紀錄一些我安裝時發生的相依性問題。

## 環境選擇

* 通常首選 `ubuntu 16.04` 的環境做安裝

## cffi 版本問題

* 在安裝時發現 cffi(`1.11.x`) 與 cffi-backend(`1.5.2`) 的版本不同，導致噴錯
* 這時候可以用 `pip` 把 cffi 拉到與 cffi-backend 同一個版本就好

```
sudo pip install cffi==1.5.2
```

## Openvswitch 報錯

* 這時候需要找到目前運行 openvswitch 的 process，並做移除就可以了

## llvm 3.8 報錯

* 可以參考：
```
sudo apt-get install -y llvm-3.8-dev libclang-3.8-dev
sudo mkdir -p /usr/lib/llvm-3.8/share/llvm
sudo ln -s /usr/share/llvm-3.8/cmake /usr/lib/llvm-3.8/share/llvm/cmake
sudo sed -i -e '/get_filename_component(LLVM_INSTALL_PREFIX/ {s|^|#|}' -e '/^# Compute the installation prefix/i set(LLVM_INSTALL_PREFIX "/usr/lib/llvm-3.8")' /usr/lib/llvm-3.8/share/llvm/cmake/LLVMConfig.cmake
sudo sed -i '/_IMPORT_CHECK_TARGETS Polly/ {s|^|#|}' /usr/lib/llvm-3.8/share/llvm/cmake/LLVMExports-relwithdebinfo.cmake
sudo sed -i '/_IMPORT_CHECK_TARGETS sancov/ {s|^|#|}' /usr/lib/llvm-3.8/share/llvm/cmake/LLVMExports-relwithdebinfo.cmake
sudo ln -s /usr/lib/x86_64-linux-gnu/libLLVM-3.8.so.1 /usr/lib/llvm-3.8/lib/
```
> 來源： https://github.com/iovisor/bcc/issues/492 
