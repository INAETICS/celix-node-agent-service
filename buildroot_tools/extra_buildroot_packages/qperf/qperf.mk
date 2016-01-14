#############################################################
#
## QPERF
#
##############################################################
QPERF_VERSION = 0.4.9 
QPERF_SOURCE = qperf-${QPERF_VERSION}.tar.gz 
QPERF_SITE = https://www.openfabrics.org/downloads/qperf
QPERF_INSTALL_STAGING = YES
QPERF_INSTALL_TARGET = YES

$(eval $(autotools-package))
