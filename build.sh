#!/usr/bin/env sh
set -x

rm -f vm_community_taters_quark.zip
rm -f vm_community_taters_botania.zip

zip -r vm_community_taters_quark.zip assets pack.mcmeta pack.png

TMP=$(mktemp -d)
cp -r assets pack.mcmeta pack.png "$TMP"
mv "$TMP/assets/quark" "$TMP/assets/botania"
find "$TMP" -name "*.json" -exec sed -i 's/quark:/botania:/' {} +
(cd "$TMP" && zip -r vm_community_taters_botania.zip assets pack.mcmeta pack.png)

cp -f "$TMP"/vm_community_taters_botania.zip .
rm -rf "$TMP"
