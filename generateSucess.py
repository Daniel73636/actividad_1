import random
import string
import os

# Longitud mínima y máxima de las contraseñas
min_length = 8
max_length = 20

# Caracteres permitidos en las contraseñas
characters = string.ascii_letters + string.digits + string.punctuation

# Contraseña a comparar
password_to_compare = 'q2e4t6u8o01032249398'

# Verificar si el archivo existe o crearlo
if not os.path.exists('contraseñas.txt'):
    open('contraseñas.txt', 'w').close()

# Abrir el archivo en modo de lectura para verificar contraseñas existentes
with open('contraseñas.txt', 'r') as f:
    existing_passwords = set(line.strip() for line in f)

# Generar y verificar contraseñas indefinidamente
while True:
    length = random.randint(min_length, max_length)
    password = ''.join(random.choice(characters) for _ in range(length))
    if password not in existing_passwords:
        existing_passwords.add(password)
        if password == password_to_compare:
            print(f'La contraseña generada es igual a "{password_to_compare}".')
            break

            # Escribir la contraseña generada en el archivo
            with open('contraseñas.txt', 'a') as f:
                f.write(password + '\n')
        else:
            # Guardar la contraseña generada en el archivo
            with open('contraseñas.txt', 'a') as f:
                f.write(password + '\n')

print('Generación de contraseñas finalizada.')








#print("llegar a la respuesta deseada es imposible utilisando el dispositivo y el almasenamiento que tengo ahora pero talves en 10 años tenga las tecnologias y recursoso sufisientes para lograr hacer una libreria de contraseñas en español que sea 100% capas de desifrar una contraseña que tenga un intervalo de 8 a 20 caracteres inclullendo simbolos especiales  y letras tanto en mayusculas como en minusculas y los numeros del 0 al 9 ya que guardar todas esas posibles contraseña demandan un total de almasenamiendo de 1.752.256.845.150,4 y en estos momentos conseguir dicha cantidad de almacenamiento en un dispositivo portatil o incluso en una sofisticada computadora de mesa alcansar dicha cantidad de almacenamiento es imposible :(")





