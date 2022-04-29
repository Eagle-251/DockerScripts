#!/bin/fish
for i in (docker ps -q)
                      set vpath (docker container inspect $i | jq -r '.[0].GraphDriver.Data.MergedDir' | sed 's/\/merged//')
                      echo "Container: " (docker container inspect $i | jq -r '.[0].Name' | sed 's/\// /')
                      echo "Volume Path: $vpath" 
                      echo "Volume Size: " (sudo du -sh $vpath | sed 's@'$vpath'@@')
                      echo \n
end
