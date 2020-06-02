# GNU Make workspace makefile autogenerated by Premake

.NOTPARALLEL:

ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifeq ($(config),debug)
  GLFW_config = debug
  Glad_config = debug
  ImGui_config = debug
  Juno_config = debug
  Sandbox_config = debug
endif
ifeq ($(config),release)
  GLFW_config = release
  Glad_config = release
  ImGui_config = release
  Juno_config = release
  Sandbox_config = release
endif
ifeq ($(config),dist)
  GLFW_config = dist
  Glad_config = dist
  ImGui_config = dist
  Juno_config = dist
  Sandbox_config = dist
endif

PROJECTS := GLFW Glad ImGui Juno Sandbox

.PHONY: all clean help $(PROJECTS) Dependencies

all: $(PROJECTS)

Dependencies: GLFW Glad ImGui

GLFW:
ifneq (,$(GLFW_config))
	@echo "==== Building GLFW ($(GLFW_config)) ===="
	@${MAKE} --no-print-directory -C Juno/vendor/GLFW -f Makefile config=$(GLFW_config)
endif

Glad:
ifneq (,$(Glad_config))
	@echo "==== Building Glad ($(Glad_config)) ===="
	@${MAKE} --no-print-directory -C Juno/vendor/Glad -f Makefile config=$(Glad_config)
endif

ImGui:
ifneq (,$(ImGui_config))
	@echo "==== Building ImGui ($(ImGui_config)) ===="
	@${MAKE} --no-print-directory -C Juno/vendor/imgui -f Makefile config=$(ImGui_config)
endif

Juno: GLFW Glad ImGui
ifneq (,$(Juno_config))
	@echo "==== Building Juno ($(Juno_config)) ===="
	@${MAKE} --no-print-directory -C Juno -f Makefile config=$(Juno_config)
endif

Sandbox: Juno
ifneq (,$(Sandbox_config))
	@echo "==== Building Sandbox ($(Sandbox_config)) ===="
	@${MAKE} --no-print-directory -C Sandbox -f Makefile config=$(Sandbox_config)
endif

clean:
	@${MAKE} --no-print-directory -C Juno/vendor/GLFW -f Makefile clean
	@${MAKE} --no-print-directory -C Juno/vendor/Glad -f Makefile clean
	@${MAKE} --no-print-directory -C Juno/vendor/imgui -f Makefile clean
	@${MAKE} --no-print-directory -C Juno -f Makefile clean
	@${MAKE} --no-print-directory -C Sandbox -f Makefile clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "CONFIGURATIONS:"
	@echo "  debug"
	@echo "  release"
	@echo "  dist"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   GLFW"
	@echo "   Glad"
	@echo "   ImGui"
	@echo "   Juno"
	@echo "   Sandbox"
	@echo ""
	@echo "For more information, see https://github.com/premake/premake-core/wiki"