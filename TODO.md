TODO: Encode standard locations such as .config/perso in variables
TODO: Config suckless notifications
TODO: Add automated tests for initial config; then final config
TODO: 28-05-2023 I added sfeed to the common softwares, but didn't add it to automatic install. This is because I need to compile it to have access to sfeed_json. I could add compiling sfeed to the ansible script, but it's better to use apk repositories, for automatic update, easy uninstall and overall cleanliness. The best way to solve this problem would be to try modifying the sfeed packet; to either update it to the last version if that is not the case; or modify compilation so it includes sfeed_json. That would a modest first contribution to apk packages.
