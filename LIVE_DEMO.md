# FieldScope — Live Demo

Esta variante permite publicar FieldScope como una demo web pública sin afirmar que QVAC está ejecutándose en el servidor.

## Qué cambia en modo público

- El frontend y FastAPI se sirven desde el mismo dominio.
- `PUBLIC_DEMO=true` desactiva la restricción de host local.
- `QVAC_ENABLED=false` y `QVAC_REQUIRED=false` activan explícitamente el extractor determinístico de desarrollo.
- El estado visual indica `Live Demo · Datos sintéticos` / `Extractor determinístico · Demo web`.
- El dictado por voz se deshabilita en la demo web; sigue disponible en la ejecución local con QVAC.
- `AUTO_SEED_DEMO=true` carga el dataset sintético cuando la base está vacía.
- La base de la configuración de Render se guarda en `/tmp`, por lo que esta demo no debe usarse como almacenamiento persistente.

## Desplegar en Render

1. Sube esta carpeta a tu repositorio GitHub.
2. En Render elige **New > Blueprint**.
3. Conecta el repositorio y selecciona la rama que contiene `render.yaml`.
4. Aprueba el Blueprint y despliega.
5. Abre la URL `https://<tu-servicio>.onrender.com`.

No necesitas configurar claves de IA para esta variante.

## Ejecución local de la variante web

Desde `backend/`:

```bash
PUBLIC_DEMO=true \
AUTO_SEED_DEMO=true \
QVAC_ENABLED=false \
QVAC_REQUIRED=false \
DATABASE_URL=sqlite:////tmp/fieldscope-demo.db \
uvicorn main:app --host 0.0.0.0 --port 8001
```

Abre `http://127.0.0.1:8001`.

## Importante

Esta es una demo pública y usa únicamente datos ficticios. No ingreses datos reales de clientes, pacientes ni información confidencial. La versión local original con QVAC conserva el objetivo de inferencia on-device.
