from PIL import Image
import os

for carpeta in ["assets/personajes/Juggernaut/Quieto"]:
    for archivo in os.listdir(carpeta):
        if archivo.endswith(".png"):
            img = Image.open(f"{carpeta}/{archivo}")
            img = img.resize((80,80))
            img.save(f"{carpeta}/{archivo}")
            print(f"✓ {archivo}")