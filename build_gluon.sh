set -e
echo "started $(date)" >> done.txt

for TARGET in $(make list-targets); do
  echo "~~~~~~~~~~~~~~~~~~~~~~ $TARGET"
  #make GLUON_TARGET=$TARGET -j1 V=s 
  make GLUON_TARGET=$TARGET -j$(nproc)
done

make manifest GLUON_BRANCH=stable 
make manifest GLUON_BRANCH=beta 
make manifest GLUON_BRANCH=experimental 
./contrib/sign.sh ./secret.txt ./output/images/sysupgrade/experimental.manifest
./contrib/sign.sh ./secret.txt ./output/images/sysupgrade/stable.manifest
./contrib/sign.sh ./secret.txt ./output/images/sysupgrade/beta.manifest
echo "done $(date)" >> done.txt

