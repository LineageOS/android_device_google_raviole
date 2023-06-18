#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# WARNING: Everything listed here will be built on ALL platforms,
# including x86, the universal, and the SDK.  Modules must be uniquely
# named (liblights.panda), and must build everywhere, or limit themselves
# to only building on ARM if they include assembly. Individual makefiles
# are responsible for having their own logic, for fine-grained control.

LOCAL_PATH := $(call my-dir)

$(eval $(call declare-copy-files-license-metadata,device/google/raviole,default-permissions.xml,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/raviole,libnfc-nci-raven.conf,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/raviole,libnfc-nci.conf,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/raviole,fstab.postinstall,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/raviole,ueventd.rc,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/raviole,wpa_supplicant.conf,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/raviole,hals.conf,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/raviole,media_profiles_V1_0.xml,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/raviole,media_codecs_performance.xml,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/raviole,device_state_configuration.xml,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/raviole,task_profiles.json,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/raviole,p2p_supplicant.conf,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/raviole,wpa_supplicant.conf,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/raviole,wpa_supplicant_overlay.conf,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))

$(eval $(call declare-1p-copy-files,device/google/raviole,audio_policy_configuration.xml))

# if some modules are built directly from this directory (not subdirectories),
# their rules should be written here.

ifeq ($(USES_DEVICE_GOOGLE_RAVIOLE),true)
  include $(call first-makefiles-under,$(LOCAL_PATH))

DM_LIBS := libdmengine.so libdmjavaplugin.so
DM_32_SYMLINKS := $(addprefix $(TARGET_OUT_PRODUCT)/priv-app/DMService/lib/arm/,$(notdir $(DM_LIBS)))
$(DM_32_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "DMService 32 lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /product/lib/$(notdir $@) $@

DM_64_SYMLINKS := $(addprefix $(TARGET_OUT_PRODUCT)/priv-app/DMService/lib/arm64/,$(notdir $(DM_LIBS)))
$(DM_64_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "DMService 64 lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /product/lib64/$(notdir $@) $@

HBM_LIBS := libhbmsvmanager_jni.so
HBM_SYMLINKS := $(addprefix $(TARGET_OUT_SYSTEM_EXT)/priv-app/HbmSVManager/lib/arm64/,$(notdir $(HBM_LIBS)))
$(HBM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "HBM lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system_ext/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(DM_32_SYMLINKS) $(DM_64_SYMLINKS) $(HBM_SYMLINKS)
endif
