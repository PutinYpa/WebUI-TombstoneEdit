#!/system/bin/sh
# 请不要硬编码 /magisk/modname/... ; 请使用 $MODDIR/...
# 这将使你的脚本更加兼容，即使Magisk在未来改变了它的挂载点
# 这个脚本将以 post-fs-data 模式执行(系统启动前执行)
MODDIR=${0%/*}


if [ -e /data/oplus/os/bpm/sys_elsa_config_list.xml ] ;then
  if [ ! -e ${MODDIR}/data/oplus/os/bpm/sys_elsa_config_list.xml ] ;then
    mkdir -p ${MODDIR}/data/oplus/os/bpm
    chmod 755 ${MODDIR}/data/oplus/os/bpm
    cp /data/oplus/os/bpm/sys_elsa_config_list.xml ${MODDIR}/data/oplus/os/bpm/sys_elsa_config_list.xml
  fi
  mount --bind ${MODDIR}/data/oplus/os/bpm/sys_elsa_config_list.xml /data/oplus/os/bpm/sys_elsa_config_list.xml
else
  touch $MODDIR/disable
  sed -i '/^description=/c\description=机型不兼容，模块已禁用，请手动卸载' "$PROP_FILE"
  
fi
