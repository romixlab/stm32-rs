svd/extract.sh
svd patch devices/stm32g491.yaml
svd patch devices/stm32h743.yaml

mkdir pac
mkdir pac/stm32g491
mkdir pac/stm32h743

svd2rust -m -g --target none -i svd/stm32g491.svd.patched
form -i pac/stm32g491/mod.rs -o pac/stm32g491
rm mod.rs
mv ./generic.rs pac/stm32g491
mv pac/stm32g491/lib.rs pac/stm32g491/mod.rs
rustfmt --config-path="rustfmt.toml" pac/stm32g491/mod.rs
