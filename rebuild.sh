#!/bin/bash

clear
echo "
    _    _   _ ___ __  __    _    _     ____  
   / \  | \ | |_ _|  \/  |  / \  | |   / ___| 
  / _ \ |  \| || || |\/| | / _ \ | |   \___ \ 
 / ___ \| |\  || || |  | |/ ___ \| |___ ___) |
/_/   \_\_| \_|___|_|  |_/_/   \_\_____|____/ 
                                              
"
coffee --compile src/coffee/app.coffee
coffee --compile src/coffee/client/animal.coffee
coffee --compile src/coffee/client/client.coffee
coffee --compile src/coffee/client/animal_view.coffee
coffee --compile src/coffee/client/cheetah_view.coffee
coffee --compile src/coffee/client/mammal.coffee
coffee --compile src/coffee/client/insect.coffee
coffee --compile src/coffee/client/hybrid.coffee
coffee --compile src/coffee/client/cheetah.coffee
mv src/coffee/app.js .
mv src/coffee/client/animal.js build/public/js/.
mv src/coffee/client/client.js build/public/js/.
mv src/coffee/client/animal_view.js build/public/js/.
mv src/coffee/client/cheetah_view.js build/public/js/.
mv src/coffee/client/mammal.js build/public/js/.
mv src/coffee/client/hybrid.js build/public/js/.
mv src/coffee/client/insect.js build/public/js/.
mv src/coffee/client/cheetah.js build/public/js/.
node app
