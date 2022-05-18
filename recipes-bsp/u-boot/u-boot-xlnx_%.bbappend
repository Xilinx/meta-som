SRC_URI:append:k26 = " \
	file://vars \
	file://som_bootmenu.cfg \
	file://som_k26.cfg \
	"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_configure:append:k26 () {
	install ${WORKDIR}/vars ${S}/.
}

# u-boot blob generation configuration for k26
UBOOT_IMAGE_BLOB:k26 ?= "1"
DT_BLOB_DIR ?= "${B}/arch/arm/dts/dt-blob"
PREFIX ?= "smk"

IMPORT_CC_DTBS:k26 ?= " \
		zynqmp-sck-kv-g-revA.dtbo:zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revA.dtb \
		zynqmp-sck-kv-g-revB.dtbo:zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revB.dtb \
		zynqmp-sck-kr-g-revA.dtbo:zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revA.dtb \
		zynqmp-sck-kr-g-revB.dtbo:zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revB.dtb \
                "

CC_DTBS_DUP:k26 ?= " \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revZ \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-rev1 \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-${PREFIX}-k26-xcl2g-revB-sck-kv-g-revA \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-${PREFIX}-k26-xcl2g-revB-sck-kv-g-revZ \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-${PREFIX}-k26-xcl2g-revB-sck-kv-g-revB \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-${PREFIX}-k26-xcl2g-revB-sck-kv-g-rev1 \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-${PREFIX}-k26-xcl2g-rev1-sck-kv-g-revA \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-${PREFIX}-k26-xcl2g-rev1-sck-kv-g-revZ \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-${PREFIX}-k26-xcl2g-rev1-sck-kv-g-revB \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-${PREFIX}-k26-xcl2g-rev1-sck-kv-g-rev1 \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-rev1 \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revA:zynqmp-${PREFIX}-k26-xcl2g-revB-sck-kr-g-revA \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-${PREFIX}-k26-xcl2g-revB-sck-kr-g-revB \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-${PREFIX}-k26-xcl2g-revB-sck-kr-g-rev1 \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revA:zynqmp-${PREFIX}-k26-xcl2g-rev1-sck-kr-g-revA \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-${PREFIX}-k26-xcl2g-rev1-sck-kr-g-revB \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-${PREFIX}-k26-xcl2g-rev1-sck-kr-g-rev1 \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-${PREFIX}-k26-xcl2g-ed-revA-sck-kv-g-revA \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-${PREFIX}-k26-xcl2g-ed-revA-sck-kv-g-revB \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revA:zynqmp-${PREFIX}-k26-xcl2g-ed-revA-sck-kr-g-revA \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-${PREFIX}-k26-xcl2g-ed-revA-sck-kr-g-revB \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-${PREFIX}-k26-xcl2g-ed-revA-sck-kv-g-revZ \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-${PREFIX}-k26-xcl2g-ed-revA-sck-kv-g-rev1 \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-${PREFIX}-k26-xcl2g-ed-revB-sck-kv-g-revA \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-${PREFIX}-k26-xcl2g-ed-revB-sck-kv-g-revZ \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-${PREFIX}-k26-xcl2g-ed-revB-sck-kv-g-revB \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-${PREFIX}-k26-xcl2g-ed-revB-sck-kv-g-rev1 \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-${PREFIX}-k26-xcl2g-ed-rev1-sck-kv-g-revA \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-${PREFIX}-k26-xcl2g-ed-rev1-sck-kv-g-revZ \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-${PREFIX}-k26-xcl2g-ed-rev1-sck-kv-g-revB \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-${PREFIX}-k26-xcl2g-ed-rev1-sck-kv-g-rev1 \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-${PREFIX}-k26-xcl2g-ed-revA-sck-kr-g-rev1 \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revA:zynqmp-${PREFIX}-k26-xcl2g-ed-revB-sck-kr-g-revA \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-${PREFIX}-k26-xcl2g-ed-revB-sck-kr-g-revB \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-${PREFIX}-k26-xcl2g-ed-revB-sck-kr-g-rev1 \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revA:zynqmp-${PREFIX}-k26-xcl2g-ed-rev1-sck-kr-g-revA \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-${PREFIX}-k26-xcl2g-ed-rev1-sck-kr-g-revB \
		zynqmp-${PREFIX}-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-${PREFIX}-k26-xcl2g-ed-rev1-sck-kr-g-rev1 \
		"
