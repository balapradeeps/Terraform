# Notes
## We have faced some issues on this build but now it's clear
1. convert the docker-build-push.tf dox2unix
2. Update the file docker-build-push.tf build line  `` ./ to .``
3. Update the line in main.tf file `` force_delete = true `` for destroy the repo forcefully 
