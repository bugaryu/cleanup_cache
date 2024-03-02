#!/bin/zsh

# 1000M以上のファイルを抽出
# $ sudo du -x -m -d 5 / | awk '$1 >= 1000{print}'
# フォルダごとの容量計算とサイズ順そーと
# sudo du -sh /* | sort -rh

echo '###'
echo '# ファイルサイズ表示'
echo '###'

echo '\n# Macのキャッシュ'
sudo du -sh /System/Library/Caches/ /Library/Caches/ ~/Library/Caches/ 2>/dev/null

echo '\n# Adobeのキャッシュ'
sudo du -sh ~/Library/Application\ Support/Adobe/Common/Media\ Cache/ 2>/dev/null
sudo du -sh ~/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/ 2>/dev/null

echo '\n# Dockerキャッシュ'
sudo du -sh ~/Library/Containers/com.docker.docker/Data/ 2>/dev/null

echo '\n# Teamsキャッシュ'
sudo du -sh ~/Library/Application\ Support/Microsoft/Teams 2>/dev/null

echo '\n# Xcodeキャッシュ'
sudo du -sh ~/Library/Developer/* 2>/dev/null