#!/bin/zsh

# ファイルサイズ表示
current_path=$(pwd)
./display_cache.sh

echo '\n\n###'
echo '# キャッシュ削除'
echo '###'
echo '# Macのキャッシュ'
sudo rm -rf /System/Library/Caches/* /Library/Caches/* ~/Library/Caches/* 2>/dev/null

echo '# Adobeのキャッシュ'
cd ~/Library/Application\ Support/Adobe/Common/
sudo rm -rf Media\ Cache/* 2>/dev/null
sudo rm -rf Media\ Cache\ Files/* 2>/dev/null

echo '# Dockerキャッシュ'
sudo rm -rf ~/Library/Containers/com.docker.docker/Data/* 2>/dev/null

echo '# Teamsキャッシュ'
sudo rm -r ~/Library/Application\ Support/Microsoft/Teams 2>/dev/null

echo '# Teamsキャッシュ'
sudo rm -r ~/Library/Application\ Support/Code/User/workspaceStorage/*
sudo rm -r ~/Library/Application\ Support/Code/Service Worker/CacheStorage/*

echo '# Xcodeキャッシュ\n'
sudo rm -rf ~/Library/Developer/CoreSimulator/Caches/* 2>/dev/null
sudo rm -rf ~/Library/Developer/Xcode/Archives/* 2>/dev/null
sudo rm -rf ~/Library/Developer/Xcode/DerivedData/* 2>/dev/null
sudo rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/* 2>/dev/null
sudo rm -rf ~/Library/Developer/Xcode/macOS\ DeviceSupport/* 2>/dev/null
# 不要なSimulatorの削除
xcrun simctl delete unavailable


# Sketchのオートセーブ
# sudo rm -r /.DocumentRevisions-V100/.cs

# Spotlight
# $ sudo mdutil -i off /
# $ sudo rm -rf /.Spotlight-V100/
# $ sudo mdutil -E -i on /

# ファイルサイズ表示
echo '###'
echo '# 削除後'
echo '-----'
cd $current_path
./display_cache.sh

echo finish.
