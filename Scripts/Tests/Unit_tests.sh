#!/bin/bash
# =============================================================
# Unit_tests.sh — Tests unitarios por tabla en la BD
# Proyecto: Punto de venta Mi Lupita
# Uso local:  ./Unit_tests.sh
# Uso en CI:  llamado por Suite_testing.sh
# =============================================================

# ── Configuración de conexión ─────────────────────────────────
# En CI estas variables las inyecta GitHub Actions (secrets/env)
# En local puedes exportarlas antes de correr el script:
#   export DB_HOST=localhost DB_PORT=3306 DB_USER=root DB_PASS=tu_password DB_NAME=mi_lupita
DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-3306}"
DB_USER="${DB_USER:-root}"
DB_PASS="${DB_PASS:-}"
DB_NAME="${DB_NAME:-mi_lupita}"

# ── Helpers ──────────────────────────────────────────────────
PASS=0
FAIL=0

mysql_cmd() {
    mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" ${DB_PASS:+-p"$DB_PASS"} \
          "$DB_NAME" --batch --skip-column-names -e "$1" 2>/dev/null
}

assert() {
    local descripcion="$1"
    local resultado="$2"
    local esperado="$3"

    if [ "$resultado" = "$esperado" ]; then
        echo "  [PASS] $descripcion"
        PASS=$((PASS + 1))
    else
        echo "  [FAIL] $descripcion"
        echo "         esperado='$esperado'  obtenido='$resultado'"
        FAIL=$((FAIL + 1))
    fi
}

# ── Test: conexión básica ─────────────────────────────────────
echo ""
echo "=== Conexión ==="
resultado=$(mysql_cmd "SELECT 1;" 2>&1)
if echo "$resultado" | grep -q "1"; then
    echo "  [PASS] Conexión a MySQL exitosa"
    PASS=$((PASS + 1))
else
    echo "  [FAIL] No se pudo conectar a MySQL"
    echo "         $resultado"
    FAIL=$((FAIL + 1))
    echo ""
    echo "RESULTADO: 0 pasaron, 1 falló — abortando (sin conexión no hay nada más que probar)"
    exit 1
fi

# ── Test: existencia de la BD ─────────────────────────────────
echo ""
echo "=== Base de datos ==="
bd=$(mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" ${DB_PASS:+-p"$DB_PASS"} \
    --batch --skip-column-names \
    -e "SELECT SCHEMA_NAME FROM information_schema.SCHEMATA WHERE SCHEMA_NAME='$DB_NAME';" 2>/dev/null)
assert "La base de datos '$DB_NAME' existe" "$bd" "$DB_NAME"

# ══════════════════════════════════════════════════════════════
# TEST POR TABLA — adapta los nombres y columnas a tu esquema real
# (revisa tus archivos .java en src/ para ver los nombres exactos)
# ══════════════════════════════════════════════════════════════

# ── Tabla: productos ─────────────────────────────────────────
echo ""
echo "=== Tabla: productos ==="

existe=$(mysql_cmd "SELECT COUNT(*) FROM information_schema.TABLES
                    WHERE TABLE_SCHEMA='$DB_NAME' AND TABLE_NAME='productos';")
assert "Tabla 'productos' existe" "$existe" "1"

if [ "$existe" = "1" ]; then
    # Verifica columnas clave
    col_id=$(mysql_cmd "SELECT COUNT(*) FROM information_schema.COLUMNS
                        WHERE TABLE_SCHEMA='$DB_NAME' AND TABLE_NAME='productos'
                        AND COLUMN_NAME='id_producto';")
    assert "  Columna 'id_producto' existe" "$col_id" "1"

    col_nombre=$(mysql_cmd "SELECT COUNT(*) FROM information_schema.COLUMNS
                            WHERE TABLE_SCHEMA='$DB_NAME' AND TABLE_NAME='productos'
                            AND COLUMN_NAME='nombre';")
    assert "  Columna 'nombre' existe" "$col_nombre" "1"

    col_precio=$(mysql_cmd "SELECT COUNT(*) FROM information_schema.COLUMNS
                            WHERE TABLE_SCHEMA='$DB_NAME' AND TABLE_NAME='productos'
                            AND COLUMN_NAME='precio';")
    assert "  Columna 'precio' existe" "$col_precio" "1"

    # CRUD básico: insert → select → delete
    mysql_cmd "INSERT INTO productos (nombre, precio) VALUES ('__test_producto__', 9.99);" 2>/dev/null
    insert_ok=$(mysql_cmd "SELECT COUNT(*) FROM productos WHERE nombre='__test_producto__';")
    assert "  INSERT en 'productos' funciona" "$insert_ok" "1"

    mysql_cmd "DELETE FROM productos WHERE nombre='__test_producto__';" 2>/dev/null
    delete_ok=$(mysql_cmd "SELECT COUNT(*) FROM productos WHERE nombre='__test_producto__';")
    assert "  DELETE en 'productos' funciona" "$delete_ok" "0"
fi

# ── Tabla: ventas ─────────────────────────────────────────────
echo ""
echo "=== Tabla: ventas ==="

existe_v=$(mysql_cmd "SELECT COUNT(*) FROM information_schema.TABLES
                      WHERE TABLE_SCHEMA='$DB_NAME' AND TABLE_NAME='ventas';")
assert "Tabla 'ventas' existe" "$existe_v" "1"

if [ "$existe_v" = "1" ]; then
    col_total=$(mysql_cmd "SELECT COUNT(*) FROM information_schema.COLUMNS
                           WHERE TABLE_SCHEMA='$DB_NAME' AND TABLE_NAME='ventas'
                           AND COLUMN_NAME='total';")
    assert "  Columna 'total' existe" "$col_total" "1"
fi

# ── Tabla: deudores ───────────────────────────────────────────
echo ""
echo "=== Tabla: deudores ==="

existe_d=$(mysql_cmd "SELECT COUNT(*) FROM information_schema.TABLES
                      WHERE TABLE_SCHEMA='$DB_NAME' AND TABLE_NAME='deudores';")
assert "Tabla 'deudores' existe" "$existe_d" "1"

if [ "$existe_d" = "1" ]; then
    col_monto=$(mysql_cmd "SELECT COUNT(*) FROM information_schema.COLUMNS
                           WHERE TABLE_SCHEMA='$DB_NAME' AND TABLE_NAME='deudores'
                           AND COLUMN_NAME='monto';")
    assert "  Columna 'monto' existe" "$col_monto" "1"
fi

# ── Tabla: usuarios / login ───────────────────────────────────
echo ""
echo "=== Tabla: usuarios ==="

existe_u=$(mysql_cmd "SELECT COUNT(*) FROM information_schema.TABLES
                      WHERE TABLE_SCHEMA='$DB_NAME' AND TABLE_NAME='usuarios';")
assert "Tabla 'usuarios' existe" "$existe_u" "1"

# ── Resumen ───────────────────────────────────────────────────
echo ""
echo "════════════════════════════════════"
echo " RESULTADO FINAL"
echo "  Pasaron : $PASS"
echo "  Fallaron: $FAIL"
echo "════════════════════════════════════"
echo ""

[ "$FAIL" -eq 0 ] && exit 0 || exit 1
