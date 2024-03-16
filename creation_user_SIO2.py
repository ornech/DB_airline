etudiants = [
    (1, 'Matthieub', '12112003'),
    (2, 'Victor', '13092001'),
    (3, 'Elowan', '14082004'),
    (4, 'Corentin', '04082004'),
    (5, 'Angel', '28122004'),
    (6, 'Lheo', '15122003'),
    (7, 'Aleksander', '04102004'),
    (8, 'Matheo', '17122004'),
    (9, 'Mathieup', '22072003'),
    (10, 'Chloe', '08072004')
]

for etudiant in etudiants:
    # print("DROP DATABASE IF EXISTS airline_" + etudiant[1] + ";")
    print("CREATE DATABASE IF NOT EXISTS airline_" + etudiant[1] + ";")
    # print("DROP USER IF EXISTS 'SIO2-" + etudiant[1] + "'@'%' ;")
    print("CREATE USER IF NOT EXISTS 'SIO2-" + etudiant[1] + "'@'%' IDENTIFIED BY '" + etudiant[2] + "';")  # Affiche le nom de l'étudiant
    print("GRANT SELECT, INSERT, UPDATE, EXECUTE, ALTER, CREATE, TRIGGER, ALTER ROUTINE, CREATE ROUTINE, SHOW VIEW ON airline_" + etudiant[1] + ".* TO 'SIO2-" + etudiant[1] + "'@'%';")

print("FLUSH PRIVILEGES;")
