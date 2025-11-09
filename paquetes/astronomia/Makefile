# Makefile para funciones astronómicas en C++ - Octave

# Configuración
NAME := astronomia
VERSION := 1.2.0
OCTAVE_CONFIG := mkoctfile
CXXFLAGS := -O3 -march=native -ffast-math -std=c++11
DEBUG_FLAGS := -g -O0 -DDEBUG
SRC_DIR := src
BUILD_DIR := build
INCLUDE_DIR := include
BASE_DIR := .

# Lista de objetivos (archivos .oct)
TARGETS := $(BUILD_DIR)/deg2hms.oct \
	$(BUILD_DIR)/deg2rad.oct \
	$(BUILD_DIR)/rad2deg.oct \
	$(BUILD_DIR)/calcular_altura.oct \
	$(BUILD_DIR)/altaz2hadec.oct

# Todos los objetivos por defecto
all: $(BUILD_DIR) $(TARGETS)

# Crear directorio build si no existe
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Regla para compilar deg2hms
$(BUILD_DIR)/deg2hms.oct: $(SRC_DIR)/deg2hms.cc
	$(OCTAVE_CONFIG) $(CXXFLAGS) -I$(INCLUDE_DIR) -o $@ $< $(SRC_DIR)/_deg2hms.cc
	
# Regla para compilar deg2rad
$(BUILD_DIR)/deg2rad.oct: $(SRC_DIR)/deg2rad.cc
	$(OCTAVE_CONFIG) $(CXXFLAGS) -I$(INCLUDE_DIR) -o $@ $< $(SRC_DIR)/_deg2rad.cc
	
# Regla para compilar rad2deg
$(BUILD_DIR)/rad2deg.oct: $(SRC_DIR)/rad2deg.cc
	$(OCTAVE_CONFIG) $(CXXFLAGS) -I$(INCLUDE_DIR) -o $@ $< $(SRC_DIR)/_rad2deg.cc
	
# Regla para compilar calcular_altura
$(BUILD_DIR)/calcular_altura.oct: $(SRC_DIR)/calcular_altura.cc
	$(OCTAVE_CONFIG) $(CXXFLAGS) -I$(INCLUDE_DIR) -o $@ $< $(SRC_DIR)/_deg2rad.cc $(SRC_DIR)/_rad2deg.cc
	
# Regla para compilar altaz2hadec
$(BUILD_DIR)/altaz2hadec.oct: $(SRC_DIR)/altaz2hadec.cc
	$(OCTAVE_CONFIG) $(CXXFLAGS) -I$(INCLUDE_DIR) -o $@ $< $(SRC_DIR)/_deg2rad.cc $(SRC_DIR)/_rad2deg.cc

# Compilación con debugging
debug: CXXFLAGS = $(DEBUG_FLAGS)
debug: $(BUILD_DIR) $(TARGETS)

# Limpiar archivos compilados
clean:
	rm -rf $(BUILD_DIR)/*.oct $(BUILD_DIR)/*.o $(BASE_DIR)/inst/*.oct

# Instalar en directorio de Octave
install: all
	cp $(BUILD_DIR)/*.oct $(BASE_DIR)/inst
	tar czf ./$(NAME)-$(VERSION).tar.gz ../$(NAME)/inst ../$(NAME)/COPYING ../$(NAME)/DESCRIPTION ../$(NAME)/INDEX ../$(NAME)/TODO.md

# Desinstalar
uninstall:
	rm -rf $(BUILD_DIR)/*.oct $(BUILD_DIR)/*.o $(BASE_DIR)/inst/*.oct
	rm -rf $(BASE_DIR)/*.tar.gz

# Test básico
test: all
	octave --eval "addpath('$(BUILD_DIR)'); \
	               result = deg2hms(45.5); \
	               printf('45.5° = %dh %dm %.2fs\\n', result(1), result(2), result(3)); \
	               result = deg2rad(45.0); \
	               printf('45.0° = %.2f\\n', result(1)); \
	               result = rad2deg(0.79); \
	               printf('0.79 rad = %.2f\\n', result(1));"

# Información del sistema
info:
	@echo "=== Sistema de Compilación Astronómica ==="
	@echo "Compilador: $(OCTAVE_CONFIG)"
	@echo "Flags: $(CXXFLAGS)"
	@echo "Targets: $(TARGETS)"
	@echo "Directorio fuente: $(SRC_DIR)"
	@echo "Directorio build: $(BUILD_DIR)"

# Ayuda
help:
	@echo "Targets disponibles:"
	@echo "  all       - Compilar todas las funciones (default)"
	@echo "  debug     - Compilar con información de debugging"
	@echo "  clean     - Eliminar archivos compilados"
	@echo "  install   - Hace el paquete completo preparado para instalar en Octave"
	@echo "  uninstall - Desinstalar"
	@echo "  test      - Ejecutar test básico"
	@echo "  info      - Mostrar información del sistema"

.PHONY: all debug clean distclean install uninstall test info help 
