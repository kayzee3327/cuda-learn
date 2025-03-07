import random

def generate_line(tot):
    return ' '.join(str(random.randint(0, 100)) for _ in range(tot))

total = 1024
with open("arrays.txt", 'w') as f:
    f.write(str(total) + "\n")
    f.write(generate_line(total) + '\n')
    f.write(generate_line(total) + '\n')