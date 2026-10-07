from PIL import Image
import os

for carpeta in ["assets/objetos"]:
    for archivo in os.listdir(carpeta):
        if archivo.endswith(".png"):
            img = Image.open(f"{carpeta}/{archivo}")
            img = img.resize((64, 64))
            img.save(f"{carpeta}/{archivo}")
            print(f"✓ {archivo}")