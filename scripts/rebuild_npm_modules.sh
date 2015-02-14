gyp_rebuild_inside_node_modules () {
  for npmModule in ./*; do
    cd $npmModule
    if [ -f binding.gyp ]; then
      echo "=> re-installing binary npm module '${npmModule:2}' of package '${package:2}'"
      node-gyp rebuild
    fi

    # recursively rebuild npm modules inside node_modules
    if [ -d ./node_modules ]; then
      cd ./node_modules
        gyp_rebuild_inside_node_modules
      cd ../
    fi
    cd ..
  done
}

rebuild_binary_npm_modules () {
  for package in ./*; do
    if [ -d $package/node_modules ]; then
      cd $package/node_modules
        gyp_rebuild_inside_node_modules
      cd ../../
    elif [ -d $package/main/node_module ]; then
      cd $package/node_modules
        gyp_rebuild_inside_node_modules
      cd ../../../
    fi
  done
}

if [ -d ./npm ]; then
  cd npm
  rebuild_binary_npm_modules
  cd ../
fi

if [ -d ./node_modules ]; then
  cd ./node_modules
  gyp_rebuild_inside_node_modules
  cd ../
fi