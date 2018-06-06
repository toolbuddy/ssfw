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