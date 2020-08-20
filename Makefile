.PHONY: swift_build
swift_build:
	swift build

.PHONY: pod_trunk_push
pod_trunk_push:
	pod trunk push