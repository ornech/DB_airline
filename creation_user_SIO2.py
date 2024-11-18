etudiants = [
    (1, 'etu1', '12112003'),
    (2, 'etu2', '13092001'),
    (3, 'etu3', '14082004'),
]

for etudiant in etudiants:
    print("CREATE DATABASE IF NOT EXISTS airline_" + etudiant[1] + ";")
    print("CREATE USER IF NOT EXISTS 'SIO2-" + etudiant[1] + "'@'%' IDENTIFIED BY '" + etudiant[2] + "';")  # Affiche le nom de l'étudiant
    print("GRANT SELECT, INSERT, UPDATE, EXECUTE, ALTER, CREATE, TRIGGER, ALTER ROUTINE, CREATE ROUTINE, SHOW VIEW ON airline_" + etudiant[1] + ".* TO 'SIO2-" + etudiant[1] + "'@'%';")

print("FLUSH PRIVILEGES;")
