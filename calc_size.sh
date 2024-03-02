#!/bin/zsh

sizelogfile=log_$(date "+%Y_%m_%d_%H_%M_%S").txt
echo "$sizelogfile" > $sizelogfile
username=$(whoami)
echo "Username : "$username"\n" >> $sizelogfile
users=/System/Volumes/Data/Users/

# Calculate folders
echo "size\t/*" >> $sizelogfile
sudo du -sh /* 2>/dev/null | awk '/[0-9]G/' | sort -rh >> $sizelogfile
echo "size\t/System/*" >> $sizelogfile
sudo du -sh /System/* 2>/dev/null | awk '/[0-9]G/' | sort -rh >> $sizelogfile
echo "size\t/System/Volumes/*" >> $sizelogfile
sudo du -sh /System/Volumes/* 2>/dev/null | awk '/[0-9]G/' | sort -rh >> $sizelogfile
echo "size\t/System/Volumes/Data/*" >> $sizelogfile
sudo du -sh /System/Volumes/Data/*  2>/dev/null | awk '/[0-9]G/' | sort -rh >> $sizelogfile
echo "size\t"$users"*" >> $sizelogfile
sudo du -sh "$users"*  2>/dev/null | awk '/[0-9]G/' | sort -rh >> $sizelogfile
echo "size\t"$users""$username"/*" >> $sizelogfile
sudo du -sh "$users""$username"/*  2>/dev/null | awk '/[0-9]G/' | sort -rh >> $sizelogfile
echo "size\t"$users""$username"/Library/*" >> $sizelogfile
sudo du -sh "$users""$username"/Library/*  2>/dev/null | awk '/[0-9]G/' | sort -rh >> $sizelogfile
echo "size\t"$users""$username"/Library/CloudStorage/*" >> $sizelogfile
sudo du -sh "$users""$username"/Library/CloudStorage/*  2>/dev/null | awk '/[0-9]G/' | sort -rh >> $sizelogfile
echo "size\t"$users""$username"/Library/Containers/*" >> $sizelogfile
sudo du -sh "$users""$username"/Library/Containers/*  2>/dev/null | awk '/[0-9]G/' | sort -rh >> $sizelogfile 
