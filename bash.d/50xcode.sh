#!/bin/bash

# macOS 10.14 does not create /usr/include by default.  This is an
# attempt to get around this without needing to install the legacy
# headers in:
#   $(xcode-select -p)/Packages/macOS_SDK_headers_for_macOS_10.14.pkg
if [[ ! -e /usr/include ]] && command -v xcrun > /dev/null; then
	prepend_dir             CPATH "$(xcrun --show-sdk-path)/usr/include"
	prepend_dir      LIBRARY_PATH "$(xcrun --show-sdk-path)/usr/lib"
	prepend_dir   LD_LIBRARY_PATH "$(xcrun --show-sdk-path)/usr/lib"
	prepend_dir DYLD_LIBRARY_PATH "$(xcrun --show-sdk-path)/usr/lib"
	# TODO: this is clobbered by 70-man.sh
	prepend_dir           MANPATH "$(xcrun --show-sdk-path)/usr/share/man"
fi
