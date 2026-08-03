#!/bin/bash
# =============================================================
# Suite_testing.sh — Orquesta todos los tests de BD
# Proyecto: Punto de venta Mi Lupita
# Uso: ./Suite_testing.sh
# =============================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOTAL_PASS=0
TOTAL_FAIL=0
INICIO=$(date +%s)

run_suite() {
    local nombre="$1"
    local script="$2"

    echo ""
    echo "┌─────────────────────────────────────────┐"
    echo "│  Suite: $nombre"
    echo "└─────────────────────────────────────────┘"

    if [ ! -f "$script" ]; then
        echo "  [ERROR] Script no encontrado: $script"
        TOTAL_FAIL=$((TOTAL_FAIL + 1))
        return
    fi

    chmod +x "$script"
    bash "$script"
    codigo=$?

    if [ "$codigo" -eq 0 ]; then
        echo "  → Suite PASÓ"
        TOTAL_PASS=$((TOTAL_PASS + 1))
    else
        echo "  → Suite FALLÓ (código de salida: $codigo)"
        TOTAL_FAIL=$((TOTAL_FAIL + 1))
    fi
}

echo "╔══════════════════════════════════════════╗"
echo "║   SUITE DE TESTING — MI LUPITA POS       ║"
echo "║   $(date '+%Y-%m-%d %H:%M:%S')                    ║"
echo "╚══════════════════════════════════════════╝"

# ── Ejecuta cada suite ────────────────────────────────────────
run_suite "Unit tests de BD" "$SCRIPT_DIR/Unit_tests.sh"

# Aquí puedes agregar más suites en el futuro:
# run_suite "Tests de integridad referencial" "$SCRIPT_DIR/Referential_tests.sh"
# run_suite "Tests de datos semilla"          "$SCRIPT_DIR/Seed_tests.sh"

# ── Resumen global ────────────────────────────────────────────
FIN=$(date +%s)
DURACION=$((FIN - INICIO))

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║  RESUMEN GLOBAL                          ║"
echo "║  Suites pasaron : $TOTAL_PASS                       ║"
echo "║  Suites fallaron: $TOTAL_FAIL                       ║"
echo "║  Tiempo total   : ${DURACION}s                     ║"
echo "╚══════════════════════════════════════════╝"
echo ""

[ "$TOTAL_FAIL" -eq 0 ] && exit 0 || exit 1
